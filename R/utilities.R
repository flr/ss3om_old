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

# deSS3 {{{
deSS3 <- function(object, spwnSeason=4, stockSeason=1) {

	# ADD catch/landings/discards.n across seasons
	catch.n <- unitSums(seasonSums(catch.n(object)))
	landings.n <- unitSums(seasonSums(landings.n(object)))
	discards.n <- unitSums(seasonSums(discards.n(object)))

  # CALCULATE stock.n and harvest
  survivors <- unitSums(stock.n(object)[,,,4] *
    exp(- harvest(object)[,,,4] - m(object)[,,,4]))
	stock.n <- unitSums(stock.n(object)[,,,stockSeason])
	dimnames(stock.n) <- list(season="all", unit="unique")
  harvest <- (catch.n * log(survivors / stock.n)) / (survivors - stock.n)
  units(harvest) <- "f"

	# AVERAGE catch/landings/discards.wt across seasons weighted by *.n
	catch.wt <- seasonSums(catch.wt(object) * catch.n(object)) / seasonSums(catch.n(object))
  catch.wt <- unitSums(catch.wt * seasonSums(catch.n(object))) / catch.n

	landings.wt <- seasonSums(landings.wt(object) * landings.n(object)) / seasonSums(landings.n(object))
  landings.wt <- unitSums(landings.wt * seasonSums(landings.n(object))) / landings.n

	discards.wt <- seasonSums(discards.wt(object) * discards.n(object)) / seasonSums(discards.n(object))
  discards.wt <- unitSums(discards.wt * seasonSums(discards.n(object))) / discards.n
  # DEBUG
  discards.wt <- landings.wt

  stock.wt <- unitSums(stock.wt(object)[,,,stockSeason] * stock.n(object)[,,,stockSeason]) / stock.n
	dimnames(stock.wt) <- list(season="all", unit="unique")

	# EXTRACT mat from spwnSeason
	mat <- mat(object)[,,1,spwnSeason]
	dimnames(mat) <- list(season="all", unit="unique")

  # m
  m <- seasonSums(m(object)[,,1])
	dimnames(m) <- list(season="all", unit="unique")

	# harvest.spwn & m.spwn
  harvest.spwn <- m.spwn <- m
  harvest.spwn[] <- 0.75
  m.spwn[] <- 0.75

	# CREATE FLStock
	res <- FLStock(name=name(object), desc=desc(object), range=range(object),
    catch.n=catch.n, landings.n=landings.n, discards.n=discards.n,
		catch.wt=catch.wt, landings.wt=landings.wt, discards.wt=discards.wt,
		stock.n=stock.n, stock.wt=stock.wt, harvest=harvest,
		m=m, m.spwn=m.spwn, harvest.spwn=harvest.spwn, mat=mat)

	landings(res) <- computeLandings(res)
	discards(res) <- computeDiscards(res)
	catch(res) <-  computeCatch(res)
	stock(res) <- computeStock(res)

  # recage
  res <- res[-1,]

	return(res)

} # }}}

