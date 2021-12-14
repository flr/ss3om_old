# ss3slots.R - DESC
# ss3om/R/ss3slots.R

# Copyright European Union, 2015-2019; WMR, 2020.
# Author: Iago Mosqueira (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

#' @rdname ss3slot
#' @aliases ss3mat30
#' @details - `ss3mat30` returns the `mat` slot.

ss3mat30 <- function(endgrowth, dmns, spawnseas, option=3) {
  
  # EXTRACT mat - endgrowth
  mat <- endgrowth[, .(unit, Seas, Age, Age_Mat, `Mat*Fecund`, Wt_Beg,
    Mat_F_wtatage, Mat_F_Natage)]

  # maturity option 6: mat=Mat*Fecund / max(Mat*Fecund)
  if(option == 6)
    #mat[, mat:= `Mat*Fecund` / max(`Mat*Fecund`), by=.(unit, Seas)]
    mat[, mat:= `Mat*Fecund`]
  
  # maturity option 3: mat=Age_Mat
  if(option == 3)
    mat[, mat:= Age_Mat]

  # maturity option 1: mat=Mat*Fecund / Wt_Beg
  if(option == 1)
    mat[, mat:= `Mat*Fecund` / Wt_Beg]

  # DEBUG
  if(option == 2)
    mat[, mat:= Age_Mat]
  
  # DEBUG
  if(option == 5)
    mat[, mat:= 0]
  
  # DEBUG
  if(!option %in% c(3, 6, 1, 2, 5))
    stop(paste0("maturity option not covered yet, option: ", option))

  # DELETE columns
  mat[ ,`:=`(Age_Mat = NULL, `Mat*Fecund` = NULL, Wt_Beg = NULL,
    Mat_F_wtatage = NULL, Mat_F_Natage = NULL)]

  # SET mat out of Spawn_seas to 0
  mat[!Seas %in% spawnseas, mat:=0]

  # RENAME
  names(mat) <- c("unit", "season", "age", "data")

  # TURN -1/NaN to 0
  mat[, data:=ifelse(is.nan(data), 0, data)]
  mat[, data:=ifelse(data==-1, 0, data)]

  # EXPAND by year & unit & area
  mat <- FLCore::expand(as.FLQuant(mat[, .(season, unit, age, data)],
    units=""), year=dmns$year, unit=dmns$unit, season=dmns$season,
    area=dmns$area)

  return(mat)
}

#' @rdname ss3slot
#' @aliases ss3m
#' @details - `ss3m` returns the `m` slot.

ss3m30 <- function(endgrowth, dmns, birthseas) {
  
  # EXTRACT m - biol[, Seas, BirthSeas, Age, M]
  m <- endgrowth[, .(Age, unit, Seas, M)]

  # SPLIT M across seasons
  m[, M:=M/length(dmns$season)]

  # RENAME
	names(m) <- c("age", "unit", "season", "data")
  
  # EXPAND by year, unit, season & area
  # BUG expand not filling
  m <- FLCore::expand(as.FLQuant(m[,.(season, age, data, unit)], units="m"),
    year=dmns$year, unit=dmns$unit, season=dmns$season, area=dmns$area)

  return(m)
}

#' @rdname ss3slot
#' @aliases ss3n
#' @param n A data frame obtained from SS_output$natage.
#' @details - `ss3n30` returns the `stock.n` slot.

ss3n30 <- function(n, dmns) {
  
  # SELECT start of season (Beg/Mid == 'B'), Era == 'TIME' & cols
  n <- n[`Beg/Mid` == "B" & Era == 'TIME',
    .SD, .SDcols = c("Area", "unit", "Yr", "Seas", dmns$age)]

  # MELT by Sex, unit, Yr & Seas
  # TODO convert to double
	n <- data.table::melt(n, id.vars=c("Area", "unit", "Yr", "Seas"),
    variable.name="age")
  
  # RENAME
  names(n) <- c("area", "unit", "year", "season", "age", "data")
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

ss3catch30 <- function(catage, wtatage, dmns, birthseas, idx) {

  # FIND and SUBSET fishing fleets, TIME and BirthSeas
  catage <- catage[Fleet %in% idx & Era == "TIME",]
 
  # RENAME Area and Season if only 1
  cols <- c("Seas", "Area")
  catage[, (cols) := lapply(.SD, as.character), .SDcols = cols]
  catage[, Seas := if(length(unique(Seas)) == 1) "all" else Seas]
  catage[, Area := if(length(unique(Area)) == 1) "unique" else Area]

  # MELT by Sex, BirthSeas, Yr & Seas
  catage[, (dmns$age) := lapply(.SD, as.double), .SDcols = dmns$age]

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

ss3z30 <- function(zatage, m, dmns) {

  zaa <- zatage[Yr %in% dmns$year, -1]
  setnames(zaa, c("Sex", "Yr"), c("unit", "year"))

  zatage <- data.table::melt(zaa, id.vars=c("unit", "year"),
    measure.vars=dmns$age, variable.name="age", value.name = "data")
  
  z <- as.FLQuant(zatage, units="z")
  dimnames(z) <- dmns[-4]

  return(z)
}

ss3wt30 <- function(endgrowth, dmns, birthseas) {
  
  # EXTRACT
  wt <- endgrowth[, list(Age, unit, Seas, Wt_Beg)]

  # RENAME
  names(wt) <- c("age", "unit", "season", "data")
  
  # EXPAND by year, unit & season
  return(FLCore::expand(as.FLQuant(wt, units="kg"),
    year=dmns$year, unit=dmns$unit, season=dmns$season, area=dmns$area))
}
