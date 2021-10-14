# ss3slots.R - DESC
# ss3om/R/ss3slots.R

# Copyright European Union, 2015-2019; WMR, 2020.
# Author: Iago Mosqueira (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

#' Functions to convert SS3 output into FLQuant(s)
#'
#' A series of auxiliary functions that convert one or more elements, typically
#' of class `data.frame`. in the list returned by `r4ss::SS_output` into particular
#' FLQuant or FLQuants objects.
#'
#' @return An FLQuant or FLQuants object, depending on the converted data structure
#'
#' @name ss3slot
#' @rdname ss3slot
#'
#' @author Iago Mosqueira, EC JRC D02
#' @seealso \code{\link{FLQuant}} \code{\link{readFLSss3}}
#' @keywords classes
#' @aliases ss3index
#' @param cpue A data frame obtained from SS_output$cpue.
#' @param fleets A named list of vector of the fleets to be extracted.
#' @details - `ss3index` returns the `index` slot of each survey/CPUE fleet.

ss3index <- function(cpue, fleets) {
  
  # EXTRACT Obs?
  index <- cpue[Fleet_name %in% names(fleets), c("Fleet_name", "Yr", "Seas", "Obs")]

  # CHANGE names and SORT
  names(index) <- c("qname", "year", "season", "data")
  setorder(index, year, season, qname)
  index[, age:='all']

  # CONVERT to FLQuants
  return(as(index, "FLQuants"))
}

#' @rdname ss3slot
#' @aliases ss3index.res
#' @details - `ss3index.res` returns the `index.res` slot of each survey/CPUE fleet.

ss3index.res <- function(cpue, fleets) {
 
  # DEBUG COMPARE Dev vs. Obs-Exp 
  cpue[, Res := Obs-Exp]
  index <- cpue[Fleet_name %in% names(fleets), c("Fleet_name", "Yr", "Seas", "Dev")]

  # CHANGE names and SORT
  names(index) <- c("qname", "year", "season", "data")
  setorder(index, year, season, qname)
  index[, age:='all']

  # CONVERT to FLQuants
  return(as(index, "FLQuants"))
}

#' @rdname ss3slot
#' @aliases ss3index.var
#' @details - `ss3index.var` returns the `index.var` slot of each survey/CPUE fleet.

