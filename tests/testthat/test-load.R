# test-load.R - DESC
# /test-load.R

# Copyright European Union, 2019
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

library(doParallel)
registerDoParallel(3)

# FLStock

fls <- loadFLS(dir="3.24/swo",
  repfile="Report.sso.gz", compfile = "CompReport.sso.gz")

# FLStocks

flss <- loadFLS(dir="3.24/swo", combine=FALSE,
  repfile="Report.sso.gz", compfile = "CompReport.sso.gz")

# data.table

dt <- loadFLS(dir="3.24/swo", combine=TRUE, convert=FALSE,
  repfile="Report.sso.gz", compfile = "CompReport.sso.gz")

# data.table

dts <- loadFLS(dir="3.24/swo", combine=FALSE, convert=FALSE,
  repfile="Report.sso.gz", compfile = "CompReport.sso.gz")

