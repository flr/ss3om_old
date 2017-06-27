# readSS3.R - DESC
# ioalbmse/R/readSS3.R

# Copyright European Union, 2015-2016
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

utils::globalVariables(c("BirthSeas", "Age", "Seas", "Sex", "Area", "Fleet",
  "Morph", "Yr", "Era", "yr", "seas", "gender", "birthseas", "fleet", "Gender",
  "factor", "year", "morph"))

# readFLBFss3 {{{
readFLBFss3 <- function(dir, birthseas=unique(out$natage$BirthSeas)) {

  # LOAD SS_output list
  out <- r4ss::SS_output(dir, verbose=FALSE, hidewarn=TRUE, warn=FALSE,
    printstats=FALSE, covar=TRUE, forecast=FALSE)

  # TODO CHECK out has needed elements

  out <- out[c("catage", "wtatage", "natage", "ageselex", "endgrowth",
    "catch_units", "nsexes", "nseasons", "nareas", "IsFishFleet", "fleet_ID",
    "FleetNames", "timeseries", "parameters")]

  # GET range
  range <- getRange(out$catage)
  ages <- ac(seq(range['min'], range['max']))

  # GET dimnames
  dmns <- list(age=ages,
    year=seq(range['minyear'], range['maxyear']),
    # unit = combinations(Sex, birthseas)
    unit=c(t(outer(switch(out$nsexes, "", c("F", "M")),
    switch(length(birthseas), "", birthseas), paste0))),
    season=seq(out$nseasons),
    area=seq(out$nareas),
    iter=1)

  # --- BIOL (endgrowth, natage)

  # EXTRACT endgrowth
  endgrowth <- data.table(out$endgrowth, key=c("Seas", "Sex", "BirthSeas", "Age"))

  # -- STOCK.WT
  
  # EXTRACT stock.wt - endgrowth[, Seas, BirthSeas, Age, M]
  wt <- endgrowth[BirthSeas == birthseas,
    list(BirthSeas, Sex, Seas, Age, Wt_Beg)]

  # CREATE unit from Sex + BirthSeas
  wt[, unit:=paste0(ifelse(Sex == 1, "F", "M"),
    ifelse(length(birthseas) == 1, "", BirthSeas)),]

  # RENAME
	names(wt) <- c("BirthSeas", "Sex", "season", "age", "data", "unit")

  # EXPAND by year, unit & season
  wt <- FLCore::expand(as.FLQuant(wt[, .(season, age, data, unit)],
    units="kg"), year=dmns$year, unit=dmns$unit, season=dmns$season)

  # -- MAT

  # EXTRACT mat - endgrowth
  # NOTE that only Gender 1 (F) is used, M is all -1
  mat <- endgrowth[BirthSeas == birthseas & Gender == 1,
    list(BirthSeas, Gender, Seas, Age, Age_Mat)]

  # RENAME
  names(mat) <- c("BirthSeas", "unit", "season", "age", "data")

  # EXPAND by year & unit
  mat <- FLCore::expand(as.FLQuant(mat[, .(season, age, data)],
    units="NA"), year=dmns$year, unit=dmns$unit)

  mat <- predictModel(mat=mat, model=~mat)

  # -- M
  
  # EXTRACT m - biol[, Seas, BirthSeas, Age, M]
  m <- endgrowth[BirthSeas == birthseas,
    list(BirthSeas, Gender, Seas, Age, M)]

  # CREATE unit from Gender + BirthSeas
  m[, unit:=paste0(ifelse(Gender == 1, "F", "M"),
    ifelse(length(birthseas) == 1, "", BirthSeas)),]

  # RENAME
	names(m) <- c("BirthSeas", "Gender", "season", "age", "data", "unit")
  
  # EXPAND by year, unit & season
  m <- FLCore::expand(as.FLQuant(m[,.(season, age, data, unit)], units="m"),
    year=dmns$year, unit=dmns$unit, season=dmns$season)

  # -- N

  n <- data.table(out$natage)
  
  # SELECT start of season (Beg/Mid == 'B'), Era == 'TIME' & cols
  n <- n[`Beg/Mid` == "B" & Era == 'TIME',
    .SD, .SDcols = c("Gender", "BirthSeas", "Yr", "Seas", ages)]

  # MELT by Gender, BirthSeas, Yr & Seas
	n <- data.table::melt(n, id.vars=c("Gender", "BirthSeas","Yr","Seas"), variable.name="age")
  
  # SUBSET according to birthseas
  n <- n[BirthSeas %in% birthseas,]

  # CREATE unit from Gender + BirthSeas
  n[, unit:=paste0(ifelse(Gender == 1, "F", "M"), ifelse(length(birthseas) == 1, "", BirthSeas)),]
  
  # DROP Gender and BirthSeas
  n[ ,c("Gender","BirthSeas") := NULL]

  # RENAME
  names(n) <- c("year", "season", "age", "data", "unit")

  n <- as.FLQuant(n, units="1000")

  # REC
  rec <- predictModel(model=~(4 * h * R0 * unitSums(ssb)) / (B0 * (1 - h) + unitSums(ssb) * (5 * h -1)),
  params=FLPar(h=out$parameters["SR_BH_steep","Value"],
    B0=sum(out$timeseries$SpawnBio[out$timeseries$Era=="VIRG"], na.rm=TRUE),
    R0=sum(out$timeseries$Recruit_0[out$timeseries$Era=="VIRG"], na.rm=TRUE)))

  # -- FLBiol

  biol <- FLBiol(n=n, wt=wt, m=m, mat=mat, rec=rec)
  
  # -- SPWN
  spwn(biol)[,,,birthseas] <- 0.5

  # BUG FLBiol dimensions, FLQs & FLPs

  # -- FISHERIES (catage, wtatage, ageselex)

  # CAA, WAA, SEL
  catage <- data.table(out$catage,
    key=c("Area", "Fleet", "Gender", "Morph", "Yr", "Seas", "Era"))
  wtatage <- data.table(out$wtatage,
    key=c("yr", "seas", "gender", "birthseas", "fleet"))
  ageselex <- data.table(out$ageselex,
    key=c("factor", "fleet", "year", "seas", "gender", "morph"))[factor == "Asel2",]

  # BUG: yr in wtatage is negative
  wtatage[, yr:=abs(yr)]

  # RECONSTRUCT BirthSeas from Morph & Gender
  catage[, BirthSeas := Morph - (max(Seas) * (Gender - 1))]
  ageselex[, BirthSeas := morph - (max(seas) * (gender - 1))]
  
  # FIND and SUBSET fishing fleets, TIME and BirthSeas
  idx <- out$fleet_ID[out$IsFishFleet]
  catage <- catage[Fleet %in% idx & Era == "TIME" & BirthSeas %in% birthseas,]
  # BUG: scoping does not allow [ on variable with name matching column name
  ref <- birthseas
  wtatage <- wtatage[fleet %in% idx & birthseas %in% ref,]
  ageselex <- ageselex[year >= min(catage[,year]) & year <= max(catage[,year]) &
    BirthSeas %in% birthseas,]

  # CREATE unit from Gender + BirthSeas
  catage[, unit:=paste0(ifelse(Gender == 1, "F", "M"),
    ifelse(length(birthseas) == 1, "", BirthSeas)),]
  wtatage[, unit:=paste0(ifelse(gender == 1, "F", "M"),
  ifelse(length(ref) == 1, "", birthseas)),]
  ageselex[, unit:=paste0(ifelse(gender == 1, "F", "M"),
    ifelse(length(ref) == 1, "", BirthSeas)),]

  # MELT by Gender, BirthSeas, Yr & Seas
	catage <- data.table::melt(catage, id.vars=c("Area", "Fleet", "Yr", "Seas", "unit"),
    measure.vars=ages, variable.name="age")
  names(catage) <- c("area", "fleet", "year", "season", "unit", "age", "data")

  wtatage <- data.table::melt(wtatage, id.vars=c("yr", "seas", "fleet", "unit"),
    measure.vars=ages, variable.name="age")
  names(wtatage) <- c("year", "season", "fleet", "unit", "age", "data")

	ageselex <- data.table::melt(ageselex, id.vars=c("fleet", "year", "seas", "unit"),
    measure.vars=ages, variable.name="age")
  names(ageselex) <- c("fleet", "year", "season", "unit", "age", "data")

  # CATCHES
  catches <- lapply(idx, function(x) {

    landings.n <- as.FLQuant(catage[fleet %in% x,][, fleet:=NULL], units="1")
    landings.wt <- as.FLQuant(wtatage[fleet %in% x,][, fleet:=NULL], units="kg")
    catch.sel <- predictModel(model=~catch.sel,
      FLQuants(catch.sel=as.FLQuant(ageselex[fleet %in% x,][, fleet:=NULL], units="NA")))
  
    # CORRECT landings.n in biomass to numbers (catch_units)
    if(out$catch_units[x] == 1) {
      landings.n <- landings.n / landings.wt
      units(landings.n) <- "1"
    }

    res <- FLCatch(name="ALB", landings.n=landings.n, landings.wt=landings.wt, catch.sel=catch.sel)

    # discards
    discards.n(res)[] <- 0
    discards.wt(res) <- landings.wt(res)

    return(res)
    }
  )

  # capacity
  # effort
  # hperiod

  # CREATE fisheries
  fisheries <- FLFisheries(lapply(catches,
    function(x) {

      fi <- FLFishery(ALB=x)

      return(fi)
    }
  ))

  # NAME as in out$FleetNames
  names(fisheries) <- out$FleetNames[idx]

  return(list(biol=biol, fisheries=fisheries))

} # }}}

