# results.R - DESC
# /results.R

# Copyright European Union, 2015-2019; WMR, 2020.
# Author: Iago Mosqueira (WMR) <iago.mosqueira@wur.nl>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# results {{{
setGeneric("results", function(x, ...) standardGeneric("results"))

setMethod("results", signature(x="FLom"),
  function(x) {
    return(attr(x, "results"))
  })

setMethod("results", signature(x="FLStock"),
  function(x) {
    return(attr(x, "results"))
  })

setGeneric("results<-", function(x, ..., value) standardGeneric("results<-"))

setReplaceMethod("results", signature(x="FLom", value="data.frame"),
  function(x, value) {
    attr(x, "results") <- value
    return(x)
  })

setReplaceMethod("results", signature(x="FLStock", value="data.frame"),
  function(x, value) {
    attr(x, "results") <- value
    return(x)
  }) # }}}
