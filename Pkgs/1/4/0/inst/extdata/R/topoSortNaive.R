topoSortNaive <- function ( X ) {
cat("topoSortNaive (1).\n")
	y <- X %|% .new
	y %|% .init
	while ( ! y %|% .done ) y %|% .step
    y %|% .pretty }