# readFLSss3 {{{

#' A function to read SS3 results as an FLStock object
#'
#' Results of a run of the Stock Synthesis sofware, SS3 (Methot & Wetzel, 2013),
#' can be loaded into an object of class \code{\link{{FLStock}}. The code makes
#' use of the r4ss::SS_output function to obtain a list from Report.sso. The
#' following elements of that list are used to generate the necessary information
#' for the slots in \code{\link{FLStock}}: "catage", "natage", "ageselex",
#' "endgrowth", "catch_units", "nsexes", "nseasons", "nareas", "IsFishFleet",
#' "fleet_ID", "FleetNames", "spawnseas", "inputs" and "SS_version".
#'
#' Aliquam sagittis feugiat felis eget consequat. Praesent eleifend dolor massa, 
#' vitae faucibus justo lacinia a. Cras sed erat et magna pharetra bibendum quis in 
#' mi. Sed sodales mollis arcu, sit amet venenatis lorem fringilla vel. Vivamus vitae 
#' ipsum sem. Donec malesuada purus at libero bibendum accumsan. Donec ipsum sapien, 
#' feugiat blandit arcu in, dapibus dictum felis.
#'
#’ @references
#' Methot RD Jr, Wetzel CR (2013) Stock Synthesis: A biological and statistical
#' framework for fish stock assessment and fishery management.
#' Fisheries Research 142: 86–99.
#'
#' @param dir Directory holding the SS3 output files
#' @param birthseas Birth seasons for this stock, defaults to spawnseas
#' @param name Name of the output object to fil the name slot
#' @param desc Description of the output object to fill the desc slot
#'
#' @return An object of class \code{\link{FLStock}}
#'
#' @name readFLSss3
#' @rdname readFLSss3
#' @aliases readFLSss3
#'
#' @author The FLR Team
#' @seealso \link{FLComp}
#' @keywords classes
#' @examples
#' 

