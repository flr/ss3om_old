# build.R - Function to build FLR objects from the list returned by SS_output
# ioalbmse/R/build.R

# Copyright European Union, 2015-2019; WMR, 2020.
# Author: Iago Mosqueira (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.


# buildFLSss3 - FLStock {{{

buildFLSss3 <- function(out, birthseas=out$birthseas, name=out$Control_File,
  desc=paste(out$inputs$repfile, out$SS_versionshort, sep=" - "), range="missing",
  fleets=setNames(out$fleet_ID[out$IsFishFleet], out$fleet_ID[out$IsFishFleet])) {
  
  # SUBSET out
  out <- out[c("catage", "natage", "ageselex", "endgrowth", "Control_File",
    "catch_units", "nsexes", "nseasons", "nareas", "IsFishFleet", "fleet_ID",
    "FleetNames", "birthseas", "spawnseas", "inputs", "SS_versionshort",
    "discard", "catch", "morph_indexing")]

  # TODO: call spread()

  # GET ages from catage
  ages <- getRange(out$catage)
  ages <- ac(seq(ages['min'], ages['max']))
  dmns <- getDimnames(out)
  dim <- unlist(lapply(dmns, length))

  # EXTRACT from out
  if(out$nsexes == 1) {
    endgrowth <- data.table(out$endgrowth, key=c("Seas", "Age"))
  } else {
    endgrowth <- data.table(out$endgrowth, key=c("Seas", "Sex", "Age"))
  }
  # NATAGE
  natage <- data.table(out$natage)
  
  # CATCH.N
  catage <- data.table(out$catage)
  setkey(catage, "Area", "Fleet", "Gender", "Morph", "Yr", "Seas", "Era")

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
    c("Seas", "Sex", "BirthSeas", "Age", paste0("RetWt:_", fleets)), with=FALSE]
  
  catches <- ss3catch(catage, wtatage, dmns, birthseas, fleets)
  
  # CALCULATE total catch.n & catch.wt
  catch.n <- FLQuant(0, dimnames=dmns, units="1000")
  catch.wt <- FLQuant(0, dimnames=dmns, units="kg")
  catch.den <- FLQuant(0, dimnames=dmns, units="kg")
  
  for (i in seq(length(fleets))) {
    catch.n <- catch.n %++% catches[[i]]$catch.n

    # DROP NAs from discards fleets
    if(!all(is.na(catches[[i]]$catch.wt))) {
      catch.den <- catch.n %++% catches[[i]]$catch.n
      catch.wt <- catch.wt %++% (catches[[i]]$catch.wt * (catches[[i]]$catch.n + 1e-3))
    }
  }
  
  # COMPUTE no. of fleets per area
  wtsbyarea <- c(table(unlist(lapply(catches, function(x) dimnames(x$catch.wt)$area))))

  # DIVIDE by total catch
  catch.wt <- catch.wt / (catch.den + FLQuant(rep(1e-3 * wtsbyarea,
    each=prod(dim(catch.n)[-5])), dimnames=dmns, units="1000"))

  # RESET units(catch.wt)
  units(catch.wt) <- "kg"

  # DISCARDS
  if(!is.na(out["discard"])) {
    
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
  
  # range
  if(!missing(range))
    range(stock) <- range

  return(stock)

} # }}}

# HACK for no discards selex
# buildFLSss3 - FLStock {{{

