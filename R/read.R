# readSS3.R - DESC
# ioalbmse/R/readSS3.R

# Copyright European Union, 2015-2019; WMR, 2020.
# Author: Iago Mosqueira (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.


# readFLSss3 {{{

#' A function to read SS3 results as an FLStock object
#'
#' Results of a run of the Stock Synthesis sofware, SS3 (Methot & Wetzel, 2013),
#' can be loaded into an object of class \code{\link{FLStock}}. The code makes
#' use of the r4ss::SS_output function to obtain a list from Report.sso. The
#' following elements of that list are used to generate the necessary information
#' for the slots in \code{\link{FLStock}}: "catage", "natage", "ageselex",
#' "endgrowth", "catch_units", "nsexes", "nseasons", "nareas", "IsFishFleet",
#' "fleet_ID", "FleetNames", "spawnseas", "inputs" and "SS_version".
#'
#' @references
#' Methot RD Jr, Wetzel CR (2013) Stock Synthesis: A biological and statistical
#' framework for fish stock assessment and fishery management.
#' Fisheries Research 142: 86-99.
#'
#' @param dir Directory holding the SS3 output files
#' @param birthseas Birth seasons for this stock, defaults to spawnseas
#' @param name Name of the output object to fil the name slot
#' @param desc Description of the output object to fill the desc slot
#' @param ... Any other argument to be passed to `r4ss::SS_output`
#'
#' @return An object of class `\link{FLStock}`
#'
#' @name readFLSss3
#' @rdname readFLSss3
#' @aliases readFLSss3
#'
#' @author The FLR Team
#' @seealso \link{FLComp}
#' @keywords classes

readFLSss3 <- function(dir, repfile="Report.sso", compfile="CompReport.sso", ...) {

  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)
  
  if(out$SS_versionNumeric > 3.24)
    buildFLSss330(out, ...)
  else
    buildFLSss3(out, ...)
} # }}}

# readFLIBss3 {{{

#' A function to read the CPUE series from an SS3 run into an `FLIndex` object
#'
#' @references
#' Methot RD Jr, Wetzel CR (2013) Stock Synthesis: A biological and statistical
#' framework for fish stock assessment and fishery management.
#' Fisheries Research 142: 86-99.
#'
#' @param dir Directory containing the SS3 output files
#' @param birthseas The birthseasons for this stock as a numeric vector.
#' @param ... Any other argument to be passed to `r4ss::SS_output`
#'
#' @return An object of class [FLStock][FLCore::FLStock]
#'
#' @name readFLIBss3
#' @rdname readFLIBss3
#' @aliases readFLIBss3
#'
#' @author Iago Mosqueira, EC JRC
#' @seealso \link{FLComp}
#' @keywords classes

readFLIBss3 <- function(dir, fleets, birthseas=out$birthseas, ...) {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)

  if(out$SS_versionNumeric > 3.24)
    buildFLIBss330(out, fleets=fleets, birthseas=out$birthseas, ...)
  else
    buildFLIBss3(out, fleets=fleets, birthseas=out$birthseas, ...)
} # }}}

# readFLSRss3 {{{

#' A function to read the stock-recruit relationships from an SS3 run into an `FLSR` object
#'
#' @references
#' Methot RD Jr, Wetzel CR (2013) Stock Synthesis: A biological and statistical
#' framework for fish stock assessment and fishery management.
#' Fisheries Research 142: 86-99.
#'
#' @param dir Directory containing the SS3 output files
#' @param birthseas The birthseasons for this stock as a numeric vector.
#' @param ... Any other argument to be passed to `r4ss::SS_output`
#'
#' @return An object of class [FLStock][FLCore::FLStock]
#'
#' @name readFLSRss3
#' @rdname readFLSRss3
#' @aliases readFLSRss3
#'
#' @author Iago Mosqueira, EC JRC
#' @seealso \link{FLComp}
#' @keywords classes

readFLSRss3 <- function(dir, birthseas=out$birthseas, ...) {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)

  buildFLSRss3(out, birthseas=out$birthseas, ...)

} # }}}

# readFLRPss3 {{{
readFLRPss3 <- function(dir, ...) {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)

  if(out$SS_versionNumeric > 3.24)
    buildFLRPss330(out, ...)
  else
   buildFLRPss3(out, ...)

} # }}}

