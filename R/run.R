# run.R - DESC
# ss3om/R/run.R

# Copyright European Union, 2017
# Author: Iago Mosqueira (EC JRC) <iago.mosqueira@ec.europa.eu>
#
# Distributed under the terms of the European Union Public Licence (EUPL) V.1.1.

# runss3grid {{{
runss3grid <- function(grid, dir=paste0('grid', format(Sys.time(), "%Y%m%d")),
  logfile=file.path(dir, 'run_grid_log'), options="", pack=FALSE) {
	
	cat("START: ", date(), "\n", file=logfile)

  # FIND ss3 in pkg
	if (.Platform$OS.type == "unix") {
    # FIND ss3 in system
    ss3path <- dirname(Sys.which("ss3"))
    # IF missing, use in pkg
    if(nchar(ss3path) == 0)
      ss3path <- system.file("bin/linux/", package="ss3om")
    sep <- ":"
    exe <- "ss3"
	} else if (.Platform$OS.type == "windows") {
    # FIND ss3 in system
    ss3path <- dirname(Sys.which("ss3"))
    # IF missing, use in pkg
    if(nchar(ss3path) == 0)
      ss3path <- system.file("bin/windows/", package="ss3om")
    sep <- ";"
    exe <- "ss3.exe"
  }

  # SET $PATH
  path <- paste0(ss3path, sep, Sys.getenv("PATH"))
  Sys.setenv(PATH=path)

	foreach (i=grid$iter, .errorhandling = "remove") %dopar% {
    
    row <- which(grid$iter == i)
		dirname <- paste(dir, grid[row, "id"], sep="/")
		
    cat("[", i, "]\n")
    cat(grid[row,'id'], date(), "START\n", file=logfile, append=TRUE, sep=": ")

		# SS3!
		workdir <- getwd()
		setwd(dirname)
		system(paste(exe, options), ignore.stdout = TRUE, ignore.stderr = TRUE)
    if(pack)
      packss3run(".")
		setwd(workdir)

    cat(grid[row,'id'], date(), "END\n", file=logfile, append=TRUE, sep=": ")
	}

	cat("END: ", date(), "\n", file=logfile, append=TRUE, sep="")

	invisible(readLines("run_grid_log"))

} # }}}

# nameGrid {{{

#' nameGrid
#'
#' Creates folder names from a 'grid' df of scenarios
#'
#' @param df Model grid data.frame
#' @param dir Folder name
#' @param from Starting number

nameGrid <- function(df, dir, from=1) {
	df$iter <- seq(from=from, length=nrow(df))
	df$id <- paste(df$iter, apply(df, 1, function(x)
		paste0(gsub(" ", "", paste0(names(x), as.character(x))), collapse="_")), sep="-")
	return(df)
}
# }}}

# parselog {{{
parselog <- function(log, format="%a %b %d %H:%M:%S %Y") {

  # GET total time
  ini <- strptime(sub("START: ", "", log[1]), format=format)
  end <- strptime(sub("END: ", "", log[length(log)]), format=format)

  # OUTPUT times per run
  out <- lapply(log[-c(1, length(log))],
    function(x) unlist(strsplit(x, ": ")))
 
  idx <- unlist(lapply(out, "[", 3))

  oini <- out[idx == "START"]
  oend <- out[idx == "END"]

  idx <- match(unlist(lapply(oini, "[", 1)), unlist(lapply(oend, "[", 1)))
  oend <- oend[idx]  

  oini <- rbindlist(lapply(oini, function(x)
    as.data.frame(t(setNames(x, nm=c("id", "date", "moment"))))))
  
  oend <- rbindlist(lapply(oend, function(x)
    if(!is.null(x))
      as.data.frame(t(setNames(x, nm=c("id", "date", "moment"))))
    else
      data.frame()
    ))
} # }}}