buildFLSss3 <- function(out, birthseas=out$birthseas, name=out$Control_File,
  desc=paste(out$inputs$repfile, out$SS_versionshort, sep=" - "), range="missing",
  fleets=setNames(out$fleet_ID[out$IsFishFleet], out$fleet_ID[out$IsFishFleet])) {
  
  # SUBSET out
  out <- out[c("catage", "natage", "ageselex", "endgrowth", "Control_File",
    "catch_units", "nsexes", "nseasons", "nareas", "IsFishFleet", "fleet_ID",
    "FleetNames", "birthseas", "spawnseas", "inputs", "SS_versionshort",
    "discard", "catch", "morph_indexing")]

  # TODO: call spread()

  # GET ages from catage
  ages <- getRange(out$catage)
  ages <- ac(seq(ages['min'], ages['max']))
  dmns <- getDimnames(out)
  dim <- unlist(lapply(dmns, length))

  # EXTRACT from out
  if(out$nsexes == 1) {
    endgrowth <- data.table(out$endgrowth, key=c("Seas", "Age"))
  } else {
    endgrowth <- data.table(out$endgrowth, key=c("Seas", "Sex", "Age"))
  }
  # NATAGE
  natage <- data.table(out$natage)
  
  # CATCH.N
  catage <- data.table(out$catage)
  setkey(catage, "Area", "Fleet", "Gender", "Morph", "Yr", "Seas", "Era")

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
    c("Seas", "Sex", "BirthSeas", "Age", paste0("RetWt:_", fleets)), with=FALSE]
  
  catches <- ss3catch(catage, wtatage, dmns, birthseas, fleets)
  
  # CALCULATE total catch.n & catch.wt
  catch.n <- FLQuant(0, dimnames=dmns, units="1000")
  catch.wt <- FLQuant(0, dimnames=dmns, units="kg")
  catch.den <- FLQuant(0, dimnames=dmns, units="kg")
  
  for (i in seq(length(fleets))) {
    catch.n <- catch.n %++% catches[[i]]$catch.n

    # DROP NAs from discards fleets
    if(!all(is.na(catches[[i]]$catch.wt))) {
      catch.den <- catch.n %++% catches[[i]]$catch.n
      catch.wt <- catch.wt %++% (catches[[i]]$catch.wt * (catches[[i]]$catch.n + 1e-3))
    }
  }
  
  # COMPUTE no. of fleets per area
  wtsbyarea <- c(table(unlist(lapply(catches, function(x) dimnames(x$catch.wt)$area))))

  # DIVIDE by total catch
  catch.wt <- catch.wt / (catch.den + FLQuant(rep(1e-3 * wtsbyarea,
    each=prod(dim(catch.n)[-5])), dimnames=dmns, units="1000"))

  # RESET units(catch.wt)
  units(catch.wt) <- "kg"

  # DISCARDS
  if(!is.na(out["discard"])) {

    ageselex <- data.table(out$ageselex)
    lastyr <- unique(ageselex[Factor=="Asel2", Yr])

    # CHECK runs with no discards selex
    if(all(c("sel_nums", "sel*ret_nums", "dead_nums") %in% ageselex$Factor)) {
    
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
      warning("Model has discards estimates but discards-at-age could not be built.")
      discards.n <- catch.n
      discards.n[] <- 0
      discards.wt <- catch.wt
    }
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
  
  # range
  if(!missing(range))
    range(stock) <- range

  return(stock)

} # }}}

