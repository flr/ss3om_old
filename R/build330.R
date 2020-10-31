# build330.R - DESC
# /build330.R

# Copyright European Union, 2015-2019; WMR, 2020.
# Author: Iago Mosqueira (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# buildFLSss330 - FLStock {{{

buildFLSss330 <- function(out, birthseas=out$birthseas, name=out$Control_File,
  desc=paste(out$inputs$repfile, out$SS_versionshort, sep=" - "),
  fleets=setNames(nm=out$fleet_ID[out$IsFishFleet]), range="missing") {

  # DIMENSIONS
  dims <- dimss3(out)
  
  # SUBSET out
  out <- out[c("catage", "natage", "ageselex", "endgrowth", "Control_File",
    "catch_units", "nsexes", "nseasons", "nareas", "IsFishFleet", "fleet_ID",
    "FleetNames", "birthseas", "spawnseas", "inputs", "SS_versionshort",
    "discard", "discard_at_age", "catch", "NatMort_option", "GrowthModel_option",
    "Maturity_option", "Fecundity_option", "Z_at_age", "M_at_age",
    "mean_body_wt", "Spawn_timing_in_season")]

  # GET ages from catage
  ages <- getRange(out$catage)
  ages <- ac(seq(ages['min'], ages['max']))
  dmns <- getDimnames(out, birthseas=birthseas)
  dim <- unlist(lapply(dmns, length))

  # ENDGROWTH
  if(out$nsexes == 1) {
    endgrowth <- data.table(out$endgrowth,
      key=c("Seas", "Platoon", "Settlement", "int_Age"))
  } else {
    endgrowth <- data.table(out$endgrowth,
      key=c("Seas", "Sex", "Platoon", "Settlement", "int_Age"))
  }

  # SET Age and unit
  endgrowth[, Age:=int_Age]
  endgrowth[, unit:=codeUnit(Sex, Platoon)]

  # NATAGE
  natage <- data.table(out$natage)
  natage[, unit:=codeUnit(Sex, Platoon)]
  
  # CATCH.N
  catage <- data.table(out$catage)
  catage[, unit:=codeUnit(Sex)]
  # NOTE catage$0 comes out as integer
  catage[, `0` := as.double(`0`)]
  setkey(catage, "Area", "Fleet", "unit", "Yr", "Seas", "Era")

  # WT
  wtatage <- endgrowth[, c("Seas", "unit", "Age", paste0("RetWt:_", fleets)),
    with=FALSE]

  # STOCK.WT
  wt <- ss3wt30(endgrowth, dmns, birthseas=1)

  # MAT
  mat <- ss3mat30(endgrowth, dmns, birthseas, option=out$Maturity_option)

  # CORRECT Mat*Fecund to by unit body weight
  if(out$Maturity_option == 6)
    mat <- mat / wt

  # M
  m <- ss3m30(endgrowth, dmns, birthseas)
  
  # STOCK.N
  n <- ss3n30(natage, dmns, birthseas)

  # CATCH 
  catches <- ss3catch30(catage, wtatage, dmns, birthseas, fleets)

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

    stop("PROBLEM with discards")
  
    datage <- data.table(out$discard_at_age)
    datage[, unit:=codeUnit(Sex)]
    setkey(datage, "Area", "Fleet", "unit", "Yr", "Seas", "Era", "Type")
    
    # DEBUG
    ageselex <- data.table(out$ageselex)
    lastyr <- unique(ageselex[Factor=="Asel2", Yr])
    
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
    discards.n <- catch.n * 0
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

  # ASSIGN harvest.spwn and m.spwn
  harvest.spwn(stock) <- out$Spawn_timing_in_season
  m.spwn(stock) <- out$Spawn_timing_in_season

  # HARVEST
  harvest(stock) <- harvest(stock.n(stock), catch=catch.n(stock), m=m(stock))

  # range
  if(!missing(range))
    range(stock) <- range

  return(stock)

} # }}}

