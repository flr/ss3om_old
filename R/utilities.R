# utilities.R - DESC
# ss3om/R/utilities.R

# Copyright European Union, 2015-2019; WMR, 2020.
# Author: Iago Mosqueira (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.


# getDimnames {{{
getDimnames <- function(out) {

  # GET range
  range <- getRange(out$catage)
  ages <- ac(seq(range['min'], range['max']))

  # DIMENSIONS
  morphs <- unique(out$morph_indexing[,'Index'])
  
  sex <- unique(out$morph_indexing[,'Sex'])
  gps <- unique(out$morph_indexing[,'GP'])
  bss <- unique(out$morph_indexing[,'BirthSeas'])

  # PARSE morphs et al for unit

  # SINGLE morph
  if(length(morphs) == 1)
    unit <- "unique"
  # SEXES
  else if(identical(morphs, sex))
    unit <- c("F", "M")
  # COMBINATIONS
  else
    unit <- sort(data.table(expand.grid(
      s=switch((length(sex) > 1) + 1, character(1), c("F", "M")),
      g=switch((length(gps) > 1) + 1, character(1), gps),
      b=switch((length(bss) > 1) + 1, character(1), bss)))[, paste0(s, g, b),])

  dmns <- list(age=ages,
    year=seq(range['minyear'], range['maxyear']),
    # unit = combinations(Sex, birthseas)
    unit=unit,
    season=switch(ac(out$nseasons), "1"="all", seq(out$nseasons)),
    area=switch(ac(out$nareas), "1"="unique", seq(out$nareas)),
    iter=1)

  # TODO HACK
  if(all(dmns$unit == ""))
    dmns$unit <- "unique"

  return(dmns)
} # }}}

# getRange {{{
getRange <- function(x) {
	
  # empty range
	range <- rep(as.numeric(NA), 7)
	names(range) <- c("min", "max", "plusgroup", "minyear", "maxyear",
    "minfbar", "maxfbar")
  
  # age range from catage
  # TODO FIND more secure way to find ages columns
  idx <- grep("Era", names(x))
	range[c("min", "max")] <- range(as.numeric(names(x)[-seq(1, idx)]))
	
  # plusgroup = max
	range["plusgroup"] <- range["max"]
	
  # min/maxfbar = min/max
	range[c("minfbar", "maxfbar")] <- range[c("min", "max")]
	
  # year range from catage
	range[c("minyear", "maxyear")] <- range(x$Yr[x$Era == "TIME"])

  return(range)
} # }}}

# packss3run {{{
packss3run <- function(dir=getwd(),
  gzfiles=c("Report.sso", "covar.sso", "wtatage.ss_new", "CompReport.sso"),
  keepfiles=c("warning.sso", "Forecast-report.sso", "starter.ss", "forecast.ss",
    "ss3.par", "ss.par", "ss.cor", "watatage.ss"),
  inputfiles=c("control.ss", "data.ss", list.files(dir, pattern="*.ctl|dat$"))) {

  # CHECK if already compressed
  if(file.exists(file.path(dir, paste0(gzfiles[1], ".gz")))) {
    message(paste0("Files in ", dir, "already compressed, skipping."))
    invisible(0)
  }

  # REMOVE unneeded files
  allfiles <- list.files(dir)
  filemat <- match(c(gzfiles, keepfiles, inputfiles), allfiles)
  rmfiles <- c(allfiles[-filemat[!is.na(filemat)]], "gradient.dat")
  res <-  file.remove(file.path(dir, rmfiles))

  # gzip files
  gzfiles <- file.path(dir, gzfiles)

  lapply(gzfiles, function(x) system(paste0("gzip ", x)))

  invisible(0)
} # }}}

# codeUnit {{{
# TODO UGLY!
codeUnit <- function(Sex, Morph) {

  if(length(unique(Sex)) == 1 & length(unique(Morph)) == 1)
    unit <- rep("unique", length(Sex))
  else {

    # sex as 'F' or 'M'
    sex <- if(length(unique(Sex)) == 1){""} else {c("F","M")[Sex]}

    # Morph
    if(identical(Sex, Morph))
      unit <- sex
    else
      if(length(unique(sex)) == 1)
        unit <- Morph
      else
        unit <- paste0(sex, ceiling(Morph / 2))
  }

  return(unit)
} # }}}

# dimss3 {{{
dimss3 <- function(out) {

  range <- getRange(out$catage)

  return(list(
    age = length(seq(range["min"], range["max"])),
    year   = length(seq(range["minyear"], range["maxyear"])),
    sex = out$nsexes,
    biop = out$N_bio_patterns,
    gpatterns = out$ngpatterns,
    platoon = out$N_platoons,
    # unit = sex * platoon
    unit = out$nsexes * out$N_platoons,
    season = out$nseasons,
    spwn = (out$Spawn_seas - 1) * (1 / out$nseasons) +
      out$Spawn_timing_in_season * (1 / out$nseasons),
    subseason = out$N_sub_seasons,
    area = out$nareas,
    fleet = sum(out$IsFishFleet),
    index = sum(!out$IsFishFleet),
    M_option = out$NatMort_option,
    growth_option = out$GrowthModel_option,
    mat_option = out$Maturity_option,
    fec_option = out$Fecundity_option
  ))
} # }}}

# runtime {{{

runtime <- function(dir) {

  out <- readLines(file.path(dir, "Report.sso"), n = 12)

  sta <- as.POSIXlt(gsub("StartTime: ", "", out[grep("StartTime", out)]),
      format="%a %b %d %H:%M:%S %Y")
  
  end <- as.POSIXlt(gsub("EndTime: ", "", out[grep("EndTime", out)]),
      format="%a %b %d %H:%M:%S %Y")

  return(end - sta)

} # }}}

# convergencelevel {{{
convergencelevel <- function(dir, compress="gz") {

  if(grepl("Report.sso", basename(dir))) {
    file <- dir
  } else {
    fls <- list.files(dir)
    file <- file.path(dir, fls[grep("^Report.sso", fls)])[1]
  }

  out <- readLines(file, n = 15)

  return(as.numeric(strsplit(out[grep("Convergence_Level", out)], " ")[[1]][2]))
} # }}}

# prepareRetro {{{

prepareRetro <- function(path, starter="starter.ss", years=5) {

  # CREATE "retro" folder
  dir.create(file.path(path, "retro"), showWarnings = FALSE)

  for(i in seq(years)) {
    rdir <- file.path(path, "retro", 
      paste0("retro_", sprintf(paste0("%0", 2, "i"), i)))

    dir.create(rdir)

    file.copy(file.path(path, list.files(path, include.dirs = FALSE)), rdir)

    sta <- SS_readstarter(file.path(rdir, starter), verbose=FALSE)

    sta$retro_yr <- paste0("-", i)
    sta$init_values_src <- 0

    SS_writestarter(sta, dir=rdir, file=starter, overwrite=TRUE,
      verbose=FALSE)
  }

  invisible(TRUE)
} # }}}
