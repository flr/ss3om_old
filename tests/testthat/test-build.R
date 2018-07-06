# test-build.R - DESC
# /test-build.R

# Copyright European Union, 2018
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# SMA: 2 units (sex)

out <- r4ss::SS_output("sma", repfile="Report.sso.bz2",
  compfile="CompReport.sso.bz2", covarfile="covar.sso.bz2",
  warn=FALSE, verbose=FALSE, printstats=FALSE, hidewarn=TRUE)

# BET: 4 seasons, 4 units (birth seasons)

out <- r4ss::SS_output("bet", repfile="Report.sso.bz2",
  compfile="CompReport.sso.bz2", covarfile="covar.sso.bz2",
  warn=FALSE, verbose=FALSE, printstats=FALSE, hidewarn=TRUE)

# --- ALB: 4 seasons, 2 units (sex)

out <- r4ss::SS_output("alb", repfile="Report.sso.bz2",
  compfile="CompReport.sso.bz2", covarfile="covar.sso.bz2",
  warn=FALSE, verbose=FALSE, printstats=FALSE, hidewarn=TRUE)

# FLStock

stk <- buildFLSss3(out, birthseas=4)

validObject(stk)
verify(stk)

# FLSR

# bet: recruit$SpawnBio = ssb(srr)[,,4,1]

srr <- buildFLSRss3(out)

validObject(srr)

plot(srr)

summary(srr)

# FLIndices

# cpue[, Vuln_bio := Exp / Eff_Q]
# TODO cpue[, Dev := Obs - Exp] ??
# cpue <- data.table(out$cpue)
# cpue[, newDev := Obs - Exp]
# cpue[, expDev := exp(Dev)]

idx <- buildFLIBss3(out)
idx <- buildFLIBss3(out, fleets=1)
# idx <- buildFLIBss3(out, fleets=6)
idx <- buildFLIBss3(out, fleets=1:2)
idx <- buildFLIBss3(out, fleets=c("LLCPUE3"))
# idx <- buildFLIBss3(out, fleets=c("LLCPUE8"))

# FLBiol + FLFisheries
# BUG fbf <- buildFLBFss3(out)

# rpts
rps <- buildFLRPss3(out)

# Results
results(stk) <- buildRESss3(out)

# Kobe
kobe <- buildKobess3(out)