readFLSss3 <- function(dir, birthseas=out$spawnseas, name="",
  desc=paste(out$inputs$repfile, out$SS_version, sep=" - ")) {

  # LOAD SS_output list
  out <- r4ss::SS_output(dir, verbose=FALSE, hidewarn=TRUE, warn=FALSE,
    printstats=FALSE, covar=FALSE, forecast=FALSE)
  
  # SUBSET out
  out <- out[c("catage", "natage", "ageselex", "endgrowth",
    "catch_units", "nsexes", "nseasons", "nareas", "IsFishFleet", "fleet_ID",
    "FleetNames", "spawnseas", "inputs", "SS_version")]

  # GET range
  range <- getRange(out$catage)
  ages <- ac(seq(range['min'], range['max']))
  idx <- out$fleet_ID[out$IsFishFleet]

  # GET dimnames
  dmns <- list(age=ages,
    year=seq(range['minyear'], range['maxyear']),
    # unit = combinations(Sex, birthseas)
    unit=c(t(outer(switch(out$nsexes, "unique", c("F", "M")),
      switch((length(birthseas) > 1) + 1, "", birthseas), paste0))),
    season=switch(ac(out$nseasons), "1"="all", seq(out$nseasons)),
    area=switch(ac(out$nareas), "1"="unique", seq(out$nareas)),
    iter=1)

  dim <- unlist(lapply(dmns, length))

  # EXTRACT from out
  if(out$nsexes == 1) {
    endgrowth <- data.table(out$endgrowth, key=c("Seas", "BirthSeas", "Age"))
  } else {
    endgrowth <- data.table(out$endgrowth, key=c("Seas", "Sex", "BirthSeas", "Age"))
  }

  # NATAGE
  natage <- data.table(out$natage)
    setnames(natage, c("BirthSeason"), c("BirthSeas"))
  
  # CATCH.N
  catage <- data.table(out$catage)
    setnames(catage, c("Gender"), c("Sex"))
    setkey(catage, "Area", "Fleet", "Sex", "Morph", "Yr", "Seas", "Era")

  # STOCK.WT
  wt <- ss3wt(endgrowth, dmns, birthseas)

  # MAT
  mat <- ss3mat(endgrowth, dmns, birthseas)

  # M
  m <- ss3m(endgrowth, dmns, birthseas)
  
  # STOCK.N
  n <- ss3n(natage, dmns, birthseas)

  # CATCH.WT, assumes _mat_option == 3
  wtatage <- endgrowth[BirthSeas %in% birthseas,
    c("Seas", "Sex", "BirthSeas", "Age", paste0("RetWt:_", idx)), with=FALSE]

  landings <- ss3catch(catage, wtatage, dmns, birthseas, idx)

  # CALCULATE total landings.n
  landings.n <- FLQuant(0, dimnames=dmns, units="1000")
  for (i in seq(length(idx)))
    landings.n <- landings.n %++% landings[[i]]$landings.n
  
  # BUG: USE landings.wt from fleet 1
  landings.wt <- FLCore::expand(landings[[1]]$landings.wt, year=dmns$year, area=dmns$area)

  # EXPAND m and mat by area
  m <- do.call(FLCore::expand, c(list(x=m), dmns))
  mat <- do.call(FLCore::expand, c(list(x=mat), dmns))
  
  # FLStock
  stock <- FLStock(
    name=name, desc=desc,
    landings.n=landings.n, landings.wt=landings.wt,
    stock.n=n, stock.wt=wt,
    m=m, mat=mat)

  # CALCULATE stock, catch, landings & discards
  discards.n(stock) <- 0
  units(discards.n(stock)) <- units(landings.n(stock))
  discards.wt(stock) <- landings.wt(stock)

  landings(stock) <- computeLandings(stock)
  discards(stock) <- computeDiscards(stock)
  catch(stock) <- computeCatch(stock, slot='all')
  stock(stock) <- computeStock(stock)

  # ASSIGN harvest.spwn and m.spwn in birthseas
  harvest.spwn(stock)[,,,birthseas] <- 0.5
  m.spwn(stock)[,,,birthseas] <- 0.5

  # HARVEST
  harvest(stock) <- harvest(stock.n(stock), catch=catch.n(stock), m=m(stock))

  return(stock)

} # }}}

