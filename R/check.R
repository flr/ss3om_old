# check.R - DESC
# /check.R

# Copyright European Union, 2018
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# checkFLSss3 {{{

checkFLSss3 <- function(object, dir, ...) {

  out <- SS_output(dir, verbose=FALSE, hidewarn=TRUE, warn=FALSE,
    printstats=FALSE, covar=FALSE, forecast=TRUE, ...)

  derived_quants <- data.table(out$derived_quants)
  
  # SSB
  ssb3 <- derived_quants[Label %in% paste0("SSB_", seq(out$startyr, out$endyr)), Value]
  ssbf <- c(ssb(object))

  return(TRUE)

} # }}}
