# test-FLBFs.R - DESC
# /test-FLBFs.R

# Copyright Iago MOSQUEIRA (WMR), 2021
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2


# --- albio {{{

path <- file.path("3.30", "albio")

om <- readFLomss3(path)
oms <- readOMSss3(path)



stock(om) <- simplify(stock(om))

om <- FLom(stock=simplify(oms$stock), refpts=oms$refpts)



flb <- buildFLBss330(alb, birthseas=4)




alb <- readOutputss3(path)
albs <- readFLSss3(path, range = c(minfbar=1, maxfbar=12))

# CHECK SSB matches

test_that("Calculated albio SSB matches that in Report.sso", {
  expect_comparable(
    unitSums(ssb(albs)[,,,1]),
    extractSSB(alb))
  }
)

# CHECK annual F matches

test_that("Calculated albio annual F matches that in Report.sso", {
  expect_comparable(
    fbar(simplify(albs)[, -1]),
    extractFbar(alb))
  }
)

# CHECK harvest

test_that("Calculated albio annual Z at age matches that in Report.sso", {
  expect_comparable(
    # LAST age not returned in Report.sso$Z_at_age
    seasonSums(z(albs)[dimnames(albs)$age[-dims(albs)$age],]),
    extractZatage(alb))
  }
)
# }}}
