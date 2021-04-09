# review.R - DESC
# /review.R

# Copyright Iago MOSQUEIRA (WMR), 2021
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2


library(ss3om)
library(ggplotFL)


#' # YFT

path <- file.path("3.30", "yftio_report")
path <- file.path("3.30", "yftio")

# SS_output
yft <- readOutputss3(path)

# FLStock
yfts <- readFLSss3(path, range=c(minfbar=1, maxfbar=9))

uyfts <- simplify(yfts, "unit")
syfts <- simplify(yfts, "season")
usyfts <- simplify(yfts, c("unit", "season"))

# SSB

# season 1, unitSums
range(
  unitSums(ssb(yfts)[,,,1]) / extractSSB(yft)
)

#' ## COMPARE SSB (2017): SS ~ FLR

unitSums(ssb(yfts)[,'2017',,1])

extractSSB(yft)[, '2017']

#' ### CHECK N

naa <- data.table(yft$natage)

naa <- naa[Morph == 1 & Seas == 1 & Yr == 2017 & `Beg/Mid` == "B", 13:23]
c(stock.n(yfts)[, '2017', 1, 1])

stock.n(yfts)[, '2017', 1, 1]

#' ### CHECK mat

mat <- data.table(yft$endgrowth)[Seas == 1 & Morph == 1, `Mat*Fecund` / Wt_Beg]

mat(yfts)[, '2017', 1, 1]

#' ### CHECK stock.wt

wt <- data.table(yft$endgrowth)[Seas == 1 & Morph == 1, Wt_Beg]

stock.wt(yfts)[, '2017', 1, 1]

#' ### COMPARE ssb

sum(wt * mat * naa)

ssb(yfts)[, '2017', 1, 1]


#' ### COMPARE Z

unitMeans(seasonSums(z(yfts)[-10, '2017']))
extractZatage(yft)[, '2017']

#' ### CHECK simplify

# season 1, simplify units
range(
  ssb(uyfts)[,,,1] / extractSSB(yft)
)

# simplify season,  unitSums
range(
  unitSums(ssb(syfts)) / extractSSB(yft)
)

# simplify
range(
  ssb(usyfts) / extractSSB(yft)
)

# F

# seasonsSuns, unitMeans
range(
  unitMeans(seasonSums(fbar(yfts)))[, -1] / extractFbar(yft)
)

# simplify units, seasonSums
range(
  seasonSums(fbar(uyfts))[, -1] / extractFbar(yft)
)

# simplify seasons, unitMeans
range(
  unitMeans(fbar(syfts))[, -1] / extractFbar(yft)
)

# simplify
range(
  fbar(usyfts)[, -1] / extractFbar(yft)
)
