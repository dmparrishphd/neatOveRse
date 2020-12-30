maxdiff.m <- function(m) {
	nr <- nrow(m)
	nc <- ncol(m)

	# FORWARD AND BACKWARD DIFFERENCES IN EACH DIRECTION
	d1f <- m - rbind( m[-1,],        NA )
	d1b <- m - rbind(     NA,   m[-nr,] )
	d2f <- m - cbind( m[,-1],        NA )
	d2b <- m - cbind(     NA,   m[,-nc] )

	# VECTORIZE THE DIFFERENCE MATRICES
	w <- do.call(rbind, lapply(list(d1f, d1b, d2f, d2b), as.vector))

	# COMPUTE MAX DIFF FOR EACH MATRIX ELEMENT
	x <- vapply(FUN.VALUE=1, USE.NAMES=F, X=seq_len(ncol(w)), FUN=
		function(j) {
			a <- abs(w[,j])
			a <- a[!is.na(a)]
			if (!length(a)) a <- NA_real_
			max(a) } )

	# RETURN THE MAXES IN THE SAME SHAPE AS RECEIVED
	matrix(x, nr, nc)
}
