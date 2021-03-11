# yft.R - DESC
# /yft.R

# Copyright Iago MOSQUEIRA (WMR), 2021
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2

# XX {{{
# }}}

path <- file.path("3.30", "yftio")

yft <- readOutputss3(path)
yftom <- readFLomss3(path)


# REC

# fraction per season

yft$recruitment_dist$recruit_dist$`Frac/sex`

# 2015 recruitment

data.table(yft$recruit)[Yr == 2015,]

# SSB 2015 S01

c(unitSums(ssb(yfts)[,'2015']))

eval(bevholtss3()$model[[3]], list(ssb=c(unitSums(ssb(yfts)[,'2015']))[1],
  R0=exp(11.3302), s=0.8, v=1.43386e+06))
eval(bevholtss3()$model[[3]], list(ssb=639491, R0=exp(11.3302), s=0.8,
  v=1.43386e+06))

# 2015 recruitment per season (unit 1)

data.table(yft$recruit)[Yr == 2015, pred_recr] *
  yft$recruitment_dist$recruit_dist$`Frac/sex`

# SS recruitment 2015

c(stock.n(yfts)[1, '2015'])

# S01                S02                  S03                    S04
# U01   U02 U03 U04  U01   U02   U03 U04  U01   U02   U03   U04  U01  U02   U03   U04
# 25115 0   0   0    18155 23643 0   0    13086 17140 16656 0    8957 12386 12116 4117


