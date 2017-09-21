# test-load.R - DESC
# /test-load.R

# Copyright European Union, 2017
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

library(ss3om)

# read*

# FLStock
ioalb <- readFLSss3(system.file("ext-data/ioalb", package="ss3om"),
  name="ALB", repfile="Report.sso.bz2", compfile="CompReport.sso.bz2")

# FLBiol + FLFisheries
ioalbf <- readFLBFss3(system.file("ext-data/ioalb", package="ss3om"),
  repfile="Report.sso.bz2", compfile="CompReport.sso.bz2", wtfile="wtatage.ss_new.bz2",
  covarfile="covar.sso.bz2", birthseas=4)

# FLindexBiomass
iocp <- readFLIBss3(system.file("ext-data/ioalb", package="ss3om"),
  fleets=c(LLCPUE1=1), repfile="Report.sso.bz2", compfile="CompReport.sso.bz2")

# RPs df
vars <- list(TotBio_Unfished=3, SPB_1950=3, SSB_MSY=3, SPB_2014=3, F_2014=3,
  Fstd_MSY=3, TotYield_MSY=3, `SR_LN(R0)`=3)

iorps <- readRPss3(system.file("ext-data/ioalb", "Report.sso.bz2", package="ss3om"), vars)

loadres(system.file("ext-data/ioalb", package="ss3om"), vars=vars,
  repfile="Report.sso.bz2", covarfile="covar.sso.bz2")
