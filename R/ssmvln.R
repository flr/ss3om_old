# ssmvln.R - DESC
# ss3om/R/ssmvln.R

# Copyright (c) L.T. Kell, 2023.
# Author: Laurie KELL <laurie@kell.es>
#
# Distributed under the terms of the EUPL-1.2

# internal {{{

# sshat

sshat <- function(hat) {

  # SET lowercase names
  names(hat) <- tolower(names(hat))
  
  # EXTRACT Recr, Bratio and F
  y <- rbind(
    hat[grep(paste("Recr", "",  sep="_"), hat$label),],
    hat[grep(paste("Bratio", "", sep="_"), hat$label),],
    hat[grep(paste("F", "", sep="_"), hat$label),])

  y <- y[substr(y$label, 1, 2) %in% c("F_", "Br", "Re"),]

  # DROP not-annual values
  y <- subset(y, !label %in% c("Recr_Initial","Recr_unfished",
    "Recr_Virgin","Ret_Catch_MSY"))

  # GET CV and Var
  y <- transform(y, cv2=(y$stddev / y$value) ^ 2,
    var=log(1 + (y$stddev / y$value) ^ 2))[, -c(4,5)]
  
  # ASSIGN names
  names(y)=c("label","hat","stdLog","std","cv")
  
  return(y)
}

# sscor, returns covariances as matrix

sscor <- function(covar){

  # UNIFY colnames
  setnames(covar, tolower(names(covar)))
  
  # EXTRACT
  flag <- unique(sort(c(
    grep(paste("Recr",  "",sep="_"),covar$label.i),
    grep(paste("Recr",  "",sep="_"),covar$label.j),
    grep(paste("Bratio","",sep="_"),covar$label.i),
    grep(paste("Bratio","",sep="_"),covar$label.j),
    grep(paste("F",     "",sep="_"),covar$label.i),
    grep(paste("F",     "",sep="_"),covar$label.j))))
  
  # GET correlations for all Fs, Bratios & Recrs
  cor <- covar[flag, c("label.i", "label.j", "corr")]
  
  flag <- substr(cor$label.i, 1, 2) %in% c("Re","F_", "Br") & 
    substr(cor$label.j, 1, 2) %in% c("Re","F_", "Br")
  cor <- cor[flag,]
  
  cor <- rbind(cor, transform(cor, label.i=label.j, label.j=label.i))
  cor <- subset(cor, !(is.na(label.i) | is.na(label.j)))
  
  cor <- dcast(cor, label.i ~ label.j, value.var="corr")
  dmns <- unname(unlist(cor[,1]))
  
  cor <- as.matrix(cor[, -1])
  cor[is.na(cor)] <- 0
  diag(cor) <- 1
  
  dimnames(cor) <- list(dmns,dmns)

  return(cor)
}

# }}}

# ssmvln {{{

#' @examples
#' data(sma)
#' head(ssmvln(sma$CoVar, sma$derived_quants, as.FLQuants=FALSE))
#' ssmvln(sma)
#' plot(ssmvln(sma))

ssmvln <- function(covar, hat=NULL, mc=500, new=!FALSE, as.FLQuants=TRUE) {

  # EXTRACT if covar is SS_output list

  if(is.null(hat) & is.list(covar)) {
    hat <- covar$derived_quants
    covar <- covar$CoVar
  }

  names(hat) <- tolower(names(hat))
  names(covar) <- tolower(names(covar))
  
  # cov(x,y)
  cor <- sscor(data.table(covar))
  
  hat <- data.table(hat)
  hat <- subset(hat,label%in%dimnames(cor)[[1]])
  hat <- sshat(hat)
  cor <- cor[hat$label, hat$label]
  
  ## calculate Covariance matrix
  if(new)
    cvr <- cor2cov(cor, hat$cv)
  else
    cvr <- cor2cov(cor, hat$std^2)
  
  cvr[!is.finite(cvr)] <- 0
  
  mvlmu <- log(hat$hat) 
  names(mvlmu) <- dimnames(cor)[[1]]
  
  ## MC it all
  rtn <- exp(rmvnorm(mc, mean = mvlmu, sigma=cvr, method = c("svd")))
  
  ## return object
  rtn <- data.table(rtn)
  names(rtn) <- dimnames(cor)[[1]]

  rtn[, iter:=seq(mc)]
  rtn <- melt(rtn, id="iter")
  rtn <- rtn[, c("variable", "year"):= tstrsplit(variable, "_")]
  
  setnames(rtn, c("variable", "value"), c("qname", "data"))

  #
  if(as.FLQuants) {

    rtn[, age := 'all']
    rtn[qname == 'Recr', age := "0"]

    rtn <- as(rtn, 'FLQuants')
  }

  return(rtn)
}
# }}}
