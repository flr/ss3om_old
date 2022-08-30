# load.R - DESC
# ioalbmse/R/load.R

# Copyright European Union, 2015-2019; WMR, 2020.
# Author: Iago Mosqueira (WMR) <iago.mosqueira@wur.nl>
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
  progress=TRUE, combine=TRUE, simplify=NULL, grid=NULL, ...) {

	# LOOP over subdirs
  out <- foreach(i=seq(length(subdirs)),
    .final = function(x) setNames(x, nm=seq(length(subdirs))),
    .inorder=TRUE, .errorhandling="stop") %dopar% {

    if(progress)
      cat("[", i, "]\n", sep="")

    # OUPUT list with FLStock and iter number
    run <- readOMSss3(subdirs[i], ...)

    # SIMPLIFY
    if(!is.null(simplify))
      run$stock <- simplify(run$stock, dims=simplify)

    # CONVERT stock to data.table
    run$stock <- data.table(as.data.frame(run$stock, units=TRUE))
    run$stock[, iter := NULL]
    run$stock[, iter := i]

    run
  }

  # CHECK for errors (NULL)
  nulls <- unlist(lapply(out, function(x)
    any(is.null(unlist(lapply(x, is.null))))))

  if(any(nulls)) {
    stop(paste("Some iters returned one or more NULL elements:",
      paste(unname(which(nulls)), collapse=", ")))
  }

  if(progress)
    cat("[combining now ...]\n", sep="")
  
  # COERCE & COMBINE as FLStock or FLStocks
  if(combine) {
    stock <- as(rbindlist(lapply(out, function(x) x$stock)), "FLStock")
  } else {
    stock <- FLStocks(lapply(out, function(x) as(x$stock, "FLStock")))
  }
  
  sr <- Reduce(combine, lapply(out, function(x) x$sr))
  
  refpts <- Reduce(cbind, lapply(out, function(x) x$refpts))
  
  results <- rbindlist(lapply(out, function(x) x$results),
    use.names=TRUE, fill=TRUE, idcol="iter")
  results[, iter:=as.numeric(iter)]

  if(!is.null(grid)) {
    results <- merge(data.table(grid), results, by="iter")
  }

  # ADD var(residuals(sr)) to res
  results[, sigma_Rec:=c(apply(residuals(sr), 6, function(x)
    sqrt(var(c(x), na.rm=TRUE))))]

  # EXTRACT yr range per fleet
  fleetyrs <- lapply(out, function(x) lapply(x$indices, function(y)
    range(as.numeric(dimnames(index(y))$year))))

  yrs <- setNames(lapply(names(fleetyrs[[1]]), function(x)
    range(Reduce(c, lapply(fleetyrs, "[[", x)))), names(fleetyrs[[1]]))

  # LOAD indices, expanding to yrs
  indices <- lapply(names(out[[1]]$indices), function(x) {
    Reduce(combine, lapply(out, function(y)
      expand(y$indices[[x]], year=do.call(seq, as.list(yrs[[x]])))))
  })

  names(indices) <- names(out[[1]]$indices)

  # SS_output
  outs <- lapply(out, function(x) x$out)

  return(list(stock=stock, sr=sr, refpts=refpts, results=results,
    indices=indices, output=outs))

} # }}}

# loadFLS - stock {{{
loadFLS <- function(dir=".", subdirs=list.dirs(path=dir, recursive=FALSE),
  progress=TRUE, combine=TRUE, convert=TRUE, iters=seq(length(subdirs)), ...) {

	# LOOP over subdirs
  out <- foreach(i=iters, .inorder=TRUE,
    .errorhandling="remove") %dopar% {

    if(progress)
      cat("[", i, "]\n", sep="")

    # OUPUT list with FLStock and iter number
    run <- readFLSss3(subdirs[i], ...)

    # CONVERT stock to data.table
    stock <- data.table(as.data.frame(run, units=TRUE))
    # iter is factor, need to DROP
    stock[, iter := NULL]
    stock[, iter := as.numeric(i)]

    stock
  }

  # COMBINE
  if(combine) {
    out <- rbindlist(out)
      if(convert)
        out <- as(out, "FLStock")
  } else {
    if(convert) {
      # SET returned iters as names
      nms <- unlist(lapply(out, function(x) x$iter[1]))
      out <- FLStocks(lapply(setNames(out, nms), as, "FLStock"))
    }
  }
  
  return(out)

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
    metrics <- as(metrics, "FLQuants")
  
  return(metrics)

} # }}}

# loadRES - data.frame {{{
loadRES <- function(dir=".", subdirs=list.dirs(path=dir, recursive=FALSE),
  progress=TRUE, iters=seq(length(subdirs)), grid=NULL, ...) {

	# LOOP over subdirs
  out <- foreach(i=iters, .inorder=TRUE,
    .errorhandling="pass") %dopar% {

    if(progress)
      cat("[", i, "]\n", sep="")

    # OUPUT list with FLStock and iter number
    readRESss3(subdirs[i], ...)
  }

  errs <- !unlist(lapply(out, is, "data.table"))

  if(any(errs)) {
    warning(paste("Some results could not be loaded:",
    paste(which(errs), collapse=", ")))
  }

  out <- rbindlist(out[!errs])

  if(!is.null(grid)) {
    out <- cbind(data.table(grid)[!errs], out)
  }

  return(out)

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

# loadRESIDs - list(sr, indices) {{{
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

# loadOUT {{{
# TODO SET to work with compress
loadOUT <- function(dir=".", subdirs=list.dirs(path=dir, recursive=FALSE),
  progress=TRUE, repfile="Report.sso", compfile="CompReport.sso", ...) {

  # ASSEMBLE paths
  if(!missing(subdirs) & !missing(dir))
    subdirs <- file.path(dir, subdirs)
	
  # Loop over dirs
	out <- foreach(i=seq(length(subdirs)), .errorhandling = "remove",
    .inorder=TRUE) %dopar% {

    if(progress)
			cat(paste0('[', i, ']\n'))
    
		readOutputss3(subdirs[i], repfile=repfile, compfile=compfile)
	}
  
  return(out)
} # }}}

# loadFLIBs
