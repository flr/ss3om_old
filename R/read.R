# readSS3.R - DESC
# ioalbmse/R/readSS3.R

# Copyright European Union, 2015-2017
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# readFLBFss3 {{{

readFLBFss3 <- function(dir, birthseas=unique(out$natage$BirthSeas), ...) {

  # LOAD SS_output list
  out <- r4ss::SS_output(dir, verbose=FALSE, hidewarn=TRUE, warn=FALSE,
    printstats=FALSE, covar=TRUE, forecast=FALSE, ...)

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

readFLSss3 <- function(dir, birthseas=out$birthseas, name="ss3",
  desc=paste(out$inputs$repfile, out$SS_version, sep=" - "), ...) {

  # LOAD SS_output list
  out <- r4ss::SS_output(dir, verbose=FALSE, hidewarn=TRUE, warn=FALSE,
    printstats=FALSE, covar=FALSE, forecast=FALSE, ...)

  buildFLSss3(out, birthseas=out$birthseas, name=out$Control_File,
  desc=paste(out$inputs$repfile, out$SS_versionshort, sep=" - "))

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
  out <- r4ss::SS_output(dir, verbose=FALSE, hidewarn=TRUE, warn=FALSE,
    printstats=FALSE, covar=FALSE, forecast=FALSE, ...)

  buildFLIBss3(out, fleets=fleets, birthseas=out$birthseas)

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
  out <- r4ss::SS_output(dir, verbose=FALSE, hidewarn=TRUE, warn=FALSE,
    printstats=FALSE, covar=FALSE, forecast=FALSE, ...)

  buildFLSRss3(out, birthseas=out$birthseas)

} # }}}

# readRPss3 {{{
readRPss3 <- function(file, vars=list(TotBio_Unfished=3, SPB_Virgin=3, SSB_MSY=3,
  SPB_endyr=3, F_endyr=3, Fstd_MSY=3, TotYield_MSY=3, `SR_LN(R0)`=3, LIKELIHOOD=2,
  Convergence_Level=2, Survey=2, Length_comp=2, Catch_like=2, Recruitment=2),
  endyr=missing) {

	dat <- readLines(file, n=2000)

  # GET endyr name
  if(missing(endyr)) {
    idx <- grep("SPB_", dat)
    elin <- unlist(strsplit(dat[idx[length(idx)]], " "))
    endyr <- sub("SPB_", "", elin[nchar(elin) > 1][1])
  }

  names(vars) <- sub("endyr", as.character(endyr), names(vars))

	for(i in names(vars)) {
		# vector with string
		str <- unlist(strsplit(dat[grep(paste0(gsub("\\(", "\\\\\\(", i), "[ ,:]"),
      dat, fixed=FALSE)], " "))
		vars[[i]] <- suppressWarnings(as.numeric(str[vars[[i]]]))
	}
	return(as.data.frame(t(unlist(vars))))
} # }}}
