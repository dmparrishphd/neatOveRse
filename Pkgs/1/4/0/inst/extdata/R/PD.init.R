.init <- function ( envir )
	    envir $ Table $ ORDER [ 
	        envir $ Table $ N %|% as.logical %|% `!` ] <- 1L
