# build330.R - DESC
# /build330.R

# Copyright European Union, 2018
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# buildRESss330 - data.table {{{
buildRESss330 <- function(out, ...) {

  lkels <- c("TOTAL", "Catch", "Survey", "Length_comp", "Recruitment")
  lknms <- c("LIKELIHOOD", "Catch", "Survey", "Length_comp", "Recruitment")
  # setNames(as.list(out$likelihoods_used[lkels, "values"]), lknms)
  
  res <- cbind(data.frame(
  
    # SR_LN(R0)
    `SR_LN(R0)`=out$estimated_non_dev_parameters['SR_LN(R0)', 'Value'],

    # Convergence_Level
    Convergence_Level=out$maximum_gradient_component,

    # SSB_endyr
    `SSB_endyr`=out$derived_quants[paste0("SSB_", out$endyr), "Value"],
  
    # F_endyr
    `F_endyr`=out$derived_quants[paste0("F_", out$endyr), "Value"]),

    # Totbio_Unfished
    `Totbio_unfished`=out$derived_quants["Totbio_unfished", "Value"],

    # SSB_Virgin
    `SSB_Virgin`=out$derived_quants["SSB_Virgin", "Value"],

    # Recr_Virgin
    `Recr_Virgin`=out$derived_quants["Recr_Virgin", "Value"],

    # SSB_MSY
    `SSB_MSY`=out$derived_quants["SSB_MSY", "Value"],
    
    # Fstd_MSY
    `Fstd_MSY`=out$derived_quants["Fstd_MSY", "Value"],
    
    # TotYield_MSY
    # `TotYield_MSY`=out$derived_quants["TotYield_MSY", "Value"],
    
    # RetYield_MSY
    # `RetYield_MSY`=out$derived_quants["RetYield_MSY", "Value"],

    # LIKELIHOOD
    data.frame(setNames(as.list(out$likelihoods_used[lkels, "values"]), lknms)))

  return(data.table(res))
} # }}}
