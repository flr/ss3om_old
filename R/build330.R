# build330.R - DESC
# /build330.R

# Copyright European Union, 2018
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# buildRESss330 - data.table {{{
buildRESss330 <- function(out, ...) {

  lkels <- c("TOTAL", "Catch", "Survey", "Length_comp", "Recruitment")
  lknms <- c("LIKELIHOOD", "Catch", "Survey", "Length_comp", "Recruitment")
  # setNames(as.list(out$likelihoods_used[lkels, "values"]), lknms)
  
  res <- cbind(data.frame(
  
    # SR_LN(R0)
    `SR_LN(R0)`=out$estimated_non_dev_parameters['SR_LN(R0)', 'Value'],

    # Convergence_Level
    Convergence_Level=out$maximum_gradient_component,

    # SSB_endyr
    `SSB_endyr`=out$derived_quants[paste0("SSB_", out$endyr), "Value"],
  
    # F_endyr
    `F_endyr`=out$derived_quants[paste0("F_", out$endyr), "Value"]),

    # Totbio_Unfished
    `Totbio_unfished`=out$derived_quants["Totbio_unfished", "Value"],

    # SSB_Virgin
    `SSB_Virgin`=out$derived_quants["SSB_Virgin", "Value"],

    # Recr_Virgin
    `Recr_Virgin`=out$derived_quants["Recr_Virgin", "Value"],

    # SSB_MSY
    `SSB_MSY`=out$derived_quants["SSB_MSY", "Value"],
    
    # Fstd_MSY
    `Fstd_MSY`=out$derived_quants["Fstd_MSY", "Value"],
    
    # TotYield_MSY
    # `TotYield_MSY`=out$derived_quants["TotYield_MSY", "Value"],
    
    # RetYield_MSY
    # `RetYield_MSY`=out$derived_quants["RetYield_MSY", "Value"],

    # LIKELIHOOD
    data.frame(setNames(as.list(out$likelihoods_used[lkels, "values"]), lknms)))

  return(data.table(res))
} # }}}

# buildFLSss330 - FLStock {{{

