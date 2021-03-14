.step <- function ( envir ) {
	i <- envir $ Table $ ORDER %|% as.logical
	SATISFIED.TARGETS <- envir $ Table $ TARGET [ i ]
	NOW.SATISFIED <- vapply (
		USE.NAMES = FALSE ,
		FUN.VALUE = logical ( 1 ) ,
		X = envir $ Table $ SOURCES ,
		FUN = function ( sources )
                sources %in% SATISFIED.TARGETS %|% all )
	NEXT <- envir $ Table $ ORDER %|% max + 1L
	envir $ Table $ PREVIOUS.ORDER <- envir $ Table $ ORDER
	envir $ Table $ ORDER [
        NOW.SATISFIED & ! envir $ Table $ ORDER ] <- NEXT }
