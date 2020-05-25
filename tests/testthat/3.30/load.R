# load.R - DESC
# /load.R

# Copyright Iago MOSQUEIRA (WMR), 2020
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2


library(ss3om)
load_all('~/Projects/flr/pkgs/stable/ss3om')

simp <- readFLSss3('simple', repfile="Report.sso.gz",
  compfile="CompReport.sso.gz")

simd <- readFLSss3('simple_discards', repfile="Report.sso.gz",
  compfile="CompReport.sso.gz")

empw <- readFLSss3('empirical_wtatage', repfile="Report.sso.gz",
  compfile="CompReport.sso.gz")


out <- SS_output('simple_discards', repfile="Report.sso.gz",
  compfile="CompReport.sso.gz", covarfile="covar.sso.gz")



# TODO WRITE expectation

# CHECK

foo(stock, out) {

# ssb ~ out$recruit$SpawnBio
expect_equal(c(unitSums(ssb(stock)[,,,1])),
  subset(out$recruit, era == "Main")$SpawnBio,
  tolerance=0.0001)

# rec ~ out$recruit$pred_recr
expect_equal(c(unitSums(rec(stock))),
  subset(out$recruit, era == "Main")$pred_recr,
  tolerance=0.0001)

# catch ~ out$catch$Obs
expect_equal(c(unitSums(catch(stock))),
 data.table(out$catch)[Yr %in% dimnames(catch(stock))$year, ]$Obs,
 tolerance=0.0001)

# fbar ~ out$exploitation$annual_F
# DEBUG
expect_equal(c(unitMeans(fbar(stock))),
 data.table(out$exploitation)[Yr %in% dimnames(fbar(stock))$year, ]$annual_F,
 tolerance=0.0001)

}

# harvest ~ out$Z_at_age - out$M_at_age

data.table(out$Z_at_age)[, -seq(1,3)] -
data.table(out$M_at_age)[, -seq(1,3)]

