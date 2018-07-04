# load.R - DESC
# ioalbmse/R/load.R

# Copyright European Union, 2015-2016
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# loadOMBF

# loadOMS

# loadFLS

# loadFLIBs

# loadres


# loadom(dir, progress=TRUE) {{{
loadom <- function(dir=".", subdirs=list.dirs(path=dir, recursive=FALSE),
  progress=TRUE, ...) {

  if(progress)
    cat("[1]\n", sep="")

  # GET first iter
  master <- readFLSss3(subdirs[1], ...)

	# LOOP over subdirs
  om <- foreach(i=seq(2, length(subdirs)),
    # PROPAGATE .init
    .init=propagate(master, length(subdirs), FALSE),
    # COMBINE by assigning to iter in .init
    .combine=function(master, x) {
      FLCore::iter(master, x$i) <- x$x
      return(master)}, .inorder=TRUE,
    .errorhandling="remove", .multicombine=FALSE) %dopar% {

    if(progress)
      cat("[", i, "]\n", sep="")

    # OUPUT list with FLStock and iter number
    list(x=readFLSss3(subdirs[i], ...), i=i)
  }
  
  if(progress)
    cat("[ Converting ... ]\n")
  
  # DROP undeeded extra iters
  om <- slim(om)

	return(om)
} # }}}

# loadomFLStocks(dir, progress=TRUE) {{{
loadomFLStocks <- function(dir=".", subdirs=list.dirs(path=dir, recursive=FALSE),
  progress=TRUE, ...) {

  if(progress)
    cat("[1]\n", sep="")

	# LOOP over subdirs
  om <- foreach(i=seq(1, length(subdirs)),
    .inorder=TRUE, .errorhandling="remove") %dopar% {

    if(progress)
      cat("[", i, "]\n", sep="")

    # OUPUT list with FLStock and iter number
    readFLSss3(subdirs[i], ...)
  }

  if(progress)
    cat("[ Converting ... ]\n")
  
  names(om) <- seq(1, length(subdirs))
  
	return(FLStocks(om))
} # }}}

# loadomDT(dir, progress=TRUE) {{{
loadomDT <- function(dir=".", subdirs=list.dirs(path=dir, recursive=FALSE),
  progress=TRUE, ...) {

  master <- readFLSss3(subdirs[1], ...)

	# LOOP over subdirs
  om <- foreach(i=seq(length(subdirs)),
    .combine=function(...) rbindlist(list(...)), .errorhandling="remove",
    .multicombine=TRUE) %dopar% {

    if(progress)
      cat("[", i, "]\n", sep="")

    dt <- data.table(as.data.frame(readFLSss3(subdirs[i], ...)))
    
    # SET iter to i
    dt[, iter := NULL]
    dt[, iter := i]

    dt
  }
  
  if(progress)
    cat("[ Converting ... ]\n")
  
  om <- as.FLStock(om, units=units(master))
  range(om) <- range(master)

  # DROP undeeded extra iters
  om <- slim(om)

	return(om)
} # }}}

# loadom2csv(dirs, progress=TRUE) {{{
loadom2csv <- function(dirs, progress=TRUE, ...) {

	# LOOP over dirs
  if(progress)
    cat("[ Reading ... ]\n")
  om <- foreach(i=seq(length(dirs))) %dopar% {

    if(progress)
      cat("[", i, "] ", sep="")

    dt <- data.table(as.data.frame(readFLSss3(dirs[i], ...)))
    dt[, iter := NULL]
    dt[, iter := i]
    setcolorder(dt, c("age", "year", "unit", "season", "area", "iter", "data"))

    fwrite(dt, file=paste0(dirs[i], "/om.csv"))
    paste0(dirs[i], "/om.csv")
  }

  # MERGE
  if(progress)
    cat("[ Merging ... ]\n")
  system(paste0("cp ", dirs[1], "/om.csv ./"))
  for(i in seq(2, length(dirs))) {
    if(progress)
      cat("[", i, "] ", sep="")
    system(paste0("tail -n +2 ", dirs[i], "/om.csv >> om.csv"))
    system(paste0("rm ", dirs[i], "/om.csv"))
  }
  
  # LOAD
  if(progress)
    cat("[ Loading ... ]\n")
  om <- fread("om.csv")
  system("rm om.csv")

  # COERCE
  if(progress)
    cat("[ Coercing ... ]\n")
  om <- as(om, "FLStock")

	return(om)
} # }}}

# loadres(dirs, vars, progress=TRUE) {{{
loadres <- function(dir=".", subdirs=list.dirs(path=dir, recursive=FALSE),
  progress=TRUE, repfile="Report.sso", covarfile="covar.sso", grid=NULL, ...) {

  # ASSEMBLE paths
  if(!missing(subdirs) & !missing(dir))
    subdirs <- file.path(dir, subdirs)

	# Loop over dirs
	out <- foreach(i=seq(length(subdirs)), .errorhandling = "remove",
    .inorder=TRUE) %dopar% {
		
    if(progress)
			cat(paste0('[', i, ']\n'))
    
    # CONVERGED?
    if(!file.exists(file.path(subdirs[i], covarfile))) {
      setNames(data.frame(matrix(NA, ncol = length(vars), nrow = 1)), names(vars))
    } else {
    # READ results
		cbind(iter=i, readRPss3(file.path(subdirs[i], repfile), ...))
    }
	}
  # rbind 
  res <- rbindlist(out)
  
  # RBIND grid
  if(!is.null(grid)) {
    grid <- data.table(grid)
    res <- cbind(grid[grid$iter %in% res$iter,][, !c('id', 'iter'), with=FALSE],
      res)
  } else {
    res <- cbind(res, id=subdirs)
  }

	return(res)
} # }}}

# loadindex(dirs, progress=TRUE) {{{
loadindex <- function(dirs, progress=TRUE, fleets) {

	# LOOP over dirs
  ind <- foreach(i=seq(length(dirs))) %dopar% {

    if(progress)
      cat("[", i, "]\n", sep="")

    out <- r4ss::SS_output(dirs[i], verbose=FALSE, hidewarn=TRUE, warn=FALSE,
      printstats=FALSE, covar=FALSE, forecast=FALSE)
    
    # dfs from out
    cpue <- data.table(out[[c("cpue")]])
    selex <- data.table(out[["ageselex"]])

    # EXTRACT index, residuals and selectivity
    index <- ss3index(cpue, fleets)
    index.res <- ss3index.res(cpue, fleets)
    sel.pattern <- ss3sel.pattern(selex, unique(cpue$Yr), 3)
    
    # MERGE across fleets
    list(index=index,
      index.res=index.res,
      sel.pattern=sel.pattern)
  }

  # ind: iter - slot - index/flqs
  
  # out: index - slot - iter
  
  index <- Reduce(combine, lapply(ind, "[[", 'index'))
  index.q <- Reduce(combine, lapply(ind, "[[", 'index.q'))
  sel.pattern <- Reduce(combine, lapply(ind, "[[", 'sel.pattern'))

	return(FLQuants(index=index, index.q=index.q, sel.pattern=sel.pattern))
} # }}}
