topoSortNaive <- function ( X , pretty = FALSE ) {
	y <- X %|% .new
	y %|% .init
	while ( ! y %|% .done ) y %|% .step
    if ( pretty ) y %|% .pretty else y $ Table $ ORDER }