# buildFLIBss330 - FLIndices(FLIndexBiomass) {{{
buildFLIBss330 <- function(out, fleets, birthseas=out$birthseas, ...) {
  
  # SUBSET from out
  out <- out[c("cpue", "ageselex", "endgrowth", "catage", "definitions",
    "nsexes", "nseasons", "nareas", "birthseas")]

  cpue <- data.table(out[["cpue"]])
 
  # GET cpue fleets 
  cpuefleets <- setNames(seq(length(unique(cpue$Fleet_name))), unique(cpue$Fleet_name))
  
  if(missing(fleets))
    fleets <- cpuefleets
  else {
    if(is.character(fleets))
      fleets <- cpuefleets[names(cpuefleets) %in% fleets]
    else if(is.numeric(fleets))
      fleets <- cpuefleets[fleets]
    
    # STOP if wrong fleets
    if(length(fleets) == 0 | any(is.na(fleets)))
      stop("selected fleets not found in Report.sso file")
  }

  selex <- data.table(out[["ageselex"]])
  endgrowth <- data.table(out[["endgrowth"]])

  # SET Age and unit
  endgrowth[, Age:=int_Age]
  endgrowth[, unit:=codeUnit(Sex, Platoon)]

  wtatage <- endgrowth[,
    c("Seas", "unit", "Age", paste0("RetWt:_", fleets)), with=FALSE]
  catage <- data.table(out[["catage"]])
    setkey(catage, "Area", "Fleet", "Sex", "Morph", "Yr", "Seas", "Era")
  definitions <- data.table(out$definitions)

  # --- index
  index <- ss3index(cpue, fleets)

  # --- index.q
  index.q <- ss3index.q(cpue, fleets)

  # --- sel.pattern
  sel.pattern <- ss3sel.pattern(selex, unique(cpue$Yr), fleets,
    morphs=unique(selex$Morph))

  # --- index.var (var)
  index.var <- ss3index.var(cpue, fleets)

  # --- index.res (var)
  index.res <- ss3index.res(cpue, fleets)
  
  # --- catch.n
  #catch <- ss3catch30(catage, wtatage, dmns=getDimnames(out, birthseas=birthseas),
  #  birthseas=birthseas, idx=fleets)
  #catch.n <- lapply(catch, "[[", "landings.n")
  
  # --- FLIndices
  cpues <- lapply(names(fleets), function(x) {
    
    dmns <- dimnames(index[[x]])
    
    selpat <- window(sel.pattern[[x]], start=dims(index[[x]])$minyear,
        end=dims(index[[x]])$maxyear)
    
    FLIndexBiomass(name=x,
      distribution="lnorm", 
      index=index[[x]],
      index.q=index.q[[x]],
      index.var=index.res[[x]],
      # TODO How to link each cpue fleet to catch fleets for catch.n
      # TRIM catch.n to index seasons
   #   catch.n=unitSums(window(catch.n[[x]], start=dims(index[[x]])$minyear,
   #     end=dims(index[[x]])$maxyear))[,,,dmns$season],
      # NORMALIZE sel.pattern
      sel.pattern=selpat %/% apply(selpat, 2:6, max))[,,,dmns$season]
    })

  names(cpues) <- names(fleets)
  
  return(FLIndices(cpues))

} # }}}

# buildFLRPss330 - FLPar {{{
buildFLRPss330 <- function(out, ...) {

  # SUBSET out
  dquants <- data.table(out$derived_quants)

  FLPar(
    # SB0
    SB0=dquants[Label == "SSB_Virgin", Value],
    
    # B0
    B0=dquants[Label == "Totbio_unfished", Value],

    # R0
    R0=dquants[Label == "Recr_unfished", Value],

    # SBMSY
    SBMSY=dquants[Label == "SSB_MSY", Value],

    # FMSY
    FMSY=dquants[Label == "annF_MSY", Value],

    # MSY
    MSY=dquants[Label == "Dead_Catch_MSY", Value],
    
    units=c("t", "t", "1000", "t", "f", "t"))
} # }}}

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
    `Fstd_MSY`=out$derived_quants["annF_MSY", "Value"],
    
    # TotYield_MSY
    # `TotYield_MSY`=out$derived_quants["TotYield_MSY", "Value"],
    
    # RetYield_MSY
    # `RetYield_MSY`=out$derived_quants["RetYield_MSY", "Value"],

    # LIKELIHOOD
    data.frame(setNames(as.list(out$likelihoods_used[lkels, "values"]), lknms)))

  return(data.table(res))
} # }}}

# buildFLBss330 {{{

buildFLBss330 <- function(out, birthseas=out$birthseas, name=out$Control_File,
  desc=paste(out$inputs$repfile, out$SS_versionshort, sep=" - ")) {

  # BUILD stk and srr
  stk <- buildFLSss330(out, birthseas=birthseas, name=name, desc=desc)
  srr <- buildFLSRss3(out)

  # COERCE to FLBiol
  bio <- as(stk, "FLBiol")

  # ADD rec
  rec(bio) <- as(srr, "predictModel")

  return(bio)
} # }}}
