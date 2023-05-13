# test-fwd.R - DESC
# ss3om/tests/testthat/test-fwd.R

# Copyright (c) WUR, 2023.
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2


library(ss3om)
library(FLasher)
library(patchwork)

# LOAD SS_output
# - Using own ss3om function to deal with compressed files

out <- readOutputss3(file.path("3.30", "yftio"))

# BUILD FLFisheries + FLBiol
# - Returned as list with elements 'biol' and 'fisheries'

oms <- buildFLBFss330(out)

# EXTRACT bio and fis

bio <- oms$biol
fis <- oms$fisheries

# RUN hindcast

# ASSEMBLE fwdControl for catch by fleet/year/season
# - Akward syntax, need to add a way to do this using as(, 'fwdControl')

x <- unitSums(window(catch(fis), start=2000, end=2017))

# LOOP over fleet names and merge
ctl <- Reduce(merge,

  # CREATE a fwdControl from each fleet catch series
  lapply(names(x), function(i) {
    ct <- as(FLQuants(catch=x[[i]]), 'fwdControl')
  
    # SET fishery name or number
    ct$fishery <- i
    # SET biol to NA, catch target
    ct$biol <- NA
    # SET catch to only one
    ct$catch <- 1

    return(ct)
  })
)

# RUN hindcast
# - Provide SRR residuals from fit

hin <- fwd(bio, fis, control=ctl, deviances=sr(bio)$residuals)

# COMPARE runs

plot(hin$bio) + plot(bio)

plot(tsb(bio), tsb(hin$bio))

plot(ssb(bio), ssb(hin$bio))

