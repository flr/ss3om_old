# test-load.R - DESC
# /test-load.R

# Copyright European Union, 2017
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

library(ss3om)

# read*

# FLStock
system.time(
simple_3.24 <- readFLSss3(system.file("ext-data/simple_3.24", package="ss3om"),
  name="simple", repfile="Report.sso.bz2", compfile="CompReport.sso.bz2")
)

# FLBiol + FLFisheries
system.time(
simple_3.24f <- readFLBFss3(system.file("ext-data/simple_3.24", package="ss3om"),
  repfile="Report.sso.bz2", compfile="CompReport.sso.bz2", wtfile="wtatage.ss_new",
  covarfile="covar.sso.bz2", birthseas=1)
)

# FLindexBiomass for LLCPUE3
system.time(
simplei <- readFLIBss3(system.file("ext-data/simple_3.24", package="ss3om"), birthseas=1,
  fleets=c(SURVEY1=1), repfile="Report.sso.bz2", compfile="CompReport.sso.bz2")
)

# RPs df
vars <- list(TotBio_Unfished=3, SPB_1950=3, SSB_MSY=3, SPB_2014=3, F_2014=3,
  Fstd_MSY=3, TotYield_MSY=3, `SR_LN(R0)`=3)

system.time(
simplerps <- readRPss3(system.file("ext-data/simple_3.24", "Report.sso.bz2",
  package="ss3om"), vars)
)
