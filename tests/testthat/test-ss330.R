# test-ss330.R - TEST for load, build and read SS 3.30 models
# ss3om/tests/testthat/test-ss330.R

# Copyright WUR, 2020
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2

# --- adrhke {{{

path <- file.path("3.30", "adrhke")

hke <- readOutputss3(path)

hkes <- readFLSss3(path, range = c(minfbar=1, maxfbar=4))
hkeom <- readFLomss3(path, range = c(minfbar=1, maxfbar=4))

# CHECK SS_output & FLStock load

test_that("hake FLStock is valid", {
  expect_true(validObject(hkes))
  }
)

# CHECK SSB matches

test_that("Calculated hake SSB matches that in Report.sso", {
  expect_comparable(
    unitSums(ssb(hkes)),
    extractSSB(hke))
  }
)
  
# CHECK annual F matches

test_that("Calculated hake annual F matches that in Report.sso", {
  expect_comparable(
    unitMeans(fbar(hkes))[, -1],
    extractFbar(hke))
  }
)

# CHECK harvest

test_that("Calculated hake annual Z at age matches that in Report.sso", {
  expect_comparable(
    # LAST age not returned in Report.sso$Z_at_age
    z(hkes)[ac(0:18),],
    extractZatage(hke)[ac(0:18),])
  }
)
# }}}

# --- albio {{{

path <- file.path("3.30", "albio")

alb <- readOutputss3(path)
albs <- readFLSss3(path, range = c(minfbar=1, maxfbar=12))

albd <- SS_readdat(file.path(path, 'abt.dat'))

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

# --- herring {{{

path <- file.path("3.30", "herring")

her <- readOutputss3(path)
hers <- readFLSss3(path, range = c(minfbar=3, maxfbar=7))

# CHECK SS_output & FLStock load

test_that("herring SS_output and FLStock load", {
  expect_true(validObject(hers))
  }
)

# CHECK SSB matches

test_that("Calculated herring SSB matches that in Report.sso", {
  expect_comparable(
    unitSums(ssb(hers)),
    extractSSB(her))
  }
)
  
# CHECK annual F matches

test_that("Calculated herring annual F matches that in Report.sso", {
  expect_comparable(
    unitMeans(fbar(hers))[, -1],
    extractFbar(her))
  }
)

# CHECK harvest

test_that("Calculated herring annual Z at age matches that in Report.sso", {
  expect_comparable(
    # LAST age not returned in Report.sso$Z_at_age
    z(hers)[ac(0:18),],
    extractZatage(her)[ac(0:18),])
  }
)
# }}}

# --- nhke {{{

path <- file.path("3.30", "nhke")

hke <- readOutputss3(path)

hkes <- readFLSss3(path, range = c(minfbar=1, maxfbar=4))
hked <- SS_readdat(file.path(path, 'nhake-wg20.dat'))

# CHECK SS_output & FLStock load

test_that("hake FLStock is valid", {
  expect_true(validObject(hkes))
  }
)

# CHECK SSB matches

test_that("Calculated hake SSB matches that in Report.sso", {
  expect_comparable(
    unitSums(ssb(hkes)),
    extractSSB(hke))
  }
)
  
# CHECK annual F matches

test_that("Calculated hake annual F matches that in Report.sso", {
  expect_comparable(
    unitMeans(fbar(hkes))[, -1],
    extractFbar(hke))
  }
)

# CHECK harvest

test_that("Calculated hake annual Z at age matches that in Report.sso", {
  expect_comparable(
    # LAST age not returned in Report.sso$Z_at_age
    z(hkes)[ac(0:18),],
    extractZatage(hke)[ac(0:18),])
  }
)
# }}}

# --- simple {{{

path <- file.path("3.30", "simple")

sim <- readOutputss3(path)
sims <- readFLSss3(path, range = c(minfbar=10, maxfbar=15))

# CHECK SS_output & FLStock load

test_that("simple SS_output and FLStock load", {

  expect_true(validObject(sims))

  }
)

# CHECK SSB matches

test_that("Calculated simple SSB matches that in Report.sso", {
  expect_comparable(
    unitSums(ssb(sims)),
    extractSSB(sim))
  }
)

# CHECK annual F matches

test_that("Calculated simple annual F matches that in Report.sso", {
  expect_comparable(
    unitMeans(fbar(sims))[, -1],
    extractFbar(sim))
  }
)

# CHECK harvest

test_that("Calculated simple annual Z at age matches that in Report.sso", {
  expect_comparable(
    # LAST age not returned in Report.sso$Z_at_age
    z(sims)[dimnames(sims)$age[-dims(sims)$age],],
    extractZatage(sim))
  }
)
# }}}

# --- skjio {{{

path <- file.path("3.30", "skjio")

skj <- readOutputss3(path)

skjs <- readFLSss3(path)[-1,]

skjd <- SS_readdat(file.path(path, 'data.ss'))

# CHECK SS_output & FLStock load

test_that("skj FLStock is valid", {
  expect_true(validObject(skjs))
  }
)

# CHECK SSB matches

test_that("Calculated skipjack SSB matches that in Report.sso", {
  expect_comparable(
    unitSums(ssb(skjs))[,,,1],
    extractSSB(skj))
  }
)

