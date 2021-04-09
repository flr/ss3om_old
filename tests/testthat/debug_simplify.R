# debug_simplify.R - DESC
# /debug_simplify.R

# Copyright Iago MOSQUEIRA (WMR), 2021
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2


path <- file.path("3.30", "albio")

alb <- readOutputss3(path)

albs <- readFLSss3(path, range = c(minfbar=1, maxfbar=12))

# SUM of male and female SSB in 1st season

unitSums(ssb(albs)[,,,1])

# SS3 output

extractSSB(alb)

# SIMPLIFIED stocks

salb <- simplify(albs, "season", spwn.season=1)

unitSums(ssb(salb)) # FAR too low

ualb <- simplify(albs, "unit")

ssb(ualb)[,,,1] # TOO high

ialb <- simplify(albs)

ssb(ialb)

# CHECK ssb()

stock.n(albs)[,'1950',,1] * stock.wt(albs)[,'1950',,1] * mat(albs)[,'1950',,1]

quantSums(stock.n(albs)[,'1950',,1] * stock.wt(albs)[,'1950',,1] * mat(albs)[,'1950',,1])

# CHECK n

stock.n(albs)[,'1950',,1]

stock.n(salb)[,'1950']

stock.n(ualb)[,'1950',,1]

stock.n(ialb)[,'1950']

unitSums(stock.n(albs)[,'1950',,1]) / unitSums(stock.n(salb)[,'1950'])
unitSums(stock.n(albs)[,'1950',,1]) / stock.n(ualb)[,'1950',,1]
unitSums(stock.n(albs)[,'1950',,1]) / stock.n(ialb)[,'1950']

# CHECK wt

stock.wt(albs)[,'1950',,1]

stock.wt(salb)[,'1950']

stock.wt(ualb)[,'1950',,1]

stock.wt(ialb)[,'1950']

unitMeans(stock.wt(albs)[,'1950',,1]) / unitMeans(stock.wt(salb)[,'1950'])
unitMeans(stock.wt(albs)[,'1950',,1]) / stock.wt(ualb)[,'1950',,1]
unitMeans(stock.wt(albs)[,'1950',,1]) / stock.wt(ialb)[,'1950']

# CHECK mat

mat(albs)[,'1950', 'F', 1]

# DEBUG simplify("season") get mat wrong
mat(salb)[,'1950', 'F']

mat(ualb)[,'1950',,1]

mat(ialb)[,'1950']

# DEBUG simplify("season") get mat wrong
mat(albs)[,'1950','F',1] - mat(salb)[,'1950','F']
mat(albs)[,'1950','F',1] - mat(ualb)[,'1950',,1]
mat(albs)[,'1950','F',1] - mat(ialb)[,'1950']


# CHECK *.spwn

m.spwn(albs)
m.spwn(salb)
m.spwn(ualb)
m.spwn(ialb)


(stock.n(ialb) * stock.wt(ialb) * mat(ialb))[, '1950'] / (stock.n(albs) * stock.wt(albs) * mat(albs))[, '1950','F',1]

(stock.n(ialb) * stock.wt(ialb) * mat(ialb))[, '1950'] / unitSums((stock.n(albs) * stock.wt(albs))[, '1950', ,1])


quantSums((stock.n(albs)[,'1950','F',1] + stock.n(albs)[,'1950','M',1]) *
(stock.wt(albs)[,'1950','F',1] + stock.wt(albs)[,'1950','M',1]) / 2 *
mat(albs)[,'1950','F',1] / 2)

quantSums(stock.n(albs)[,'1950','F',1] * stock.wt(albs)[,'1950','F',1] *
mat(albs)[,'1950','F', 1])

quantSums(stock.n(ialb)[,'1950'] * stock.wt(ialb)[,'1950'] * mat(ialb)[,'1950'] / 2)
