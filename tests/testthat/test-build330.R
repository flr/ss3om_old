# test-build330.R - DESC
# /test-build330.R

# Copyright Iago MOSQUEIRA (WMR), 2021
# Author: Iago MOSQUEIRA (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the EUPL-1.2


path <- file.path("3.30", "albio")

out <- readOutputss3(path)


# FLStock

fls <- buildFLSss330(out)

validObject(fls)

# FLIndexBiomass

fli <- buildFLIBss330(out)

# FLSR

# refpts

rps <- buildFLRPss330(out)

# results

res <- buildRESss330(out)

# FLBiol

flb <- buildFLBss330(out)

# FLBiol + FLFisheries

flbf <- buildFLBFss330(out)
