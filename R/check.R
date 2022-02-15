# check.R - DESC
# /check.R

# Copyright European Union, 2015-2019; WMR, 2020.
# Author: Iago Mosqueira (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

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
#' - *extractZatage*: `Z_ay` for y between `startyr` and `endyr` and ages but last.
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
#' out <- readOutputss3(system.file("ext-data", "herring", package="ss3om"))
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
    seq(out$startyr, out$endyr)), Value] 
  # DEBUG
  # * out$recruitment_dist[[1]][, "Frac/sex"]

  return(FLQuant(rec/out$nsexes, dimnames=list(age="all", year=seq(out$startyr, out$endyr),
    unit=list("unique", c("F", "M"))[[out$nsexes]]), units="1000"))
}

#' @rdname extractSS
extractFbar <- function(out) {
  
  fbar <- data.table(out$derived_quants)[Label %in% paste0("F_",
    seq(out$startyr + 1, out$endyr)), ]
  
  if(grepl("3.24", out$SS_version, fixed = TRUE))
    row <- "Fstd_MSY"
  else
    row <- "annF_MSY"

  # F_report_basis F/Fmsy (2)
  if(grepl("(F)/(Fmsy)", out$F_report_basis, fixed=TRUE)) {
    fbar <- fbar$Value * out$derived_quants[row, "Value"]

  # F_report_basis abs_F (5)
  } else if(grepl("abs_F", out$F_report_basis, fixed=TRUE)) {
    fbar <- fbar$Value

  # 
  } else {
    fbar <- fbar$Value
    warning(paste("Returned F is relative to", out$F_report_basis))
  }
  return(FLQuant(fbar, dimnames=list(age="all",
    year=seq(out$startyr + 1, out$endyr), unit="unique"), units="f"))
}

#' @rdname extractSS

extractZatage <- function(out) {

  # OUTPUT years
  yrs <- seq(out$startyr, out$endyr)

  # REFORMAT Z_at_age
  Zmat <- out$Z_at_age[out$Z_at_age$Yr %in% yrs,]

  # SET matrix from ages columns
  Z <- as.matrix(Zmat[, -seq(1,3,)])
  # DROP last age (NA)
  Z <- Z[, -dim(Z)[2]]

  # SPLIT if 2 sex
  if(out$nsexes == 2) {
    ZF <- Z[Zmat$Sex == 1,]
    ZM <- Z[Zmat$Sex == 2,]

    z <- FLQuant(NA, dimnames=list(age=colnames(ZF),
      year=yrs, unit=c("F", "M")), units="z")
    z[,,"F",] <- t(ZF)
    z[,,"M",] <- t(ZM)
  } else {
    z <- FLQuant(NA, dimnames=list(age=colnames(Z),
      year=yrs), units="z")
    z[] <- t(Z)
  }
  return(z)
}

#' @rdname extractSS

extractDevs <- function(out) {

  dev <- data.table(out$recruit)[era == "Main", .(Yr, dev)]

  dms <- getRange(out$catage)

  return(FLQuant(dev$dev, dimnames=list(age=dms['min'], year=dev$Yr), units=""))
}
# }}}
