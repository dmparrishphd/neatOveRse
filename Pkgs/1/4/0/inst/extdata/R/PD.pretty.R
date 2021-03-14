.pretty <- function ( X ) {
	REORDER <- order ( X $ Table $ ORDER )
	NONZERO <- X $ Table $ ORDER [ REORDER ] %|% as.logical
	ZERO <- ! NONZERO
	OUT <- rbind (
		X $ Table [ REORDER , ] [ NONZERO , ] ,
		X $ Table [ REORDER , ] [    ZERO , ] )
	OUT [ , c ( "ORDER" , "TARGET" , "SOURCES" ) ] }