# readFLIBss3 {{{

#' A function to read the CPUE series from an SS3 run into anm FLIndex object
#'
#’ @references
#' Methot RD Jr, Wetzel CR (2013) Stock Synthesis: A biological and statistical
#' framework for fish stock assessment and fishery management.
#' Fisheries Research 142: 86–99.
#'
#' @param dir Directory holding the SS3 output files
#' @param name Name of the output object to fil the name slot
#' @param desc Description of the output object to fill the desc slot
#'
#' @return An object of class \code{\link{FLStock}}
#'
#' @name readFLIBss3
#' @rdname readFLIBss3
#' @aliases readFLIBss3
#'
#' @author The FLR Team
#' @seealso \link{FLComp}
#' @keywords classes
#' @examples
#'  
# 
# dir <- '../../../sa/run/'
# cps <- readFLIBss3(dir, fleets=c(LLCPUE1=1, LLCPUE2=2, LLCPUE3=3, LLCPUE4=4))

readFLIBss3 <- function(dir, fleets) {

  # LOAD SS_output list
  out <- r4ss::SS_output(dir, verbose=FALSE, hidewarn=TRUE, warn=FALSE,
    printstats=FALSE, covar=FALSE, forecast=FALSE)

  # TODO LOAD ctl$sizeselex, to match fleets if not given
  
  # SUBSET from out
  cpue <- data.table(out[[c("cpue")]])
  selex <- data.table(out[["ageselex"]])

  # --- index
  index <- ss3index(cpue, fleets)

  # --- index.var
  # index.var <- ss3index.var(cpue, fleets)

  # --- index.q
  index.q <- ss3index.q(cpue, fleets)

  # --- sel.pattern
  sel.pattern <- ss3sel.pattern(selex, unique(cpue$Yr), fleets)

  # --- index.res (var)
  index.res <- ss3index.res(cpue, fleets)
  
  # --- FLIndices
  cpues <- lapply(names(fleets), function(x) FLIndexBiomass(name=x,
    index=index[[x]], index.q=index.q[[x]],
    index.var=index.res[[x]],
    sel.pattern=window(sel.pattern[[x]], start=dims(index[[x]])$minyear,
      end=dims(index[[x]])$maxyear)))
  
  if(length(fleets) > 1)
    return(FLIndices(cpues))
  else
    return(cpues[[1]])

} # }}}

