# build.R - Function to build FLR objects from the list returned by SS_output
# ioalbmse/R/build.R

# Copyright European Union, 2015-2017
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# buildFLBFss3 {{{

buildFLBFss3 <- function(out, birthseas=unique(out$natage$BirthSeas)) {
  
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

# buildFLSss3 {{{

buildFLSss3 <- function(out, birthseas=out$birthseas, name="ss3",
  desc=paste(out$inputs$repfile, out$SS_version, sep=" - "), ...) {

  # SUBSET out
  out <- out[c("catage", "natage", "ageselex", "endgrowth",
    "catch_units", "nsexes", "nseasons", "nareas", "IsFishFleet", "fleet_ID",
    "FleetNames", "birthseas", "spawnseas", "inputs", "SS_version")]

  # GET range from catage
  range <- getRange(out$catage)
  ages <- ac(seq(range['min'], range['max']))
  idx <- out$fleet_ID[out$IsFishFleet]

  dmns <- getDimnames(out, birthseas=birthseas)
  dim <- unlist(lapply(dmns, length))

  # EXTRACT from out
  if(out$nsexes == 1) {
    endgrowth <- data.table(out$endgrowth, key=c("Seas", "BirthSeas", "Age"))
  } else {
    endgrowth <- data.table(out$endgrowth, key=c("Seas", "Sex", "BirthSeas", "Age"))
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
    c("Seas", "Sex", "BirthSeas", "Age", paste0("RetWt:_", idx)), with=FALSE]

  landings <- ss3catch(catage, wtatage, dmns, birthseas, idx)
  
  # CALCULATE total landings.n
  landings.n <- FLQuant(0, dimnames=dmns, units="1000")
  for (i in seq(length(idx)))
    landings.n <- landings.n %++% landings[[i]]$landings.n
  
  # AVERAGE landings.wt weighted by landings.n
  landings.wt <-  FLCore::expand(Reduce("+", lapply(landings,
    function(x) x$landings.n %*% x$landings.wt)) %/% landings.n,
    year=dmns$year, area=dmns$area)
  
  # EXPAND m and mat by area
  # m <- do.call(FLCore::expand, c(list(x=m), dmns))
  # mat <- do.call(FLCore::expand, c(list(x=mat), dmns))
  
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
  harvest.spwn(stock)[,,,birthseas] <- 0
  m.spwn(stock)[,,,birthseas] <- 0

  # HARVEST
  harvest(stock) <- harvest(stock.n(stock), catch=catch.n(stock), m=m(stock))

  return(stock)

} # }}}

# buildFLIBss3 {{{

buildFLIBss3 <- function(out, fleets=missing, birthseas=out$birthseas, ...) {

  # SUBSET from out
  out <- out[c("cpue", "ageselex", "endgrowth", "catage",
    "nsexes", "nseasons", "nareas", "birthseas")]

  cpue <- data.table(out[["cpue"]])
  
  allfleets <- setNames(seq(length(unique(cpue$Name))), unique(cpue$Name))
  
  if(missing(fleets))
    fleets <- allfleets
  else if(is.character(fleets))
    fleets <- allfleets[names(allfleets) %in% fleets]
  else if(is.numeric(fleets))
    fleets <- allfleets[fleets]

  selex <- data.table(out[["ageselex"]])
  endgrowth <- data.table(out[["endgrowth"]])
  wtatage <- endgrowth[BirthSeas %in% birthseas,
    c("Seas", "Sex", "BirthSeas", "Age", paste0("RetWt:_", fleets)), with=FALSE]
  catage <- data.table(out[["catage"]])
  setkey(catage, "Area", "Fleet", "Gender", "Morph", "Yr", "Seas", "Era")

  # --- index
  index <- ss3index(cpue, fleets)

  # --- index.q
  index.q <- ss3index.q(cpue, fleets)

  # --- sel.pattern
  sel.pattern <- ss3sel.pattern(selex, unique(cpue$Yr), fleets,
    morphs=unique(selex$Morph))

  # --- index.var (var)
  index.var <- ss3index.var(cpue, fleets)

  # --- catch.n
  catch<- ss3catch(catage, wtatage, dmns=getDimnames(out, birthseas=birthseas),
    birthseas=birthseas, idx=fleets)
  catch.n <- lapply(catch, "[[", "landings.n")
  
  # --- FLIndices
  cpues <- lapply(names(fleets), function(x) {
    dmns <- dimnames(index[[x]])

    FLIndexBiomass(name=x,
      index=index[[x]],
      index.q=index.q[[x]],
      index.var=index.var[[x]],
      # TRIM catch.n to index seasons
      catch.n=unitSums(window(catch.n[[x]], start=dims(index[[x]])$minyear,
        end=dims(index[[x]])$maxyear))[,,,dmns$season],
      sel.pattern=window(sel.pattern[[x]], start=dims(index[[x]])$minyear,
        end=dims(index[[x]])$maxyear))[,,,dmns$season]
    })

  names(cpues) <- names(fleets)
  
  if(length(fleets) > 1)
    return(FLIndices(cpues))
  else
    return(cpues[[1]])

} # }}}

# buildFLSRss3 {{{
buildFLSRss3 <- function(out, ...) {
  
  # SUBSET out
  out <- out[c("parameters", "recruit", "derived_quants", "likelihoods_used")]

  recruit <- data.table(out$recruit)
  parameters <- data.table(out$parameters)
  dquants <- data.table(out$derived_quants)
  lkhds <- out$likelihoods_used

  yrs <- recruit$Yr

  # params & model
  rawp <- parameters[grepl("SR_", Label), .(Label, Value)]

  # BH
  if("SR_BH_steep" %in% rawp$Label) {
    params <- FLPar(
      s=rawp[Label == "SR_BH_steep", Value],
      R0=exp(rawp[Label == "SR_LN(R0)", Value]),
      v=dquants[Label == "SSB_Virgin", Value],
      units=c("", "1000", "t"))
    model <- bevholtss3()$model
  # survSRR
  } else if("SR_surv_Sfrac" %in% rawp$Label) {
    params <- FLPar(
      R0=exp(rawp[Label == "SR_LN(R0)", Value]),
      Sfrac=exp(rawp[Label == "SR_surv_Sfrac", Value]),
      beta=exp(rawp[Label == "SR_surv_Beta", Value]),
      SF0=dquants[Label == "SSB_Virgin", Value],
      units=c("1", "", "", "pups"))
    model <- survSRR()$model
  }

  # rec
  rec <- FLQuant(recruit$exp_recr, dimnames=list(year=yrs), units="1000")
  # ssb
  ssb <- FLQuant(recruit$SpawnBio, dimnames=list(year=yrs), units="t")
  # fitted
  fitted <- FLQuant(recruit$pred_recr, dimnames=list(year=yrs), units="1000")
  # residuals
  residuals <- FLQuant(recruit$dev, dimnames=list(year=yrs), units="")

  # logLik
  logLik <- lkhds[rownames(lkhds) == "Recruitment", "values"]
  class(logLik) <- "logLik"
  attr(logLik, "df") <- NA

  # vcov

  return(FLSR(model=model, params=params, rec=rec, ssb=ssb, fitted=fitted,
    residuals=residuals, logLik=logLik))
}
# }}}

# buildFLQsss3 {{{
buildFLQsss3 <- function(out, ...) {

  # SUBSET out
  out <- out[c("derived_quants", "recruit", "startyr", "endyr", "Kobe")]

  yrs <- ac(seq(out$startyr, out$endyr))

  # REC
  recruit <- data.table(out$recruit)
  rec <- FLQuant(recruit[, pred_recr], dimnames=list(age='0', year=recruit[, Yr]),
    units="1000")[, yrs]

  # SPB
  ssb <- FLQuant(recruit[, SpawnBio], dimnames=list(age='all', year=recruit[, Yr]),
    units="t")[, yrs]

  # RESID
  resid <- FLQuant(recruit[, dev], dimnames=list(age='all', year=recruit[, Yr]),
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
