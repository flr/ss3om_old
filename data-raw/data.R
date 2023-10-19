# data.R - DESC
# /home/mosqu003/FLR/pkgs/mine/ss3om/data-raw/data.R

# Copyright (c) WUR, 2023.
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2

# XX {{{
# }}}

library(ss3om)

sma <- readOutputss3('sma')

save(sma, file='../data/sma.rda', compress='xz')