# readRPss3 {{{
readRPss3 <- function(file, vars) {
	
	dat <- readLines(file, n=2000)
	for(i in names(vars)) {
		# vector with string
		str <- unlist(strsplit(dat[grep(paste0(gsub("\\(", "\\\\\\(", i), "[ ,:]"), dat, fixed=FALSE)], " "))
		vars[[i]] <- as.numeric(str[vars[[i]]])
	}
	return(as.data.frame(t(unlist(vars))))
} # }}}

# readFLQsss3 {{{
readFLQsss3 <- function(dir) {

  # LOAD SS_output list
  out <- r4ss::SS_output(dir, verbose=FALSE, hidewarn=TRUE, warn=FALSE,
    printstats=FALSE, covar=TRUE, forecast=FALSE)

  # SUBSET out
  out <- out[c("derived_quants", "recruit", "startyr", "endyr", "Kobe")]

  yrs <- ac(seq(out$startyr, out$endyr))

  # REC
  recruit <- data.table(out$recruit)
  rec <- FLQuant(recruit[, pred_recr], dimnames=list(age='0', year=recruit[, year]),
    units="1000")[, yrs]

  # SPB
  ssb <- FLQuant(recruit[, spawn_bio], dimnames=list(age='all', year=recruit[, year]),
    units="t")[, yrs]

  # RESID
  resid <- FLQuant(recruit[, dev], dimnames=list(age='all', year=recruit[, year]),
    units="t")[, yrs]

  # BBMSY
  kobe <- data.table(out$Kobe)
  bbmsy <- FLQuant(kobe[, B.Bmsy], dimnames=list(age='all', year=kobe[, Year]),
    units="NA")[, yrs]

  ffmsy <- FLQuant(kobe[, F.Fmsy], dimnames=list(age='all', year=kobe[, Year]),
    units="NA")[, yrs]

  # $Dynamic_Bzero

  # $derived_quants
  # F_1950

  return(FLQuants(rec=rec, ssb=ssb, resid=resid, bbmsy=bbmsy, ffmsy=ffmsy))
} # }}}

# ss3slot functions {{{

# ss3index
ss3index <- function(cpue, fleets) {
  
  index <- cpue[Name %in% names(fleets), c("Name", "Yr", "Seas", "Obs")]

  # CHANGE names and SORT
  names(index) <- c("qname", "year", "season", "data")
  setorder(index, year, season, qname)
  index[, age:='all']

  # CONVERT to FLQuants
  return(as(index, "FLQuants"))
}

