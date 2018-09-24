# utilities.R - DESC
# /utilities.R

# Copyright European Union, 2017
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# %++% {{{

# x <- catch.n(ple4)[, 1:15]
# y <- catch.n(ple4)[, 4:15] * 100
# x %++% y

"%++%" <- function(x, y) {
  
  dy <- dimnames(y)

  names(dy) <- c("i", "j", "k", "l", "m", "n")

  value <- do.call("[", c(list(x=x), dy)) + y
  res <- do.call("[<-", c(list(x=x, value=value), dy))

  return(res)
} # }}}

# getDimnames {{{
getDimnames <- function(out, birthseas) {

  # GET range
  range <- getRange(out$catage)
  ages <- ac(seq(range['min'], range['max']))
  
  dmns <- list(age=ages,
    year=seq(range['minyear'], range['maxyear']),
    # unit = combinations(Sex, birthseas)
    unit=c(t(outer(switch(out$nsexes, "", c("F", "M")),
      switch((length(birthseas) > 1) + 1, "", birthseas), paste0))),
    season=switch(ac(out$nseasons), "1"="all", seq(out$nseasons)),
    area=switch(ac(out$nareas), "1"="unique", seq(out$nareas)),
    iter=1)

  # TODO HACK
  if(dmns$unit == "")
    dmns$unit <- "unique"

  return(dmns)
} # }}}

# getRange {{{
getRange <- function(x) {
	
  # empty range
	range <- rep(as.numeric(NA), 7)
	names(range) <- c("min", "max", "plusgroup", "minyear", "maxyear", "minfbar", "maxfbar")
	
  # age range from catage
	range[c("min", "max")] <- range(as.numeric(names(x)[-(1:10)]))
	
  # plusgroup = max
	range["plusgroup"] <- range["max"]
	
  # min/maxfbar = min/max
	range[c("minfbar", "maxfbar")] <- range[c("min", "max")]
	
  # year range from catage
	range[c("minyear", "maxyear")] <- range(x$Yr[x$Era == "TIME"])

  # set plusgroup to max age
	range["plusgroup"] <- range["maxyear"]
	
  return(range)
} # }}}

# packss3run {{{
packss3run <- function(dir=getwd(),
  gzfiles=c("Report.sso", "covar.sso", "wtatage.ss_new", "CompReport.sso"),
  keepfiles=c("warning.sso", "Forecast-report.sso", "starter.ss", "forecast.ss",
    "ss3.par"),
  inputfiles=list.files(dir, pattern="*.ctl|dat$")
  
  ) {

  # CHECK if already compressed
  if(file.exists(file.path(dir, paste0(gzfiles[1], ".gz")))) {
    message(paste0("Files in ", dir, "already compressed, skipping."))
    invisible(0)
  }

  # REMOVE unneeded files
  allfiles <- list.files(dir)
  filemat <- match(c(gzfiles, keepfiles, inputfiles), allfiles)
  rmfiles <- allfiles[-filemat[!is.na(filemat)]]
  res <-  file.remove(file.path(dir, rmfiles))

  # gzip files
  gzfiles <- file.path(dir, gzfiles)

  lapply(gzfiles, function(x) system(paste0("gzip ", x)))

  invisible(0)
} # }}}