# buildFLSRss3 - FLSR {{{
buildFLSRss3 <- function(out, ...) {
  
  # SUBSET out
  out <- out[c("parameters", "recruit", "derived_quants",
    "likelihoods_used", "SRRtype", "spawnseas", "CoVar", "nsexes")]

  # EXTRACT elements
  recruit <- data.table(out$recruit)[era %in% c("Fixed", "Main"),]
  parameters <- data.table(out$parameters)
  dquants <- data.table(out$derived_quants)
  lkhds <- out$likelihoods_used
  yrs <- recruit$Yr

  # logLik
  logLik <- lkhds[rownames(lkhds) == "Recruitment", "values"]
  class(logLik) <- "logLik"

  # params & model
  rawp <- parameters[grepl("SR_", Label),]
  
  # BH
  if(out$SRRtype %in% c(3, 6)) {
    params <- FLPar(
      s=rawp[Label == "SR_BH_steep", Value],
      R0=exp(rawp[Label == "SR_LN(R0)", Value]),
      v=dquants[Label == "SSB_Virgin", Value],
      sratio=1 / out$nsexes,
      units=c("", "1000", "t"))
    model <- "bevholtss3"
    attr(logLik, "df") <- length(rawp[!is.na(Active_Cnt), Active_Cnt])
  # survSRR
  } else if(out$SRRtype == 7) {
    params <- FLPar(
      R0=exp(rawp[Label == "SR_LN(R0)", Value]),
      Sfrac=exp(rawp[Label == "SR_surv_Sfrac", Value]),
      beta=exp(rawp[Label == "SR_surv_Beta", Value]),
      SF0=dquants[Label == "SSB_Virgin", Value],
      units=c("1", "", "", "pups"))
    model <- "survSRR"
    attr(logLik, "df") <- length(rawp[!is.na(Active_Cnt), Active_Cnt])
  }

  # TODO SETUP for multiple recruit season/units
  
  # LOAD FLQuants
  dms <- list(year=yrs, season=out$spawnseas)

  # rec
  rec <- FLQuant(recruit$pred_rec, dimnames=c(age=0, dms), units="1000")
  # ssb
  ssb <- FLQuant(recruit$SpawnBio, dimnames=c(age="all", dms), units="t")
  # fitted
  fitted <- FLQuant(recruit$bias_adjusted, dimnames=c(age=0, dms), units="1000")
  # residuals
  residuals <- FLQuant(recruit$dev, dimnames=c(age=0, dms), units="")
  
  # vcov
  estpar <- parameters[grepl("SR_", Label),][!is.na(Active_Cnt),]
  
  # CREATE var is only one param estimated
  if(dim(estpar)[1] == 1) {
    vcov <- array((estpar$Parm_StDev)^2, dim=c(1,1,1),
      dimnames=list(estpar$Label, estpar$Label, iter=1))
  } else if(dim(estpar)[1] > 1) {
    CoVar <- data.table(out$CoVar)
    if(sum(dim(CoVar)) > 0)
      vcov <- CoVar[label.i %in% estpar$Label & label.j %in% estpar$Label,]
    else
      vcov <- array(numeric(0))
  }

  res <- FLSR(model=model, params=params, rec=rec, ssb=ssb, fitted=fitted,
    residuals=residuals)
  
  logLik(res) <- logLik
  distribution(res)[1] <- "lnorm"

  return(res)
}
# }}}

# buildFLIBss3 - FLIndices(FLIndexBiomass) {{{
buildFLIBss3 <- function(out, fleets, birthseas=out$birthseas, ...) {

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
  wtatage <- endgrowth[BirthSeas %in% birthseas,
    c("Seas", "Sex", "BirthSeas", "Age", paste0("RetWt:_", fleets)), with=FALSE]
  catage <- data.table(out[["catage"]])
    setkey(catage, "Area", "Fleet", "Gender", "Morph", "Yr", "Seas", "Era")
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
  catch <- ss3catch(catage, wtatage, dmns=getDimnames(out),
    birthseas=birthseas, idx=fleets)
  catch.n <- lapply(catch, "[[", "landings.n")
  
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

# buildFLRPss3 - FLPar {{{
buildFLRPss3 <- function(out, ...) {

  # SUBSET out
  dquants <- data.table(out$derived_quants)

  FLPar(
    # SB0
    SB0=dquants[Label == "SSB_Unfished", Value],
    
    # B0
    B0=dquants[Label == "TotBio_Unfished", Value],

    # R0
    R0=dquants[Label == "Recr_Unfished", Value],

    # SBMSY
    SBMSY=dquants[Label == "SSB_MSY", Value],

    # FMSY
    FMSY=dquants[Label == "Fstd_MSY", Value],

    # MSY
    MSY=dquants[Label == "TotYield_MSY", Value],
    
    units=c("t", "t", "1000", "t", "f", "t"))
} # }}}

# buildKobess3 - data.frame {{{
buildKobess3 <- function(out, ...) {

  yrs <- out$Kobe[,'Year']
  res <- FLQuants(
    B.BMSY=FLQuant(out$Kobe[,'B.Bmsy'], dimnames=list(year=yrs), units=""),
    F.FMSY=FLQuant(out$Kobe[,'F.Fmsy'], dimnames=list(year=yrs), units=""))

  return(res)

} # }}}

# buildRESss3 - data.table {{{
buildRESss3 <- function(out, ...) {

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

    # TotBio_Unfished
    `TotBio_Unfished`=out$derived_quants["TotBio_Unfished", "Value"],

    # SSB_Virgin
    `SSB_Virgin`=out$derived_quants["SSB_Virgin", "Value"],

    # Recr_Virgin
    `Recr_Virgin`=out$derived_quants["Recr_Virgin", "Value"],

    # SSB_MSY
    `SSB_MSY`=out$derived_quants["SSB_MSY", "Value"],
    
    # Fstd_MSY
    `Fstd_MSY`=out$derived_quants["Fstd_MSY", "Value"],
    
    # TotYield_MSY
    `TotYield_MSY`=out$derived_quants["TotYield_MSY", "Value"],
    
    # RetYield_MSY
    `RetYield_MSY`=out$derived_quants["RetYield_MSY", "Value"],

    # LIKELIHOOD
    data.frame(setNames(as.list(out$likelihoods_used[lkels, "values"]), lknms)))

    # RETURN F_endyr as actual F
    res$F_endyr <- res$F_endyr * res$Fstd_MSY

  return(data.table(res))
} # }}}