# ss3index.res
ss3index.res <- function(cpue, fleets) {
  
  cpue[, Res := Obs-Exp]
  index <- cpue[Name %in% names(fleets), c("Name", "Yr", "Seas", "Res")]

  # CHANGE names and SORT
  names(index) <- c("qname", "year", "season", "data")
  setorder(index, year, season, qname)
  index[, age:='all']

  # CONVERT to FLQuants
  return(as(index, "FLQuants"))
}

# ss3index.var
ss3index.var <- function(cpue, fleets) {

  index.var <- cpue[Name %in% names(fleets), c("Name", "Yr", "Seas", "SE")]

  # CHANGE names and SORT
  names(index.var) <- c("qname", "year", "season", "data")
  setorder(index.var, year, season, qname)
  index.var[, age:='all']

  # CONVERT to FLQuants
  index.var <- as(index.var, "FLQuants")

  # units = SE
  index.var <- lapply(index.var, "units<-", "se")

  return(index.var)
}

# ss3index.q
ss3index.q <- function(cpue, fleets) {

  index.q <- cpue[Name %in% names(fleets), c("Name", "Yr", "Seas", "Calc_Q")]

  # CHANGE names and SORT
  names(index.q) <- c("qname", "year", "season", "data")
  setorder(index.q, year, season, qname)
  index.q[, age:='all']

  # CONVERT to FLQuants
  return(as(index.q, "FLQuants"))
}

# ss3sel.pattern
ss3sel.pattern <- function(selex, years, fleets) {

  setkey(selex, "factor", fleet, year, morph)

  # SUBSET Asel2, fleets, cpue years
  selex <- selex[CJ("Asel2", fleets, years, c(4,8))]
  selex[, c("factor", "morph", "label") := NULL]

  # RESHAPE to long
  selex <- melt(selex, id.vars=c("fleet", "year", "seas","gender"),
    variable.name="age", value.name="data")

  # CHANGE names & SORT
  names(selex) <- c("qname", "year", "season", "unit", "age", "data")
  setorder(selex, year, season, age, unit, qname)

  # CONVERT to FLQuants
  sel.pattern <- as(as.data.frame(selex), 'FLQuants')
  
  # ASSIGN names
  names(sel.pattern) <- names(fleets)

  return(sel.pattern)
}

# ss3wt
ss3wt <- function(endgrowth, dmns, birthseas) {
  
  # EXTRACT stock.wt - endgrowth[, Seas, BirthSeas, Age, M]
  wt <- endgrowth[BirthSeas == birthseas,
    list(BirthSeas, Sex, Seas, Age, Wt_Beg)]

  # CREATE unit from Sex + BirthSeas
  wt[, unit:=paste0(dmns$unit[Sex],
    ifelse(length(birthseas) == 1, "", BirthSeas)),]

  # RENAME
  names(wt) <- c("BirthSeas", "Sex", "season", "age", "data", "unit")

  # EXPAND by year, unit & season
  wt <- FLCore::expand(as.FLQuant(wt[, .(season, age, data, unit)], units="kg"),
    year=dmns$year, unit=dmns$unit, season=dmns$season, area=dmns$area)
}

# ss3mat
ss3mat <- function(endgrowth, dmns, birthseas) {

  # EXTRACT mat - endgrowth
  # NOTE that only Sex 1 (F) is used, M is all -1
  mat <- endgrowth[BirthSeas == birthseas & Sex == 1,
    list(BirthSeas, Sex, Seas, Age, Age_Mat)]

  # RENAME
  names(mat) <- c("BirthSeas", "unit", "season", "age", "data")

  # EXPAND by year & unit
  mat <- FLCore::expand(as.FLQuant(mat[, .(season, age, data)],
    units="NA"), year=dmns$year, unit=dmns$unit, season=dmns$season)

  return(mat)
}

