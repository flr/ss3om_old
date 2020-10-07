# test-ss330.R - TEST for load, build and read SS 3.30 models
# ss3om/tests/testthat/test-ss330.R

# Copyright Iago MOSQUEIRA (WMR), 2020
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2


# --- simple {{{

path <- file.path("3.30", "simple")

sim <- readOutputss3(path)
sims <- readFLSss3(path, range = c(minfbar=10, maxfbar=15))

# CHECK SS_output & FLStock load

test_that("SS_output and FLStock load", {

  expect_true(validObject(sims))

  }
)

# CHECK SSB matches

test_that("Calculated SSB matches that in Report.sso", {
  expect_comparable(
    unitSums(ssb(sims)),
    extractSSB(sim))
  }
)

# CHECK Fbar matches

test_that("Calculated annual Fbar matches that in Report.sso", {
  expect_comparable(
    unitMeans(fbar(sims))[, -1],
    extractFbar(sim))
  }
)

# CHECK harvest

test_that("Calculated annual Z at age matches that in Report.sso", {
  expect_comparable(
    # LAST age not returned in Report.sso$Z_at_age
    z(sims)[dimnames(sims)$age[-dims(sims)$age],],
    extractZatage(sim))
  }
)
# }}}

# --- simple_with_discard {{{

path <- file.path("3.30", "simple_with_discard")

sid <- readOutputss3(path)
sids <- readFLSss3(path, range = c(minfbar=10, maxfbar=15))

# CHECK SS_output & FLStock load

test_that("SS_output and FLStock load", {

  expect_true(validObject(sims))

  }
)

# CHECK SSB matches

test_that("Calculated SSB matches that in Report.sso", {
  expect_comparable(
    unitSums(ssb(sims)),
    extractSSB(sim))
  }
)

# CHECK Fbar matches

test_that("Calculated annual Fbar matches that in Report.sso", {
  expect_comparable(
    unitMeans(fbar(sims))[, -1],
    extractFbar(sim))
  }
)

# CHECK harvest

test_that("Calculated annual Z at age matches that in Report.sso", {
  expect_comparable(
    # LAST age not returned in Report.sso$Z_at_age
    z(sims)[dimnames(sims)$age[-dims(sims)$age],],
    extractZatage(sim))
  }
)
# }}}

# --- albio {{{

path <- file.path("3.30", "albio")

alb <- readOutputss3(path)
albs <- readFLSss3(path, range = c(minfbar=1, maxfbar=12))

# CHECK SSB matches

test_that("Calculated SSB matches that in Report.sso", {
  expect_comparable(
    unitSums(ssb(albs)[,,,1]),
    extractSSB(alb))
  }
)

# DEBUG CHECK Fbar matches

test_that("Calculated annual Fbar matches that in Report.sso", {
  expect_comparable(
    fbar(simplify(albs)[, -1]),
    extractFbar(alb))
  }
)

# CHECK harvest

test_that("Calculated annual Z at age matches that in Report.sso", {
  expect_comparable(
    # LAST age not returned in Report.sso$Z_at_age
    seasonSums(z(albs)[dimnames(albs)$age[-dims(albs)$age],]),
    extractZatage(alb))
  }
)
# }}}

# --- vendace {{{

path <- file.path("3.30", "vendace")

fev <- readOutputss3(path)
fevs <- readFLSss3(path, range = c(minfbar=1, maxfbar=3))

# CHECK SS_output & FLStock load

test_that("SS_output and FLStock load", {
  expect_true(validObject(fevs))
  }
)

# CHECK SSB matches

test_that("Calculated SSB matches that in Report.sso", {
  expect_comparable(
    unitSums(ssb(fevs)),
    extractSSB(fev))
  }
)
  
# CHECK Fbar matches

test_that("Calculated annual Fbar matches that in Report.sso", {
  expect_comparable(
    unitMeans(fbar(fevs))[, -1],
    extractFbar(fev))
  }
)

# CHECK harvest

test_that("Calculated annual Z at age matches that in Report.sso", {
  expect_comparable(
    # LAST age not returned in Report.sso$Z_at_age
    z(fevs)[ac(0:10),],
    extractZatage(fev)[ac(0:10),])
  }
)
# }}}

# --- herring {{{

path <- file.path("3.30", "herring")

her <- readOutputss3(path)
hers <- readFLSss3(path, range = c(minfbar=3, maxfbar=7))

# CHECK SS_output & FLStock load

test_that("SS_output and FLStock load", {
  expect_true(validObject(hers))
  }
)

# CHECK SSB matches

test_that("Calculated SSB matches that in Report.sso", {
  expect_comparable(
    unitSums(ssb(hers)),
    extractSSB(her))
  }
)
  
# CHECK Fbar matches

test_that("Calculated annual Fbar matches that in Report.sso", {
  expect_comparable(
    unitMeans(fbar(hers))[, -1],
    extractFbar(her))
  }
)

# CHECK harvest

test_that("Calculated annual Z at age matches that in Report.sso", {
  expect_comparable(
    # LAST age not returned in Report.sso$Z_at_age
    z(hers)[ac(0:18),],
    extractZatage(her)[ac(0:18),])
  }
)
# }}}
