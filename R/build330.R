# build330.R - DESC
# /build330.R

# Copyright European Union, 2015-2019; WMR, 2020.
# Author: Iago Mosqueira (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# buildFLSss330 - FLStock {{{

buildFLSss330 <- function(out, morphs=out$morph_indexing$Index, name=out$Control_File,
  desc=paste(out$inputs$repfile, out$SS_versionshort, sep=" - "),
  fleets=setNames(nm=out$fleet_ID[out$IsFishFleet]), range="missing") {

  # DIMENSIONS
  dims <- dimss3(out)
  
  # SUBSET out
  out <- out[c("catage", "natage", "ageselex", "endgrowth", "Control_File",
    "catch_units", "nsexes", "nseasons", "nareas", "IsFishFleet", "fleet_ID",
    "FleetNames", "birthseas", "spawnseas", "inputs", "SS_versionshort",
    "discard", "discard_at_age", "catch", "NatMort_option", 
    "GrowthModel_option",
    "Maturity_option", "Fecundity_option", "Z_at_age", "M_at_age",
    "mean_body_wt", "Spawn_seas", "Spawn_timing_in_season", "morph_indexing")]

  # GET ages from catage
  ages <- getRange(out$catage)
  ages <- ac(seq(ages['min'], ages['max']))
  dmns <- getDimnames(out)
  dim <- unlist(lapply(dmns, length))

  # ENDGROWTH
  if(out$nsexes == 1) {
    endgrowth <- data.table(out$endgrowth,
      key=c("Seas", "Morph", "int_Age"))
  } else {
    endgrowth <- data.table(out$endgrowth,
      key=c("Seas", "Sex", "Morph", "int_Age"))
  }

  # SET Age and unit
  endgrowth[, Age:=int_Age]
  endgrowth[, unit:=dmns$unit[Morph]]

  # NATAGE
  natage <- data.table(out$natage)
  natage[, unit:=dmns$unit[Morph]]
  
  # CATCH.N
  catage <- data.table(out$catage)
  catage[, unit:=dmns$unit[Morph]]
  # NOTE catage$0 comes out as integer
  catage[, `0` := as.double(`0`)]
  setkey(catage, "Area", "Fleet", "unit", "Yr", "Seas", "Era")

  # WT
  wtatage <- endgrowth[, c("Seas", "unit", "Age", paste0("RetWt:_", fleets)),
    with=FALSE]

  # STOCK.WT
  wt <- ss3wt30(endgrowth, dmns, birthseas=1)

  # MAT
  # NOTE birthseas from morph_indexing
  mat <- ss3mat30(endgrowth, dmns, spawnseas=out$spawnseas,
    option=out$Maturity_option)

  # CORRECT Mat*Fecund to by unit body weight
  if(out$Maturity_option == 6)
    mat <- mat / wt

  # M
  m <- ss3m30(endgrowth, dmns, morph)
  
  # STOCK.N
  n <- ss3n30(natage, dmns)

  # CATCH 
  catches <- ss3catch30(catage, wtatage, dmns, morphs, fleets)
  
  # TABLE of areas and fleets
  map <- unique(catage[Fleet %in% fleets, .(Area, Fleet)])
  
  # CALCULATE total catch.n, add fleets by area
  catch.n <- abind(lapply(unique(map$Area), function(x)
    Reduce("+", lapply(catches[as.character(map[Area == x, Fleet])],
      function(y) y$catch.n))
    ))

  # Arithmetic MEAN wt
  mcatch.wt <- abind(lapply(unique(map$Area), function(x) {
    Reduce("+", lapply(catches[as.character(map[Area == x, Fleet])],
      function(y) y$catch.wt)) / length(map[Area == x, Fleet])}))
  
  # Weighted MEAN wt
  catch.wt <- abind(lapply(unique(map$Area), function(x) {
    Reduce("+", lapply(catches[as.character(map[Area == x, Fleet])],
    function(y) y$catch.wt * y$catch.n))})) / catch.n

  # SUBSTITUTE 0s or NAs with arithmetic mean
  idx <- is.na(catch.wt) | catch.wt == 0
  if(any(idx))
    catch.wt[idx] <- c(mcatch.wt)[c(idx)]
  
  # DISCARDS
  discards.n <- catch.n * 0
  discards.wt <- catch.wt

  if(!is.na(out["discard"])) {

    # EXTRACT datage
    datage <- data.table(out$discard_at_age)
    setkey(datage, "Area", "Fleet", "Yr", "Seas", "Era", "Type")

    # CHECK for type 4 (predator fleets)
    if(any(unique(datage$Fleet) %in% fleets)) {
    
      # SET unit
      datage[, unit:=dmns$unit[Morph]]

      # FLEETs w/discards
      idx <- setNames(nm=unique(datage$Fleet))
   
      discards <- ss3catch30(datage[Type == "disc",], wtatage, dmns, morphs,
        idx=idx)

      # TABLE of areas and fleets for discards
      map <- unique(datage[Fleet %in% fleets, .(Area, Fleet)])
      map[, Fleet:=as.character(Fleet)]
  
      # CALCULATE total catch.n, add fleets by area
      discards.n <- abind(lapply(unique(map$Area), function(x)
        Reduce("+", lapply(discards[map[Area == x, Fleet]],
          function(y) y$catch.n))
      ))

      # Arithmetic MEAN wt
      mdiscards.wt <- abind(lapply(unique(map$Area), function(x) {
        Reduce("+", lapply(discards[map[Area == x, Fleet]],
          function(y) y$catch.wt)) / length(map[Area == x, Fleet])}))
  
      # Weighted MEAN wt
      discards.wt <- abind(lapply(unique(map$Area), function(x) {
        Reduce("+", lapply(discards[map[Area == x, Fleet]],
        function(y) y$catch.wt * y$catch.n))})) / discards.n

      # SUBSTITUTE 0s or NAs with arithmetic mean
      idx <- is.na(discards.wt) | discards.wt == 0
      if(any(idx))
        discards.wt[idx] <- c(mdiscards.wt)[c(idx)]
    }
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
  catch(stock) <- computeCatch(stock)
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
  
  # --- catch.n TODO
  #catch <- ss3catch30(catage, wtatage, dmns=getDimnames(out),
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

# buildFLIss330 - FLIndices(FLIndex) {{{
buildFLIss330 <- function(out, fleets, birthseas=out$birthseas, ...) {
  
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
  #catch <- ss3catch30(catage, wtatage, dmns=getDimnames(out),
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

    # SSB_Unfished
    `SSB_unfished`=out$derived_quants["SSB_unfished", "Value"],

    # SSB_Virgin
    `SSB_Virgin`=out$derived_quants["SSB_Virgin", "Value"],

    # SSB_Initial
    `SSB_Initial`=out$derived_quants["SSB_Initial", "Value"],

    # SSB_first
    `SSB_first`=out$derived_quants[paste0("SSB_", out$startyr), "Value"],

    # Recr_Virgin
    `Recr_Virgin`=out$derived_quants["Recr_Virgin", "Value"],

    # SSB_MSY
    `SSB_MSY`=out$derived_quants["SSB_MSY", "Value"],
    
    # Fstd_MSY
    `Fstd_MSY`=out$derived_quants["annF_MSY", "Value"],
    
    # Dead_Catch_MSY
    `Dead_Catch_MSY`=out$derived_quants["Dead_Catch_MSY", "Value"],
    
    # RetYield_MSY
    # `RetYield_MSY`=out$derived_quants["RetYield_MSY", "Value"],

    # LIKELIHOOD
    data.frame(setNames(as.list(out$likelihoods_used[lkels, "values"]), lknms)))

  res <- data.table(res)

  # RETURN F_endyr as actual F
  res[, F_status := F_endyr]
  res[, F_endyr:=F_endyr * Fstd_MSY]

  # COMPUTE stock status
  res[, SSB_status := SSB_endyr / SSB_MSY]
  res[, SSB_depletion := SSB_endyr / SSB_Virgin]

  # COMPUTE production function parameters
  res[, K := SSB_unfished]
  res[, shape := SSB_MSY / SSB_unfished]

  foo <- function(shape, Dead_Catch_MSY, SSB_MSY){
    optimise(function(x, y) (y-(1 / (1 + x)) ^ (1 / x)) ^ 2,
      c(-0.9999,  10), y=shape)$minimum
  }

  res[, p:= unlist(lapply(seq(dim(res)[1]), function(x)
    do.call(foo, as.list(res[x, .(shape, Dead_Catch_MSY, SSB_MSY)]))))]

  res[, r := (1 + p) * (Dead_Catch_MSY / SSB_MSY)]

  return(res)
} # }}}

# buildFLBss330 - FLBiol {{{

buildFLBss330 <- function(out, morphs=out$morph_indexing$Index, name=out$Control_File,
  desc=paste(out$inputs$repfile, out$SS_versionshort, sep=" - ")) {

  # BUILD stk and srr
  stk <- buildFLSss330(out, morphs=morphs, name=name, desc=desc)
  srr <- buildFLSRss3(out)

  # COERCE to FLBiol
  bio <- as(stk, "FLBiol")

  # ADD rec
  rec(bio) <- as(srr, "predictModel")

  return(bio)
} # }}}

# buildKobess330 - data.frame {{{
buildKobess330 <- function(out, ...) {

  yrs <- out$Kobe[,'Yr']
  res <- FLQuants(
    B.BMSY=FLQuant(out$Kobe[,'B.Bmsy'], dimnames=list(year=yrs), units=""),
    F.FMSY=FLQuant(out$Kobe[,'F.Fmsy'], dimnames=list(year=yrs), units=""))

  return(res)

} # }}}

# buildFLBFss330 - FLBiol + FLFisheries {{{

buildFLBFss330 <- function(out, morphs=out$morph_indexing$Index, name=out$Control_File,
  desc=paste(out$inputs$repfile, out$SS_versionshort, sep=" - "),
  fleets=setNames(nm=out$fleet_ID[out$IsFishFleet]), range="missing") {

  # DIMENSIONS
  dims <- dimss3(out)
  
  # SUBSET out
  out <- out[c("catage", "natage", "ageselex", "endgrowth", "Control_File",
    "catch_units", "nsexes", "nseasons", "nareas", "IsFishFleet", "fleet_ID",
    "FleetNames", "fleet_type", "birthseas", "spawnseas", "inputs",
    "SS_versionshort", "parameters", "discard", "discard_at_age", "catch",
    "NatMort_option", "GrowthModel_option", "Maturity_option",
    "Fecundity_option", "Z_at_age", "M_at_age", "derived_quants",
    "mean_body_wt", "Spawn_seas", "Spawn_timing_in_season", "morph_indexing",
    "exploitation", "recruitment_dist")]

  # GET ages from catage
  ages <- getRange(out$catage)
  ages <- ac(seq(ages['min'], ages['max']))
  dmns <- getDimnames(out)
  dim <- unlist(lapply(dmns, length))

  # ENDGROWTH
  if(out$nsexes == 1) {
    endgrowth <- data.table(out$endgrowth,
      key=c("Seas", "Morph", "int_Age"))
  } else {
    endgrowth <- data.table(out$endgrowth,
      key=c("Seas", "Sex", "Morph", "int_Age"))
  }

  # SET Age and unit
  endgrowth[, Age:=int_Age]
  endgrowth[, unit:=dmns$unit[Morph]]

  # NATAGE
  natage <- data.table(out$natage)
  natage[, unit:=dmns$unit[Morph]]
  
  # CATCH.N
  catage <- data.table(out$catage)
  catage[, unit:=dmns$unit[Morph]]
  # NOTE catage$0 comes out as integer
  catage[, `0` := as.double(`0`)]
  setkey(catage, "Area", "Fleet", "unit", "Yr", "Seas", "Era")

  # WT
  wtatage <- endgrowth[, c("Seas", "unit", "Age", paste0("RetWt:_", fleets)),
    with=FALSE]

  # STOCK.WT
  wt <- ss3wt30(endgrowth, dmns, birthseas=1)

  # M
  m <- ss3m30(endgrowth, dmns, morph)
  
  # STOCK.N
  n <- ss3n30(natage, dmns)

  # SRR
  recdist <- out$recruitment_dist$recruit_dist

  spawnseas <- recdist[, "Settle#"]
  nspsea <- length(spawnseas)

  if(nspsea == 1) {

    pars <- FLPar(s=out$parameters["SR_BH_steep", "Value"],
      R0=out$derived_quants["Recr_Virgin", "Value"],
      v=out$derived_quants["SSB_Virgin", "Value"])

  } else {

    pars <- FLPar(NA, dimnames=list(params=c("s", "R0", "v", "seasp"),
      unit=spawnseas, season=recdist[, "Seas"], iter=1))

    for(i in spawnseas) {
      pars[, i, i] <- c(out$parameters["SR_BH_steep", "Value"],
        out$derived_quants["Recr_Virgin", "Value"],
        out$derived_quants["SSB_Virgin", "Value"],
        recdist[i, "Frac/sex"])
    }
  }

  # MAT
  mat <- ss3mat30(endgrowth, dmns, spawnseas=spawnseas,
    option=out$Maturity_option)

  # CORRECT Mat*Fecund to by unit body weight
  if(out$Maturity_option == 6)
    mat <- mat / wt
    
  # FLBiol
  biol <- FLBiol(
    name=name, desc=desc,
    n=n, wt=wt,
    m=m, mat=predictModel(FLQuants(mat=mat), model=~mat),
    rec=predictModel(model=bevholtss3()$model, params=pars))
  
  spwn(biol) <- out$Spawn_timing_in_season

  # CATCH 
  
  catches <- ss3catch30(catage, wtatage, dmns, morphs, fleets)

  # ageselex
  ageselex <- data.table(out$ageselex,
    key=c("Factor", "Fleet", "Yr", "Seas", "Sex", "Morph"))[Factor == "Asel2",]
  ageselex[, unit:=codeUnit(Sex, Morph)]
  
  ageselex <- data.table::melt(ageselex, id.vars=c("Fleet", "Yr", "Seas", "unit"),
    measure.vars=ages, variable.name="age")
  names(ageselex) <- c("fleet", "year", "season", "unit", "age", "data")

  selex <- lapply(lapply(fleets, function(x)
    as.FLQuant(ageselex[fleet %in% x,][, fleet:=NULL], units="NA")),
    window, start=dmns$year[1])

  # effort
  expl <- data.table(out$exploitation)

  # DEBUG effort by season
  effs <- expl[Yr %in% dmns$year, c("Yr", "Seas",
    out$FleetNames[out$fleet_type == 1]), with=FALSE]
  if(length(unique(effs$Seas)) == 1)
    effs[, Seas:="all"]

  effqs <- FLQuants(lapply(colnames(effs)[-c(1, 2)], function(x) {
    y <- effs[, c("Yr", "Seas", x), with=FALSE]
    setnames(y, c("year", "season", "data"))
    y[, effort:="all"]
    as.FLQuant(y)
  }))
  
  flfs <- Map(function(c, s, ef) {
    ca <- FLCatch(landings.n=c$catch.n, landings.wt=c$catch.wt, catch.sel=s)
    discards.n(ca)[] <- 0
    discards.wt(ca) <- landings.wt(ca)
    return(FLFishery(effort=ef, A=ca))
    }, c=catches, s=selex, ef=effqs)


  # fishery names
  names(flfs) <- out$FleetNames[out$fleet_type == 1]

  # catch names
  if(!missing(name)) {
    flfs <- lapply(flfs, function(x) {
      names(x) <- name
      return(x)
    })
  }
 
  # TABLE of areas and fleets
  map <- unique(catage[, .(Area, Fleet)])
  
  # DISCARDS
  if(!is.na(out["discard"])) {

    # EXTRACT datage
    datage <- data.table(out$discard_at_age)
    setkey(datage, "Area", "Fleet", "Yr", "Seas", "Era", "Type")
    
    # SET unit
    datage[, unit:=dmns$unit[Morph]]

    # FLEETs w/discards
    idx <- setNames(nm=unique(datage$Fleet))
   
    discards <- ss3catch30(datage[Type == "disc",], wtatage, dmns, morphs,
      idx=idx)

    # TABLE of areas and fleets for discards
    map <- unique(datage[, .(Area, Fleet)])
    map[, Fleet:=as.character(Fleet)]
  
    # CALCULATE total catch.n, add fleets by area
    discards.n <- abind(lapply(unique(map$Area), function(x)
      Reduce("+", lapply(discards[map[Area == x, Fleet]],
        function(y) y$catch.n))
      ))

    # Arithmetic MEAN wt
    mdiscards.wt <- abind(lapply(unique(map$Area), function(x) {
      Reduce("+", lapply(discards[map[Area == x, Fleet]],
        function(y) y$catch.wt)) / length(map[Area == x, Fleet])}))
  
    # Weighted MEAN wt
    discards.wt <- abind(lapply(unique(map$Area), function(x) {
      Reduce("+", lapply(discards[map[Area == x, Fleet]],
      function(y) y$catch.wt * y$catch.n))})) / discards.n

    # SUBSTITUTE 0s or NAs with arithmetic mean
    idx <- is.na(discards.wt) | discards.wt == 0
    if(any(idx))
      discards.wt[idx] <- c(mdiscards.wt)[c(idx)]
  }

  return(list(biol=biol, fisheries=FLFisheries(flfs)))

} # }}}