# ss3m
ss3m <- function(endgrowth, dmns, birthseas) {

  # EXTRACT m - biol[, Seas, BirthSeas, Age, M]
  m <- endgrowth[BirthSeas == birthseas,
    list(BirthSeas, Sex, Seas, Age, M)]

  # CREATE unit from Sex + BirthSeas
  m[, unit:=paste0(dmns$unit[Sex],
    ifelse(length(birthseas) == 1, "", BirthSeas)),]

  # SPLIT M across seasons
  m[, M:=M/length(dmns$season)]

  # RENAME
	names(m) <- c("BirthSeas", "Sex", "season", "age", "data", "unit")
  
  # EXPAND by year, unit & season
  m <- FLCore::expand(as.FLQuant(m[,.(season, age, data, unit)], units="m"),
    year=dmns$year, unit=dmns$unit, season=dmns$season)
}

# ss3n
ss3n <- function(n, dmns, birthseas) {
  
  # SELECT start of season (Beg/Mid == 'B'), Era == 'TIME' & cols
  n <- n[`Beg/Mid` == "B" & Era == 'TIME',
    .SD, .SDcols = c("Area", "Sex", "BirthSeas", "Yr", "Seas", dmns$age)]

  # MELT by Sex, BirthSeas, Yr & Seas
	n <- data.table::melt(n, id.vars=c("Area", "Sex", "BirthSeas","Yr","Seas"),
    variable.name="age")
  
  # SUBSET according to birthseas
  n <- n[BirthSeas %in% birthseas,]

  # CREATE unit from Sex + BirthSeas
  n[, unit:=paste0(dmns$unit[Sex],
    ifelse(length(birthseas) == 1, "", BirthSeas)),]
  
  # DROP Sex and BirthSeas
  n[ ,c("Sex","BirthSeas") := NULL]

  # RENAME
  names(n) <- c("area", "year", "season", "age", "data", "unit")
  n <- as.FLQuant(n, units="1000")
  dimnames(n) <- dmns

  return(n)
}

# ss3catch
ss3catch <- function(catage, wtatage, dmns, birthseas, idx) {

  # RECONSTRUCT BirthSeas from Morph & Sex
  catage[, BirthSeas := Morph - max(Seas) * (Sex - 1)]
  
  # FIND and SUBSET fishing fleets, TIME and BirthSeas
  catage <- catage[Fleet %in% idx & Era == "TIME" & BirthSeas %in% birthseas,]

  # CREATE unit from Sex + BirthSeas
  catage[, unit:=paste0(dmns$unit[Sex],
    ifelse(length(birthseas) == 1, "", BirthSeas)),]

  # RENAME Area and Season if only 1
  cols <- c("Seas", "Area")
  catage[, (cols) := lapply(.SD, as.character), .SDcols = cols]
  catage[, Seas := if(length(unique(Seas)) == 1) "all" else Seas]
  catage[, Area := if(length(unique(Area)) == 1) "unique" else Area]

  # MELT by Sex, BirthSeas, Yr & Seas
	catage <- data.table::melt(catage, id.vars=c("Area", "Fleet", "Yr", "Seas", "unit"),
    measure.vars=dmns$age, variable.name="age")
  names(catage) <- c("area", "fleet", "year", "season", "unit", "age", "data")

  # RENAME Season if only 1
  cols <- c("Seas")
  wtatage[, (cols) := lapply(.SD, as.character), .SDcols = cols]
  wtatage[, Seas := if(length(unique(Seas)) == 1) "all" else Seas]

  # CREATE unit from Sex + BirthSeas
  wtatage[, unit:=paste0(dmns$unit[Sex],
    ifelse(length(birthseas) == 1, "", BirthSeas)),]
 
  # MELT by Sex, BirthSeas, Yr & Seas
  wtatage <- data.table::melt(wtatage, id.vars=c("Age", "unit", "Seas"),
    measure.vars=paste0("RetWt:_", idx), variable.name="fleet")
  names(wtatage) <- c("age", "unit", "season", "fleet", "data")
  wtatage[,fleet:=sub("RetWt:_", "", fleet)]

  # FLQuant for landings per fleet
  landings <- lapply(idx, function(x) {
    landings.n <- as.FLQuant(catage[fleet %in% x,][, fleet:=NULL], units="1000")
    landings.wt <- as.FLQuant(wtatage[fleet %in% x,][, fleet:=NULL], units="kg")
    return(FLQuants(landings.n=landings.n, landings.wt=landings.wt))
    }
  )

  return(landings)
} # }}}
