# check.R - DESC
# /check.R

# Copyright European Union, 2015-2019; WMR, 2020.
# Author: Iago Mosqueira (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# TODO checkFLSss3 {{{

checkFLSss3 <- function(object, dir, ...) {

  out <- readOutputss3(dir)

  spread(lapply(out[c("derived_quants", "discard", "Kobe")], data.table))

  # SSB: derived_quants$SSB_ ~ ssb(object)[,,, spawnseas] - 1%

  ssb3 <- derived_quants[Label %in% paste0("SSB_", seq(out$startyr, out$endyr)), Value]

  ssbo <- c(unitSums(ssb(object)[,,,out$spawnseas]))

  # unitSums(ssb(object)[,,,out$spawnseas])
  # unitSums(quantSums(stock.n(object)[,,,4] * stock.wt(object)[,,,4] * mat(object)[,,,1]))

  if(any(1 - (ssbo / ssb3) > 0.01))
    warning("SSB in one or more years differs by more than 1%")

  # REC
  fs <- derived_quants[Label %in% paste0("F_", seq(out$startyr, out$endyr)), Value]

  # F
  
  # DISCARDS
 if(!is.na(discard)) {
    dis3 <- discard[, .(Fleet, Yr, Exp_cat)]
    setnames(dis3, c("qname", "year", "data"))
    dis3 <- as(dis3, "FLQuants")
    dis3 <- lapply(mcf(dis3), function(x) {x[is.na(x)] <- 0; x})
    dis3 <- Reduce("+", dis3)
  

    # FROM discards.n
    unitSums(discards(object))
    window(unitSums(quantSums(discards.n(object) * discards.wt(object))), start=1986)
  }

  window(unitSums(quantSums(catch.n * catch.wt)), start=1986)

  return(TRUE)

} # }}}

# extractSS {{{

#' Extracts derived quantities from SS output
#'
#' A number of derived quantities are available in the *Report.sso* file, and
#' are useful for checking that the generated FLR objects lead to the same
#' values. These functions are called on the list returned by *readOutputss3*
#' or r4ss::SS_output, and extract the yearly values from the following rows
#' in the *derived_quants* data.frame:
#'
#' - *extractSSB*: `SSB_y` for y between `startyr` and `endyr`.
#' - *extractRec*: `Recr_y` for y between `startyr` and `endyr`.
#' - *extractFbar*: `F_y` for y between `startyr` and `endyr`.
#'
#' For 2 sex models (`nsexes`), *extractRec* will return a two-unit *FLQuant*,
#' with the `Recr_y` values split according to the recruitment sex ratio. This
#' is extracted from `recruitment_dist[[1]][, "Frac/sex"]`.
#'
#' The value returned by `extractFbar` is the actual mean F over the age range,
#' and the value in `derived_quants` is corrected according to `F_report_basis`
#' for models where F reporting basis is F/FMSY.
#'
#' @param out A list as returned by r4ss::SS_output.
#'
#' @return An *FLQuant* object of the requested quantity.
#' @rdname extractSS
#'
#' @examples
#' out <- readOutputss3(system.file("ext-data", "alb", package="ss3om"),
#'   compress="bz2")
#'
#' extractSSB(out)
#'
#' extractFbar(out)

extractSSB <- function(out) {

  ssb <- data.table(out$derived_quants)[Label %in% paste0("SSB_",
    seq(out$startyr, out$endyr)), Value]

  return(FLQuant(ssb, dimnames=list(age="all", year=seq(out$startyr, out$endyr),
    unit=c("unique", "F")[out$nsexes]), units="t"))
}

#' @rdname extractSS
extractRec <- function(out) {
  
  rec <- data.table(out$derived_quants)[Label %in% paste0("Recr_",
    seq(out$startyr, out$endyr)), Value] *
    out$recruitment_dist[[1]][, "Frac/sex"]

  return(FLQuant(rec, dimnames=list(age="all", year=seq(out$startyr, out$endyr),
    unit=list("unique", c("F", "M"))[[out$nsexes]]), units="1000"))
}

#' @rdname extractSS
extractFbar <- function(out) {
  fbar <- data.table(out$derived_quants)[Label %in% paste0("F_",
    seq(out$startyr, out$endyr)), Value]

  if(grepl("3.24", out$SS_version, fixed = TRUE))
    row <- "Fstd_MSY"
  else
    row <- "annF_MSY"

  # F_report_basis F/Fmsy
  if(grepl("(F)/(Fmsy)", out$F_report_basis, fixed=TRUE)) {
    fbar <- fbar * out$derived_quants[row, "Value"]
  } else {
    warning(paste("Returned F is relative to", out$F_report_basis))
  }

  return(FLQuant(fbar, dimnames=list(age="all", year=seq(out$startyr, out$endyr),
    unit=list("unique")), units="f"))
}
# }}}
