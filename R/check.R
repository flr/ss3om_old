# check.R - DESC
# /check.R

# Copyright European Union, 2018
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# SSB

# catch.n ~ stock.n + harvest + m


# checkFLSss3 {{{

checkFLSss3 <- function(object, dir, ...) {

  out <- SS_output(dir, verbose=FALSE, hidewarn=TRUE, warn=FALSE,
    printstats=FALSE, covar=FALSE, forecast=TRUE, ...)

  # EXTRACT elements to use
  # discard, derived_quants, Kobe
  spread(lapply(out[c("derived_quants", "discard", "Kobe")], data.table))

  # SSB
  ssb3 <- derived_quants[Label %in% paste0("SSB_", seq(out$startyr, out$endyr)), Value]
  ssbf <- c(unitSums(ssb(object)))

  # DISCARDS
  dis3 <- discard[, .(Fleet, Yr, Exp_cat)]
  setnames(dis3, c("qname", "year", "data"))
  dis3 <- as(dis3, "FLQuants")
  dis3 <- lapply(mcf(dis3), function(x) {x[is.na(x)] <- 0; x})
  dis3 <- Reduce("+", dis3)

  # FROM discards.n
  unitSums(discards(object))
  window(unitSums(quantSums(discards.n(object) * discards.wt(object))), start=1986)
  window(unitSums(quantSums(catch.n * catch.wt)), start=1986)

  return(TRUE)

} # }}}
