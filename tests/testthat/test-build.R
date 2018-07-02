# test-build.R - DESC
# /test-build.R

# Copyright European Union, 2018
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# SMA

out <- r4ss::SS_output("sma", repfile="Report.sso.bz2",
  compfile="CompReport.sso.bz2", covarfile="covar.sso.bz2",
  warn=FALSE, verbose=FALSE, printstats=FALSE, hidewarn=TRUE)

# SMA

out <- r4ss::SS_output("bet", repfile="Report.sso.gz",
  compfile="CompReport.sso.gz", covarfile="covar.sso.gz",
  warn=FALSE, verbose=FALSE, printstats=FALSE, hidewarn=TRUE)

# ALB

out <- r4ss::SS_output("alb", repfile="Report.sso.bz2",
  compfile="CompReport.sso.bz2", covarfile="covar.sso.bz2",
  warn=FALSE, verbose=FALSE, printstats=FALSE, hidewarn=TRUE)


# FLStock

stk <- buildFLSss3(out)

validObject(stk)

verify(stk)


# FLSR

srr <- buildFLSRss3(out)


# FLIndices

idx <- buildFLIBss3(out)

idx <- buildFLIBss3(out, fleets=1)

idx <- buildFLIBss3(out, fleets=1:4)

idx <- buildFLIBss3(out, fleets=c("LLCPUE3"))


# FLBiol + FLFisheries

fbf <- buildFLBFss3(out)
