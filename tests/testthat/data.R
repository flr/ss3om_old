# data.R - DESC
# /home/mosquia/Projects/FLR/pkgs/mine/ss3om/tests/testtha

# Copyright (c) WUR, 2022.
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2


library(ss3om)

paths <- c("adrhke", "albio", "herring", "ang", "vendace")

stocks <- lapply(setNames(file.path("3.30", paths), nm=paths),
  function(x) list(stock=readFLSss3(x), srr=readFLSRss3(x))
)

save(stocks, file="stocks.Rdata", compress="xz")

# HINDCAST

st <- stocks[[4]]

hin <- fwd(simplify(st$stock, "season"), 
  catch=seasonSums(unitSums(catch(st$stock[,-1]))), sr=st$srr, 
  deviances=seasonSums(residuals(st$srr)))

plot(simplify(st$stock, "season"), hin)
