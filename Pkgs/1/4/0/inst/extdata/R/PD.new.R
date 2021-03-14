.new <- function ( X ) {
	Env <- new.env ()
	Env $ Table <- data.frame (
		N = X %|% .n ,
		ORDER = X %|% length %|% integer ,
		TARGET = X %|% .targets %|% matrix ,
		SOURCES = X %|% .sources %|% matrix )
	Env $ Table $ PREVIOUS.ORDER <- Env $ Table $ ORDER
	Env }