# DEBUG CHECK annual F matches

 test_that("Calculated skipjack annual F matches that in Report.sso", {
   expect_comparable(
    seasonSums(unitMeans(fbar(skjs)))[, -1],
    extractFbar(skj))
   }
 )

# DEBUG CHECK harvest
 
 test_that("Calculated skipjack annual Z at age matches that in Report.sso", {
   expect_comparable(
     # LAST age not returned in Report.sso$Z_at_age
     z(simplify(skjs)),
     extractZatage(skj))
   }
 )
# }}}

# --- swoiotc {{{

path <- file.path("3.30", "swoiotc")

swo <- readOutputss3(path)

swos <- readFLSss3(path)
swoom <- readFLomss3(path)

# CHECK SS_output & FLStock load

test_that("swo FLStock is valid", {
  expect_true(validObject(swos))
  }
)

# CHECK SSB matches

test_that("Calculated swordfish SSB matches that in Report.sso", {
  expect_comparable(
    areaSums(unitSums(ssb(swos))),
    extractSSB(swo))
  }
)
  
# CHECK annual F matches

 test_that("Calculated swordfish annual F matches that in Report.sso", {
   expect_comparable(
     areaMeans(unitMeans(fbar(swos)))[, -1],
     extractFbar(swo))
   }
 )
 
 # CHECK harvest
 
 test_that("Calculated swordfish annual Z at age matches that in Report.sso", {
   expect_comparable(
     # LAST age not returned in Report.sso$Z_at_age
     areaMeans(z(swos))[ac(0:29),],
     extractZatage(swo)[ac(0:29),])
   }
 )
#  }}}

# --- vendace {{{

path <- file.path("3.30", "vendace")

fev <- readOutputss3(path)
fevs <- readFLSss3(path, range = c(minfbar=1, maxfbar=3))

# CHECK SS_output & FLStock load

test_that("vendance SS_output and FLStock load", {
  expect_true(validObject(fevs))
  }
)

# DEBUG CHECK SSB matches

test_that("Calculated vendance SSB matches that in Report.sso", {
  expect_comparable(
    unitSums(ssb(fevs)),
    extractSSB(fev))
  }
)

# CHECK annual F matches

test_that("Calculated vendance annual F matches that in Report.sso", {
  expect_comparable(
    unitMeans(fbar(fevs))[, -1],
    extractFbar(fev))
  }
)

# CHECK harvest

test_that("Calculated vendance annual Z at age matches that in Report.sso", {
  expect_comparable(
    # LAST age not returned in Report.sso$Z_at_age
    z(fevs)[ac(0:10), ],
    extractZatage(fev)[ac(0:10), ])
  }
)
# }}}

# --- yftio {{{

path <- file.path("3.30", "yftio")

yft <- readOutputss3(path)

yfts <- readFLSss3(path)
yftom <- readFLomss3(path)

# CHECK SS_output & FLStock load

test_that("yft FLStock is valid", {
  expect_true(validObject(yfts))
  }
)

# CHECK SSB matches

test_that("Calculated yellowfin SSB matches that in Report.sso", {
  expect_comparable(
    areaSums(unitSums(ssb(yfts)))[,,,1],
    extractSSB(yft))
  }
)

# DEBUG CHECK annual F matches

 test_that("Calculated yellowfin annual F matches that in Report.sso", {
   expect_comparable(
    seasonSums(unitMeans(fbar(yfts)))[, -1],
    extractFbar(yft))
   }
 )

# DEBUG CHECK harvest
 
 test_that("Calculated yellowfin annual Z at age matches that in Report.sso", {
   expect_comparable(
     # LAST age not returned in Report.sso$Z_at_age
     z(simplify(yfts))[ac(0:9),],
#     seasonSums(unitMeans(z(yfts)[ac(0:9),])),
     extractZatage(yft)[ac(0:9),])
   }
 )
# }}}

# -- Annual F option 4

# --- simple_realF {{{

path <- file.path("3.30", "simple_realF")

sir <- readOutputss3(path)
sirs <- readFLSss3(path, range = c(minfbar=10, maxfbar=15))

# CHECK SS_output & FLStock load

test_that("simple_realF SS_output and FLStock load", {

  expect_true(validObject(sirs))

  }
)

# CHECK SSB matches

test_that("Calculated simple_realF SSB matches that in Report.sso", {
  expect_comparable(
    unitSums(ssb(sirs)),
    extractSSB(sir))
  }
)

# CHECK annual F matches

test_that("Calculated simple_realF annual weighted F matches that in Report.sso", {
  
  stk <- simplify(sirs)[, -1]
  
  expect_comparable(
    quantSums((harvest(stk)[ac(10:15),] * stock.n(stk)[ac(10:15),])) /
      quantSums(stock.n(stk)[ac(10:15),]),
    extractFbar(sir))
  }
)

# CHECK harvest

test_that("Calculated simple_realF annual Z at age matches that in Report.sso", {
  expect_comparable(
    # LAST age not returned in Report.sso$Z_at_age
    z(sirs)[dimnames(sirs)$age[-dims(sirs)$age],],
    extractZatage(sir))
  }
)
# }}}