ss3index.var <- function(cpue, fleets) {

  index.var <- cpue[Fleet_name %in% names(fleets), c("Fleet_name", "Yr", "Seas", "SE")]

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

#' @rdname ss3slot
#' @aliases ss3index.q
#' @details - `ss3index.q` returns the `index.q` slot of each survey/CPUE fleet.

ss3index.q <- function(cpue, fleets) {

  # SETS SS_ouput$cpue$Calc_Q as index.q
  index.q <- cpue[Fleet_name %in% names(fleets), c("Fleet_name", "Yr", "Seas", "Calc_Q")]

  # CHANGE names and SORT
  names(index.q) <- c("qname", "year", "season", "data")
  setorder(index.q, year, season, qname)
  index.q[, age:='all']

  # CONVERT to FLQuants
  return(as(index.q, "FLQuants"))
}

#' @rdname ss3slot
#' @aliases ss3sel.pattern
#' @param selex A data frame obtained from SS_output$ageselex.
#' @param years Vector of years for which the index applies
#' @param fleets Named vector of fleets (numeric) codes
#' @param morphs Vector of morphs to use
#' @details - `ss3sel.pattern` returns the `sel.pattern` slot of each survey/CPUE fleet.

# ss3sel.pattern
ss3sel.pattern <- function(selex, years, fleets, morphs, factor="Asel2") {
  
  setkey(selex, "Factor", Fleet, Yr, Morph)

  # SUBSET Asel2, fleets, cpue years for Morph
  selex <- selex[CJ(Factor=factor, Fleet=fleets, Yr=years, Morph=morphs)]
  selex[, c("Factor", "Morph", "Label") := NULL]

  # RESHAPE to long
  selex <- melt(selex, id.vars=c("Fleet", "Yr", "Seas", "Sex"),
    variable.name="age", value.name="data")

  # CHANGE names & SORT
  names(selex) <- c("qname", "year", "season", "unit", "age", "data")
  selex[, age:=as.numeric(as.character(age))]
  setorder(selex, qname, age, year, unit, season)

  # CONVERT to FLQuants
  sel.pattern <- as(as.data.frame(selex), 'FLQuants')
  
  # ASSIGN names
  names(sel.pattern) <- names(fleets)
  
  # SET units
  sel.pattern <- lapply(sel.pattern, function(x) {
    units(x) <- ""
    return(x)
  })

  return(sel.pattern)
}

#' @rdname ss3slot
#' @aliases ss3wt
#' @param endgrowth A data frame obtained from SS_output$endgrowth.
#' @param dmns dimnames of the output object, usually obatined using `getDimnames`.
#' @param birthseas The birthseasons for this stock as a numeric vector.
#' @details - `ss3wt` returns the `stock.wt` slot.

ss3wt <- function(endgrowth, dmns, birthseas) {
  
  # EXTRACT stock.wt - Wt_mid @ endgrowth[, Seas, BirthSeas, Age, M]
  wt <- endgrowth[BirthSeas %in% birthseas,
    list(BirthSeas, Sex, Seas, Age, Wt_Beg)]

  # CREATE unit from Sex + BirthSeas
  wt[, uSex:={if(length(unique(Sex)) == 1){""} else {c("F","M")[Sex]}}]
  wt[, uBirthSeas:={if(length(unique(BirthSeas)) == 1){""} else {BirthSeas}}]
  wt[, unit:=ifelse(paste0(uSex, uBirthSeas) == "", "unique", paste0(uSex, uBirthSeas))]
  wt[, c("Sex","uSex","BirthSeas","uBirthSeas") := NULL]

  # RENAME
  names(wt) <- c("season", "age", "data", "unit")
  
  # EXPAND by year, unit & season
  return(FLCore::expand(as.FLQuant(wt[, .(season, age, data, unit)], units="kg"),
    year=dmns$year, unit=dmns$unit, season=dmns$season, area=dmns$area))
}

#' @rdname ss3slot
#' @aliases ss3mat
#' @details - `ss3mat` returns the `mat` slot.

ss3mat <- function(endgrowth, dmns, birthseas, option=3) {
  
  # EXTRACT mat - endgrowth
  mat <- endgrowth[BirthSeas %in% birthseas,
    # Mat_Numbers
    list(BirthSeas, Sex, Seas, Age, Age_Mat, `Mat*Fecund`, Wt_Beg)]

  # IF maturity_option == 3, mat = mat / wt
  if(all(mat[, Age_Mat] %in% c(0,1)))
    mat[, mat:= `Mat*Fecund` / Wt_Beg]
  
  # maturity option 3: mat=Age_Mat
  if(option == 3)
    mat[, mat:= Age_Mat]

  # maturity option 6: mat=Mat*Fecund / max(Mat*Fecund)
  if(option == 6)
    mat[, mat:= `Mat*Fecund` / max(`Mat*Fecund`), by=.(Sex, Seas, BirthSeas)]

  # DELETE columns
  mat[ ,`:=`(Age_Mat = NULL, `Mat*Fecund` = NULL, Wt_Beg = NULL)]

  # RENAME
  names(mat) <- c("BirthSeas", "Sex", "season", "age", "data")

  # TURN -1/NaN to 0
  mat[, data:=ifelse(is.nan(data), 0, data)]
  mat[, data:=ifelse(data==-1, 0, data)]

  # SWT unit from Sex and BirthSeas
  mat[, uSex:={if(length(unique(Sex)) == 1){""} else {c("F","M")[Sex]}}]
  mat[, uBirthSeas:={if(length(unique(BirthSeas)) == 1){""} else {BirthSeas}}]
  mat[, unit:=ifelse(paste0(uSex, uBirthSeas) == "", "unique", paste0(uSex, uBirthSeas))]
  mat[ ,c("Sex","uSex","BirthSeas","uBirthSeas") := NULL]

  # EXPAND by year & unit & area
  mat <- FLCore::expand(as.FLQuant(mat[, .(season, unit, age, data)],
    units=""), year=dmns$year, unit=dmns$unit, season=dmns$season, area=dmns$area)

  return(mat)
}

#' @rdname ss3slot
#' @aliases ss3m
#' @details - `ss3m` returns the `m` slot.

ss3m <- function(endgrowth, dmns, birthseas) {

  # EXTRACT m - biol[, Seas, BirthSeas, Age, M]
  m <- endgrowth[BirthSeas %in% birthseas,
    list(BirthSeas, Sex, Seas, Age, M)]

  # CREATE unit from Sex + BirthSeas
  m[, uSex:={if(length(unique(Sex)) == 1){""} else {c("F","M")[Sex]}}]
  m[, uBirthSeas:={if(length(unique(BirthSeas)) == 1){""} else {BirthSeas}}]
  m[, unit:=paste0(uSex, uBirthSeas)]
  m[ ,c("Sex","uSex","BirthSeas","uBirthSeas") := NULL]

  # SPLIT M across seasons
  m[, M:=M/length(dmns$season)]

  # RENAME
	names(m) <- c("season", "age", "data", "unit")
  
  # EXPAND by year, unit, season & area
  # BUG expand not filling
  m <- FLCore::expand(as.FLQuant(m[,.(season, age, data, unit)], units="m"),
    year=dmns$year, unit=dmns$unit, season=dmns$season, area=dmns$area)

  return(m)
}

#' @rdname ss3slot
#' @aliases ss3n
#' @param n A data frame obtained from SS_output$natage.
#' @details - `ss3m` returns the `m` slot.

ss3n <- function(n, dmns, birthseas) {
  
  # SELECT start of season (Beg/Mid == 'B'), Era == 'TIME' & cols
  n <- n[`Beg/Mid` == "B" & Era == 'TIME',
    .SD, .SDcols = c("Area", "Sex", "BirthSeas", "Yr", "Seas", dmns$age)]

  # MELT by Sex, BirthSeas, Yr & Seas
	n <- data.table::melt(n, id.vars=c("Area", "Sex", "BirthSeas", "Yr", "Seas"),
    variable.name="age")
  
  # SUBSET according to birthseas
  n <- n[BirthSeas %in% birthseas,]

  # DROP Sex and BirthSeas

  # CREATE unit from Sex + BirthSeas
  n[, uSex:={if(length(unique(Sex)) == 1){""} else {c("F","M")[Sex]}}]
  n[, uBirthSeas:={if(length(unique(BirthSeas)) == 1){""} else {BirthSeas}}]
  n[, unit:=paste0(uSex, uBirthSeas)]
  n[ ,c("Sex","uSex","BirthSeas","uBirthSeas") := NULL]


  # RENAME
  names(n) <- c("area", "year", "season", "age", "data", "unit")
  n <- as.FLQuant(n, units="1000")
  dimnames(n) <- dmns

  return(n)
}

#' @rdname ss3slot
#' @aliases ss3catch
#' @param catage A data frame obtained from SS_output$catage.
#' @param wtatage A data frame obtained from SS_output$endgrowth but subset for `birthseas` and `RetWt:_idx`.
#' @param idx The fishing fleets, as in `SS_output$fleet_ID[SS_output$IsFishFleet]`.
#' @details - `ss3catch` currently returns the `landings.n` slot, equal to `catch.n` as discards are not being parsed.

ss3catch <- function(catage, wtatage, dmns, birthseas, idx) {

  # RECONSTRUCT BirthSeas from Morph & Sex
  catage[, BirthSeas := Morph - max(Seas) * (Gender - 1)]
  catage <- catage[BirthSeas %in% birthseas,]
  
  # CREATE unit from Sex + BirthSeas
  catage[, uSex:={if(length(unique(Gender)) == 1){""} else {c("F","M")[Gender]}}]
  catage[, uBirthSeas:={if(length(unique(BirthSeas)) == 1){""} else {BirthSeas}}]
  catage[, unit:=ifelse(paste0(uSex, uBirthSeas) == "", "unique", paste0(uSex, uBirthSeas))]
  
  wtatage[, uSex:={if(length(unique(Sex)) == 1){""} else {c("F","M")[Sex]}}]
  wtatage[, uBirthSeas:={if(length(unique(BirthSeas)) == 1){""} else {BirthSeas}}]
  wtatage[, unit:=ifelse(paste0(uSex, uBirthSeas) == "", "unique", paste0(uSex, uBirthSeas))]

  # FIND and SUBSET fishing fleets, TIME and BirthSeas
  catage <- catage[Fleet %in% idx & Era == "TIME" & BirthSeas %in% birthseas,]
  
  catage[ ,c("Gender","uSex","BirthSeas","uBirthSeas") := NULL]

  # RENAME Area and Season if only 1
  cols <- c("Seas", "Area")
  catage[, (cols) := lapply(.SD, as.character), .SDcols = cols]
  catage[, Seas := if(length(unique(Seas)) == 1) "all" else Seas]
  catage[, Area := if(length(unique(Area)) == 1) "unique" else Area]

  # MELT by Sex, BirthSeas, Yr & Seas
	catage <- data.table::melt(catage, id.vars=c("Area", "Fleet", "Yr", "Seas", "unit"),
    measure.vars=dmns$age, variable.name="age")
  names(catage) <- c("area", "fleet", "year", "season", "unit", "age", "data")

  # RENAME Area and Season if only 1
  cols <- c("Seas")
  wtatage[, (cols) := lapply(.SD, as.character), .SDcols = cols]
  wtatage[, Seas := if(length(unique(Seas)) == 1) "all" else Seas]

  # MELT by Sex, BirthSeas, Yr & Seas
  wtatage <- data.table::melt(wtatage, id.vars=c("Age", "unit", "Seas"),
    measure.vars=paste0("RetWt:_", idx), variable.name="fleet")
  names(wtatage) <- c("age", "unit", "season", "fleet", "data")
  wtatage[,fleet:=sub("RetWt:_", "", fleet)]

  # FLQuants for catch per fleet
  catch <- lapply(idx, function(x) {
    catch.n <- as.FLQuant(catage[fleet %in% x,][, fleet:=NULL], units="1000")
    catch.wt <- do.call('expand',
      c(list(x=as.FLQuant(wtatage[fleet %in% x,][, fleet:=NULL], units="kg")),
    dimnames(catch.n)[c("year", "area")]))
    return(FLQuants(catch.n=catch.n, catch.wt=catch.wt))
    }
  )
  return(catch)
} 