buildFLSss330 <- function(out, birthseas=out$birthseas, name=out$Control_File,
  desc=paste(out$inputs$repfile, out$SS_versionshort, sep=" - "),
  fleets=setNames(out$fleet_ID[out$IsFishFleet], out$fleet_ID[out$IsFishFleet])) {
  
  # SUBSET out
  out <- out[c("catage", "natage", "ageselex", "endgrowth", "Control_File",
    "catch_units", "nsexes", "nseasons", "nareas", "IsFishFleet", "fleet_ID",
    "FleetNames", "birthseas", "spawnseas", "inputs", "SS_versionshort",
    "discard", "catch")]

  # TODO: call spread()
  
  # GET range from catage
  range <- getRange(out$catage)
  ages <- ac(seq(range['min'], range['max']))
  dmns <- getDimnames(out, birthseas=birthseas)
  dim <- unlist(lapply(dmns, length))

  # EXTRACT from out
  if(out$nsexes == 1) {
    endgrowth <- data.table(out$endgrowth, key=c("Seas", "Settlement", "int_Age"))
  } else {
    endgrowth <- data.table(out$endgrowth,
      key=c("Seas", "Sex", "Settlement", "int_Age"))
  }

  # BUG ADD Age, BirthSeas to endgrowth
  endgrowth[, Age:=int_Age]
  endgrowth[, BirthSeas:=Platoon]

  # NATAGE
  natage <- data.table(out$natage)
  
  # CATCH.N
  catage <- data.table(out$catage)
  setkey(catage, "Area", "Fleet", "Sex", "Morph", "Yr", "Seas", "Era")

  # BUG Sex to Gender
  catage[, Gender:=Sex]

  # STOCK.WT
  wt <- ss3wt30(endgrowth, dmns, birthseas=1)

  # MAT
  mat <- ss3mat(endgrowth, dmns, birthseas)

  # M
  m <- ss3m(endgrowth, dmns, birthseas)
  
  # STOCK.N
  n <- ss3n(natage, dmns, birthseas)

  # CATCH.WT, assumes _mat_option == 3
  wtatage <- endgrowth[BirthSeas %in% birthseas,
    c("Seas", "Sex", "BirthSeas", "Age", paste0("RetWt:_", fleets)), with=FALSE]
  
  catches <- ss3catch(catage, wtatage, dmns, birthseas, fleets)
  
  # CALCULATE total catch.n
  catch.n <- FLQuant(0, dimnames=dmns, units="1000")

  for (i in seq(length(fleets)))
    catch.n <- catch.n %++% catches[[i]]$catch.n
  
  # AVERAGE catch.wt weighted by catch.n
  catch.wt <-  FLCore::expand(Reduce("+", lapply(catches,
    function(x) x$catch.n %*% x$catch.wt)) %/% catch.n,
    year=dmns$year, area=dmns$area)
  
  catch.wt[is.na(catch.wt)] <- (Reduce("+",
    lapply(catches, '[[', 'catch.wt')) / length(catches))[is.na(catch.wt)]
  
  # DISCARDS
  if(!is.na(out["discard"])) {
    
    ageselex <- data.table(out$ageselex)
    lastyr <- unique(ageselex[Factor=="sel_nums", Yr])
    
    # TOTAL selex (catch$kill_nums)
    seltot <- ss3sel.pattern(ageselex, lastyr, fleets, morphs=unique(ageselex$Morph),
      factor="sel_nums")
    
    # RETAINED selex (catch$ret_num)
    selret <- ss3sel.pattern(ageselex, lastyr, fleets, morphs=unique(ageselex$Morph),
      factor="sel*ret_nums")
    
    # DEAD selex (catch$kill_num)
    seldea <- ss3sel.pattern(ageselex, lastyr, fleets, morphs=unique(ageselex$Morph),
      factor="dead_nums")
    
    # DISCARD selex (dead + alive)
    seldis <- mapply(function(x, y) x - y, seltot, selret, SIMPLIFY=FALSE)

    discard <- data.table(out$discard)
    catch <- data.table(out$catch)

    # F_discards by fleet: catch from last estimation yr
    Fdiscards <- FLQuants(mapply(function(x, y) x * y, seldis,
      as.list(catch[Yr == max(Yr) & Fleet %in% fleets, F]), SIMPLIFY=FALSE))

    # APPLY Baranov for discards.n
    discards.n <- Reduce('+', mapply(function(x)
      FLQuant((x %/% (x %+% m)) * (1 - exp(-(x %+% m))) * n, units="1000"),
      Fdiscards, SIMPLIFY=FALSE))
    dimnames(discards.n) <- dimnames(catch.n)

    # SET discards.n not in discard period as 0
    discards.n[, !dimnames(discards.n)$year %in% discard$Yr] <- 0
    
    discards.wt <- catch.wt

  } else {
    discards.n <- catch.n
    discards.n[] <- 0
    discards.wt <- catch.wt
  }

  # FLStock
  stock <- FLStock(
    name=name, desc=desc,
    catch.n=catch.n, catch.wt=catch.wt,
    discards.n=discards.n, discards.wt=discards.wt,
    landings.n=catch.n - discards.n, landings.wt=catch.wt,
    stock.n=n, stock.wt=wt,
    m=m, mat=mat)

  # CALCULATE stock, catch, landings & discards
  landings(stock) <- computeLandings(stock)
  discards(stock) <- computeDiscards(stock)
  catch(stock) <- computeCatch(stock, slot='all')
  stock(stock) <- computeStock(stock)

  # ASSIGN harvest.spwn and m.spwn in birthseas
  harvest.spwn(stock)[,,,birthseas] <- 0
  m.spwn(stock)[,,,birthseas] <- 0

  # HARVEST
  harvest(stock) <- harvest(stock.n(stock), catch=catch.n(stock), m=m(stock))

  return(stock)

} # }}}

# ss3wt30 {{{

ss3wt30 <- function(endgrowth, dmns, birthseas) {
  
  # EXTRACT
  # BUG Mid or Beg
  wt <- endgrowth[, list(Sex, Seas, BirthSeas, int_Age, Wt_Beg)]

  # CREATE unit from Sex + BirthSeas
  wt[, uSex:={if(length(unique(Sex)) == 1){""} else {c("F","M")[Sex]}}]
  wt[, uBirthSeas:={if(length(unique(BirthSeas)) == 1){""} else {BirthSeas}}]
  wt[, unit:=paste0(uSex, uBirthSeas)]
  wt[, unit:=ifelse(paste0(uSex, uBirthSeas) == "", "unique",
    paste0(uSex, uBirthSeas))]
  wt[, c("Sex","uSex","BirthSeas","uBirthSeas") := NULL]

  # RENAME
  names(wt) <- c("season", "age", "data", "unit")
  
  # EXPAND by year, unit & season
  return(FLCore::expand(as.FLQuant(wt[, .(season, age, data, unit)], units="kg"),
    year=dmns$year, unit=dmns$unit, season=dmns$season, area=dmns$area))
} # }}}