# buildFLBFss3 - list(FLBiol, FLFisheries) {{{

buildFLBFss3 <- function(out, birthseas=unique(out$natage$BirthSeas)) {
  
  out <- out[c("catage", "wtatage", "natage", "ageselex", "endgrowth",
    "catch_units", "nsexes", "nseasons", "nareas", "IsFishFleet", "fleet_ID",
    "FleetNames", "timeseries", "parameters")]

  # GET range
  range <- getRange(out$catage)
  ages <- ac(seq(range['min'], range['max']))

  # GET dimnames
  dmns <- getDimnames(out)
  dim <- unlist(lapply(dmns, length))

  # --- BIOL (endgrowth, natage)

  # EXTRACT endgrowth
  endgrowth <- data.table(out$endgrowth, key=c("Seas", "Sex", "BirthSeas", "Age"))

  # -- STOCK.WT
  
  # EXTRACT stock.wt - endgrowth[, Seas, BirthSeas, Age, M]
  wt <- endgrowth[BirthSeas %in% birthseas,
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
  mat <- endgrowth[BirthSeas %in% birthseas & Sex == 1,
    list(BirthSeas, Sex, Seas, Age, Age_Mat)]

  # RENAME
  names(mat) <- c("BirthSeas", "unit", "season", "age", "data")

  # EXPAND by year & unit
  mat <- FLCore::expand(as.FLQuant(mat[, .(season, age, data)],
    units="NA"), year=dmns$year, unit=dmns$unit)

  mat <- predictModel(mat=mat, model=~mat)

  # -- M
  
  # EXTRACT m - biol[, Seas, BirthSeas, Age, M]
  m <- endgrowth[BirthSeas %in% birthseas,
    list(BirthSeas, Sex, Seas, Age, M)]

  # CREATE unit from Gender + BirthSeas
  m[, unit:=paste0(ifelse(Sex == 1, "F", "M"),
    ifelse(length(birthseas) == 1, "", BirthSeas)),]

  # RENAME
	names(m) <- c("BirthSeas", "Sex", "season", "age", "data", "unit")
  
  # EXPAND by year, unit & season
  m <- FLCore::expand(as.FLQuant(m[,.(season, age, data, unit)], units="m"),
    year=dmns$year, unit=dmns$unit, season=dmns$season)

  # -- N

  n <- data.table(out$natage)
  
  # SELECT start of season (Beg/Mid == 'B'), Era == 'TIME' & cols
  n <- n[`Beg/Mid` == "B" & Era == 'TIME',
    .SD, .SDcols = c("Sex", "BirthSeas", "Yr", "Seas", ages)]

  # MELT by Gender, BirthSeas, Yr & Seas
  # BUG: BirthSeason should turn at some point to BirthSeas
	n <- data.table::melt(n, id.vars=c("Sex", "BirthSeas","Yr","Seas"),
    variable.name="age")
  
  # SUBSET according to birthseas
  n <- n[BirthSeas %in% birthseas, ]

  # CREATE unit from Gender + BirthSeas
  n[, unit:=paste0(ifelse(Sex == 1, "F", "M"),
    ifelse(length(birthseas) == 1, "", BirthSeas)),]
  
  # DROP Gender and BirthSeas
  n[, c("Sex","BirthSeas") := NULL]

  # RENAME
  names(n) <- c("year", "season", "age", "data", "unit")

  n <- as.FLQuant(n, units="1000")

  # REC
  rec <- predictModel(model=~(4 * h * R0 * unitSums(ssb)) / (B0 * (1 - h) +
    unitSums(ssb) * (5 * h -1)), params=FLPar(h=out$parameters["SR_BH_steep","Value"],
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
    key=c("Yr", "Seas", "Sex", "BirthSeas", "Fleet"))
  ageselex <- data.table(out$ageselex,
    key=c("Factor", "Fleet", "Yr", "Seas", "Sex", "Morph"))[Factor == "Asel2",]

  # BUG: Yr in wtatage is negative
  wtatage[, Yr:=abs(Yr)]

  # RECONSTRUCT BirthSeas from Morph & Gender
  catage[, BirthSeas := Morph - (max(Seas) * (Gender - 1))]
  ageselex[, BirthSeas := Morph - (max(Seas) * (Sex - 1))]
  
  # FIND and SUBSET fishing fleets, TIME and BirthSeas
  idx <- out$fleet_ID[out$IsFishFleet]
  catage <- catage[Fleet %in% idx & Era == "TIME" & BirthSeas %in% birthseas,]
  # BUG: scoping does not allow [ on variable with name matching column name
  ref <- birthseas
  wtatage <- wtatage[Fleet %in% idx & BirthSeas %in% ref,]
  ageselex <- ageselex[Yr >= min(catage[, Yr]) & Yr <= max(catage[, Yr]) &
    BirthSeas %in% birthseas,]

  # CREATE unit from Gender + BirthSeas
  catage[, unit:=paste0(ifelse(Gender == 1, "F", "M"),
    ifelse(length(birthseas) == 1, "", BirthSeas)),]
  wtatage[, unit:=paste0(ifelse(Sex == 1, "F", "M"),
    ifelse(length(ref) == 1, "", BirthSeas)),]
  ageselex[, unit:=paste0(ifelse(Sex == 1, "F", "M"),
    ifelse(length(ref) == 1, "", BirthSeas)),]

  # MELT by Gender, BirthSeas, Yr & Seas
	catage <- data.table::melt(catage, id.vars=c("Area", "Fleet", "Yr", "Seas", "unit"),
    measure.vars=ages, variable.name="age")
  names(catage) <- c("area", "fleet", "year", "season", "unit", "age", "data")

  wtatage <- data.table::melt(wtatage, id.vars=c("Yr", "Seas", "Fleet", "unit"),
    measure.vars=ages, variable.name="age")
  names(wtatage) <- c("year", "season", "fleet", "unit", "age", "data")

	ageselex <- data.table::melt(ageselex, id.vars=c("Fleet", "Yr", "Seas", "unit"),
    measure.vars=ages, variable.name="age")
  names(ageselex) <- c("fleet", "year", "season", "unit", "age", "data")

  # CATCHES
  catches <- lapply(idx, function(x) {

    landings.n <- as.FLQuant(catage[fleet %in% x,][, fleet:=NULL], units="1")
    landings.wt <- as.FLQuant(wtatage[fleet %in% x,][, fleet:=NULL], units="kg")
    # catch.sel <- predictModel(model=~catch.sel,
    #   FLQuants(catch.sel=as.FLQuant(ageselex[fleet %in% x,][, fleet:=NULL], units="NA")))
    catch.sel <- as.FLQuant(ageselex[fleet %in% x,][, fleet:=NULL], units="NA")
  
    # CORRECT landings.n in biomass to numbers (catch_units)
    if(out$catch_units[x] == 1) {
      landings.n <- landings.n / landings.wt
      units(landings.n) <- "1"
    }

    res <- FLCatch(name="ALB", landings.n=landings.n, landings.wt=landings.wt,
      catch.sel=catch.sel)

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
