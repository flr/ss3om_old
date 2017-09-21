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
ioalb <- readFLSss3(system.file("ext-data/ioalb", package="ss3om"),
  name="ALB", repfile="Report.sso.bz2", compfile="CompReport.sso.bz2")
)

# FLBiol + FLFisheries
system.time(
ioalbf <- readFLBFss3(system.file("ext-data/ioalb", package="ss3om"),
  repfile="Report.sso.bz2", compfile="CompReport.sso.bz2", wtfile="wtatage.ss_new.bz2",
  covarfile="covar.sso.bz2", birthseas=4)
)

# FLindexBiomass for LLCPUE3
system.time(
iocp <- readFLIBss3(system.file("ext-data/ioalb", package="ss3om"), birthseas=4,
  fleets=c(LLCPUE3=3), repfile="Report.sso.bz2", compfile="CompReport.sso.bz2")
)

# RPs df
vars <- list(TotBio_Unfished=3, SPB_1950=3, SSB_MSY=3, SPB_2014=3, F_2014=3,
  Fstd_MSY=3, TotYield_MSY=3, `SR_LN(R0)`=3)

system.time(
iorps <- readRPss3(system.file("ext-data/ioalb", "Report.sso.bz2", package="ss3om"), vars)
)

# ---

out <- r4ss::SS_output(system.file("ext-data/ioalb", package="ss3om"),
  verbose=FALSE, hidewarn=TRUE, warn=FALSE, printstats=FALSE, covar=FALSE,
  forecast=FALSE, repfile="Report.sso.bz2", compfile="CompReport.sso.bz2",
  wtfile="wtatage.ss_new.bz2", covarfile="covar.sso.bz2")
