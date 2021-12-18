# figures.R - DESC
# /figures.R

# Copyright Iago MOSQUEIRA (WMR), 2021
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2


library(ss3om)
library(ggplot2)

# FLStock

stk <- readFLSss3(system.file("ext-data", "herring", package="ss3om"),
  range = c(minfbar = 1, maxfbar = 5))

png(filename="her.png", type="cairo", units="in",
  width=7, height=6, pointsize=16, res=96)

plot(stk) + ggtitle("HER 27.30.31")

dev.off()

# FLSR

srr <- readFLSRss3(system.file("ext-data", "herring", package="ss3om"))

png(filename="hersrr.png", type="cairo", units="in",
  width=7, height=6, pointsize=16, res=96)

plot(srr)

dev.off()
