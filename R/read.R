# readSS3.R - DESC
# ioalbmse/R/readSS3.R

# Copyright European Union, 2015-2019; WMR, 2020.
# Author: Iago Mosqueira (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.


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

readFLIBss3 <- function(dir, fleets, birthseas=out$birthseas,
  repfile="Report.sso", compfile="CompReport.sso", ...) {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)

  if(out$SS_versionNumeric > 3.24)
    buildFLIBss330(out, fleets=fleets, birthseas=out$birthseas, ...)
  else
    buildFLIBss3(out, fleets=fleets, birthseas=out$birthseas, ...)
} # }}}

# readFLomss3 {{{
readFLomss3 <- function(dir, birthseas=out$birthseas, fleets,
  repfile="Report.sso", compfile="CompReport.sso", ...) {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)
  
  # FLS
  if(out$SS_versionNumeric == 3.24)
    stk <- buildFLSss3(out, birthseas=birthseas, ...)
  else
    stk <- buildFLSss330(out, ...)

  # FLSR
  srr <- buildFLSRss3(out)

  # RPs
  rps <- buildFLRPss3(out)

  return(FLom(stock=stk, sr=srr, refpts=rps))
} # }}}

# readOutputss3 {{{
readOutputss3 <- function(dir, repfile = "Report.sso",
  compfile = "CompReport.sso", covarfile = "covar.sso", compress="gz") {

  # Possibly compressed files
  cfiles <- c(repfile = repfile, compfile = compfile, covarfile = covarfile)

  # CHECK compressed files
  idx <- file.exists(file.path(dir, paste(cfiles, compress, sep = ".")))
  cfiles[idx] <- paste(cfiles[idx], compress, sep = ".")

  out <- SS_output(dir, verbose=FALSE, hidewarn=TRUE, warn=FALSE,
    printstats=FALSE, covarfile=cfiles["covarfile"], forecast=FALSE,
    repfile=cfiles["repfile"], compfile=cfiles["compfile"], covar=idx[3])
 
  return(out) 
} # }}}

# readFLRPss3 {{{
readFLRPss3 <- function(dir, repfile="Report.sso", compfile="CompReport.sso") {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)

  if(out$SS_versionNumeric > 3.24)
    buildFLRPss330(out)
  else
   buildFLRPss3(out)

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

readFLSRss3 <- function(dir, birthseas=out$birthseas, repfile="Report.sso",
  compfile="CompReport.sso", ...) {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)

  buildFLSRss3(out, birthseas=out$birthseas, ...)

} # }}}

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

readFLSss3 <- function(dir, repfile="Report.sso", compfile="CompReport.sso",
  wtatage=out$wtatage_switch, ...) {

  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)
  
  if(out$SS_versionNumeric > 3.24)
    res <- buildFLSss330(out, ...)
  else
    res <- buildFLSss3(out, ...)
  
  # CHANGE mat and *.wt if wtatage file being used 
  if(wtatage) {

    # FIND wtatage.ss_new
    waafile <- list.files(dir)[grep("wtatage.ss_new", list.files(dir))]

    # LOAD wtatage.ss_new
    waa <- data.table(SS_readwtatage(file.path(dir, waafile)))

    # SET year, unit and season
    waa[, year:=abs(Yr)]
    waa[, unit:=Sex]
    waa[, season:=Seas]

    # GET ages
    ages <- dimnames(res)$age

    # SUBSET FLStock years
    waa <- waa[year %in% dimnames(res)$year,]

    # SPLIT weights by fleet
    was <- split(waa, by="Fleet")

    # CREATE FLQuants
    wasq <- lapply(was, function(x)
    as.FLQuant(melt(x[, -seq(1, 6)], id=c("unit", "year", "season"),
      measure=ages, variable.name = "age", value.name = "data")))

    # stock.wt, Fleet = 0
    stock.wt(res)[] <- wasq[["0"]]

    # mat, Fleet = -2 / wt
    nmat <- wasq[["-2"]] %/% wasq[["-1"]]
    mat(res)[] <- nmat

    # IDENTIFY catch fleets
    if(is.null(out$fleet_type)) {
      out$fleet_type <- rep(3, out$nfleets)
      out$fleet_type[out$fleet_ID %in% unique(out$catch$Fleet)] <- 1
    }

    idx <- names(wasq)[!names(wasq) %in%
      c("0", "-1", "-2")][out$fleet_type == 1]

    # COMPUTE catch.wt DEBUG weighted average
    catch.wt(res)[] <- Reduce("+", wasq[idx]) /
      (length(idx))
    landings.wt(res) <- catch.wt(res)
    discards.wt(res) <- catch.wt(res)

    catch(res) <- computeCatch(res)
    landings(res) <- computeLandings(res)
    discards(res) <- computeDiscards(res)
    stock(res) <- computeStock(res)
  }

  # READ fbar range from starter.ss
  if(file.exists(file.path(dir, "starter.ss"))) {
    sta <- SS_readstarter(file.path(dir, "starter.ss"), verbose=FALSE)
    if(sta$F_report_units == 5) {
      range(res)[c("minfbar", "maxfbar")] <- sta$F_age_range
    }
  } 

  return(res)

} # }}}

# readFLFss3

# readRESss3 {{{
readRESss3 <- function(dir, repfile="Report.sso", compfile="CompReport.sso", ...) {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile, covarfile=FALSE)

  if(out$SS_versionNumeric > 3.24)
    buildRESss330(out, ...)
  else
    buildRESss3(out, ...)

} # }}}

# readKobess3 {{{
readKobess3 <- function(dir, repfile="Report.sso", compfile="CompReport.sso") {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)
  
  if(out$SS_versionNumeric <= 3.24)
    buildKobess3(out)
  else
    buildKobess330(out)

} # }}}

# readFLoemss3 {{{
readFLoemss3 <- function(dir, fleets, repfile="Report.sso",
  compfile="CompReport.sso", ...) {

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
readFLomeOMss3 <- function(dir, birthseas=out$birthseas, fleets,
  repfile="Report.sso", compfile="CompReport.sso", ...) {

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
readOMSss3 <- function(dir, fleets,
  repfile="Report.sso", compfile="CompReport.sso", ...) {

  # LOAD SS_output list
  out <- readOutputss3(dir, repfile=repfile, compfile=compfile)

  if(out$SS_versionNumeric == 3.24) {

    # FLStock
    stk <- buildFLSss3(out, birthseas=out$birthseas, ...)
    # FLIndexBiomass
    idx <- buildFLIBss3(out, fleets=fleets)
    # refpts
    rps <- buildFLRPss3(out)
    # results
    res <- buildRESss3(out)
  } else { 
    
    # FLStock
    stk <- buildFLSss330(out, ...)
    # FLIndexBiomass
    idx <- buildFLIBss330(out, fleets=fleets)
    # refpts
    rps <- buildFLRPss330(out)
    # results
    res <- buildRESss330(out)
  }

    # FLSR
    srr <- buildFLSRss3(out)

  return(list(stock=stk, sr=srr, indices=idx, refpts=rps, results=res, out=out))
} # }}}

# readSRIss3 {{{
readSRIss3 <- function(dir, birthseas=out$birthseas, fleets,
  repfile="Report.sso", compfile="CompReport.sso", ...) {

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

# readRESIDss3 {{{
readRESIDss3 <- function(dir, birthseas=out$birthseas, fleets,
  repfile="Report.sso", compfile="CompReport.sso", ...) {

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
