# alb.R - DESC
# /alb.R

# Copyright European Union, 2018
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# XX {{{
# }}}

library(ss3om)

alb <- readFLSss3("alb", repfile="Report.sso.bz2", compfile="CompReport.sso.bz2",
  covarfile="covar.sso.bz2")
