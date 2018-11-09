# load.R - DESC
# ioalbmse/R/load.R

# Copyright European Union, 2015-2016
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# loadOM - FLom {{{
loadOM <- function(dir=".", subdirs=list.dirs(path=dir, recursive=FALSE),
  progress=TRUE, ...) {

  if(progress)
    cat("[1]\n", sep="")

  # READ first element
  first <- readFLomss3(subdirs[1], ...)

  # and RETURN if no more
  if(length(subdirs) == 1)
    return(first)

	# LOOP over subdirs
  om <- foreach(i=seq(2, length(subdirs)),
    # PROPAGATE .init
    .init=propagate(first, length(subdirs), FALSE),
    # COMBINE by assigning to iter in .init
    .combine=combine, .inorder=TRUE,
    .errorhandling="remove", .multicombine=TRUE) %dopar% {

    if(progress)
      cat("[", i, "]\n", sep="")

    # OUPUT list with FLStock and iter number
    readFLomss3(subdirs[i], ...)
  }

  # DROP undeeded extra iters
  om@stock <- slim(om@stock)
  
  return(om)

} # }}}

# loadOMS - list(stock, sr, indices, results, refpts) {{{
loadOMS <- function(dir=".", subdirs=list.dirs(path=dir, recursive=FALSE),
  progress=TRUE, combine=TRUE, ...) {

	# LOOP over subdirs
  out <- foreach(i=seq(length(subdirs)),
    .inorder=TRUE, .errorhandling="remove") %dopar% {

    if(progress)
      cat("[", i, "]\n", sep="")

    # OUPUT list with FLStock and iter number
    run <- readOMSss3(subdirs[i], ...)

    # CONVERT stock to data.table
    run$stock <- data.table(as.data.frame(run$stock, units=TRUE))
    run$stock[, iter := NULL]
    run$stock[, iter := i]

    run
  }
  
  if(progress)
    cat("[combining now ...]\n", sep="")
  
  # COMBINE
  if(combine)
    stock <- as(rbindlist(lapply(out, function(x) x$stock)), 'FLStock')
  else {
    stock <- rbindlist(lapply(out, function(x) x$stock))
  }
 
  sr <- Reduce(combine, lapply(out, function(x) x$sr))
  
  refpts <- Reduce(cbind, lapply(out, function(x) x$refpts))
  
  results <- rbindlist(lapply(out, function(x) x$results),
    use.names=TRUE, fill=TRUE, idcol="iter")
  
  indices <- lapply(names(out[[1]]$indices), function(x) {
    Reduce(combine, lapply(out, function(y) y$indices[[x]]))
  })

  return(list(stock=stock, sr=sr, refpts=refpts, results=results, indices=indices))

} # }}}

# loadFLS - list(stock, sr, indices, results, refpts) {{{
loadFLS <- function(dir=".", subdirs=list.dirs(path=dir, recursive=FALSE),
  progress=TRUE, combine=TRUE, ...) {

	# LOOP over subdirs
  out <- foreach(i=seq(length(subdirs)),
    .inorder=TRUE, .errorhandling="remove") %dopar% {

    if(progress)
      cat("[", i, "]\n", sep="")

    # OUPUT list with FLStock and iter number
    run <- readFLSss3(subdirs[i], ...)

    # CONVERT stock to data.table
    stock <- data.table(as.data.frame(run, units=TRUE))
    stock[, iter := NULL]
    stock[, iter := i]

    stock
  }
  
  # COMBINE
  if(progress)
     cat("[combining now ...]\n", sep="")

  if(combine) {
    stock <- as(rbindlist(out), 'FLStock')
  } else {
    stock <- rbindlist(out)
  }
  
  return(stock)

} # }}}

# loadFLQs - list(stock, sr, indices, results, refpts) {{{
loadFLQs <- function(dir=".", subdirs=list.dirs(path=dir, recursive=FALSE),
  progress=TRUE, convert=TRUE, metrics=list(REC=rec, SSB=ssb, C=catch, F=fbar), ...) {

	# LOOP over subdirs
  out <- foreach(i=seq(length(subdirs)),
    .inorder=TRUE, .errorhandling="remove") %dopar% {

    if(progress)
      cat("[", i, "]\n", sep="")

    # OUPUT list with FLStock and iter number
    run <- readFLSss3(subdirs[i], ...)

    if(is.null(run))
      run <- readFLSss3(subdirs[i], ...)

    dt <- data.table(as.data.frame(metrics(run, metrics)))
    dt[, iter:=NULL]
    dt[, iter:=i]
  }

  # COMBINE
  if(progress)
     cat("[combining now ...]\n", sep="")

  metrics <- rbindlist(out)

  if(convert)
    metrics <- as.FLQuant(metrics)
  
  return(metrics)

} # }}}