# readRESss3 {{{
readRESss3 <- function(dir, repfile="Report.sso", compfile="CompReport.sso", ...) {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)

  if(out$SS_versionNumeric > 3.24)
    buildRESss330(out, ...)
  else
    buildRESss3(out, ...)

} # }}}

# readKobess3 {{{
readKobess3 <- function(dir, ...) {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)

  if(out$SS_versionNumeric > 3.24)
    stop("ss3om currently only supports SS3 <= 3.24")

  buildKobess3(out, ...)

} # }}}

# readFLomss3 {{{
readFLomss3 <- function(dir, birthseas=out$birthseas, fleets, ...) {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)

  if(out$SS_versionNumeric > 3.24)
    stop("ss3om currently only supports SS3 <= 3.24")

  # FLS
  stk <- buildFLSss3(out, birthseas=birthseas, ...)

  # FLSR
  srr <- buildFLSRss3(out)

  # RPs
  rps <- buildFLRPss3(out)

  return(FLom(stock=stk, sr=srr, brp=rps))
} # }}}

# readFLoemss3 {{{
readFLoemss3 <- function(dir, fleets, ...) {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)

  if(out$SS_versionNumeric > 3.24)
    stop("ss3om currently only supports SS3 <= 3.24")

  # FLIB
  idx <- buildFLIBss3(out, fleets=fleets)

  # TODO FLS
  
  oem <- FLoem(observations=list(idx=idx))

  return(oem)
} # }}}

# readFLomess3 {{{
readFLomeOMss3 <- function(dir, birthseas=out$birthseas, fleets, ...) {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)

  if(out$SS_versionNumeric > 3.24)
    stop("ss3om currently only supports SS3 <= 3.24")

  # FLS
  stk <- buildFLSss3(out, birthseas=birthseas, ...)

  # FLSR
  srr <- buildFLSRss3(out)

  # FLIB
  idx <- buildFLIBss3(out, fleets=fleets)

  # RPs
  rps <- buildFLRPss3(out)

  # Results
  res <- buildRESss3(out)

  om <- FLom(stock=stk, sr=srr, brp=rps)
  attr(om, "res") <- res

  oem <- FLoem(observations=list(idx=idx))

  return(list(om=om, oem=oem))
} # }}}

# readOMSss3 {{{
readOMSss3 <- function(dir, birthseas=out$birthseas, fleets, ...) {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)

  if(out$SS_versionNumeric > 3.24)
    stop("ss3om currently only supports SS3 <= 3.24")

  # FLS
  stk <- buildFLSss3(out, birthseas=birthseas, ...)

  # FLSR
  srr <- buildFLSRss3(out)

  # FLIB
  idx <- buildFLIBss3(out, fleets=fleets)

  # RPs
  rps <- buildFLRPss3(out)

  # Results
  res <- buildRESss3(out)

  return(list(stock=stk, sr=srr, indices=idx, refpts=rps, results=res))
} # }}}

# readOMSss3 {{{
readSRIss3 <- function(dir, birthseas=out$birthseas, fleets, ...) {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)

  if(out$SS_versionNumeric > 3.24)
    stop("ss3om currently only supports SS3 <= 3.24")

  # FLSR
  srr <- buildFLSRss3(out)

  # FLIB
  idx <- buildFLIBss3(out, fleets=fleets)

  return(list(sr=srr, indices=idx))
} # }}}

# readOMSss3 {{{
readRESIDss3 <- function(dir, birthseas=out$birthseas, fleets, ...) {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)

  if(out$SS_versionNumeric > 3.24)
    stop("ss3om currently only supports SS3 <= 3.24")

  # FLSR
  srr <- buildFLSRss3(out)@residuals

  # FLIB
  idx <- lapply(buildFLIBss3(out, fleets=fleets), index.var)
  
  return(list(sr=srr, indices=idx))
} # }}}

# readCDss3 {{{
readCDss3 <- function(dir, name) {

  # SET ctl, dat full paths
  ctlf <- file.path(dir, paste0(name, ".ctl"))
  datf <- file.path(dir, paste0(name, ".dat"))
 	
  # READ source files
  dat <- SS_readdat(datf, verbose=FALSE)
  ctl <- SS_readctl(file=ctlf, use_datlist=T, datlist=dat,
    verbose=FALSE)

  list(ctl=ctl, dat=dat)
} # }}}
