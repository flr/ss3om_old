# testthat.R - DESC
# /testthat.R

# Copyright 2015 Iago Mosqueira (EC JRC) <iago.mosqueira@jrc.ec.europa.eu>
#
# Distributed under terms of the European Union Public Licence (EUPL) 1.1.
#
# Notes:

library(testthat)
library(ss3om)

# expect_comparable {{{

expect_comparable <- function(object, expected, ..., label = NULL,
  expected.label = NULL) {

  # 1. Capture object and label
  act <- quasi_label(rlang::enquo(object), label, arg = "object")
  exp <- quasi_label(rlang::enquo(expected), expected.label, arg = "expected")

  # 2. Call expect()
  act$diff <- c((object - expected) / abs(expected))
  expect(
    all(abs(act$diff) < 0.01),
    sprintf("relative difference between objects larger than 1%%.")
  )

  # 3. Invisibly return the value
  invisible(act$diff)
} # }}}

test_check("ss3om")