# loadRES {{{
loadRES <- function(dir=".", subdirs=list.dirs(path=dir, recursive=FALSE),
  progress=TRUE, repfile="Report.sso", compfile="CompReport.sso",
  covarfile="covar.sso", grid=NULL, ...) {

  # ASSEMBLE paths
  if(!missing(subdirs) & !missing(dir))
    subdirs <- file.path(dir, subdirs)

	# Loop over dirs
	out <- foreach(i=seq(length(subdirs)), .errorhandling = "remove",
    .inorder=TRUE) %dopar% {
		
    if(progress)
			cat(paste0('[', i, ']\n'))
    
    # CONVERGED? (covar.sso exists)
    if(!file.exists(file.path(subdirs[i], covarfile))) {
      data.frame(iter=i)
    } else {
    # READ results
		cbind(iter=i, readRESss3(subdirs[i], repfile=repfile, compfile=compfile))
    }
	}
  
  if(progress)
	  cat(paste0('[assembling now ...]\n'))
  
  # rbind 
  res <- rbindlist(out, use.names=TRUE, fill=TRUE)
  
  # RBIND grid
  if(!is.null(grid)) {
    grid <- data.table(grid)
    res <- cbind(grid[, !c("id"), with=FALSE], res[, !c("iter"), with=FALSE])
  }
  return(res)
} # }}}

# loadRPs {{{
loadRPs <- function(dir=".", subdirs=list.dirs(path=dir, recursive=FALSE),
  progress=TRUE, repfile="Report.sso", compfile="CompReport.sso",
  covarfile="covar.sso", ...) {

  # ASSEMBLE paths
  if(!missing(subdirs) & !missing(dir))
    subdirs <- file.path(dir, subdirs)

	# Loop over dirs
	out <- foreach(i=seq(length(subdirs)), .errorhandling = "remove",
    .inorder=TRUE) %dopar% {
		
    if(progress)
			cat(paste0('[', i, ']\n'))
    
    # READ results
		readFLRPss3(subdirs[i], repfile=repfile, compfile=compfile)
	}
  
  # rbind 
  res <- Reduce(cbind, out)
  
	return(res)
} # }}}

# loadFLIBs

# loadSRIs - list(sr, indices) {{{
loadRESIDs <- function(dir=".", subdirs=list.dirs(path=dir, recursive=FALSE),
  progress=TRUE, combine=TRUE, ...) {

	# LOOP over subdirs
  out <- foreach(i=seq(length(subdirs)),
    .inorder=TRUE, .errorhandling="remove") %dopar% {

    if(progress)
      cat("[", i, "]\n", sep="")

    # OUPUT list with FLStock and iter number
    lapply(readRESIDss3(subdirs[i], ...), function(x) {
      x <- data.table(as.data.frame(x))
      x[, iter:=NULL]
      x[, iter:=i]
      return(x)
    })
    
  }

  # BUG
  idx <- unlist(lapply(out, is.null))

  if(any(idx)) {
    out[which(idx)] <- lapply(which(idx),
      function(x) lapply(readRESIDss3(subdirs[x], ...), as.data.frame))
  }
  
  if(progress)
    cat("[combining now ...]\n", sep="")
  
  # COMBINE
  if(combine) {

    sr <- as(rbindlist(lapply(out, "[[", "sr")), "FLQuant")

    indices <- lapply(out, "[[", "indices")

    indices <- lapply(indices, split, by="qname")

    nms <- names(indices[[1]])

    indices <- setNames(lapply(nms, function(x) {
      res <- rbindlist(lapply(indices, "[[", x))
      res[, qname:=NULL]
      return(res)
      }), nms)

    indices <- FLQuants(lapply(indices, as.FLQuant))
  }

  return(list(sr=sr, indices=indices))

} # }}}
