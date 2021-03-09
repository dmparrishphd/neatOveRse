
# RETURN SQUARE MATRIX TELLING WHETHER MATRIX INDICES ARE ADJACENT
adjacent <- function ( mi ) {
	n <- nrow ( mi )
	DIM <- rep ( n , 2 )
	i <- arrayInd ( seq_len ( prod ( DIM ) ) , DIM)
	dxy <- mi [ i [ , 1 ] , ] - mi [ i [ , 2 ] , ]
	matrix ( nrow = n , ncol = n , data =
		abs ( dxy [ , 1 ] + dxy [ , 2 ] ) == 1L ) }


whichAdjacent <- function ( mi ) {
	ADJ <- adjacent ( mi )
	n <- nrow ( ADJ )
	i <- as.vector ( row ( ADJ ) )
	j <- as.vector ( col ( ADJ ) )
	ij <- vapply ( as.data.frame ( optional = TRUE , rbind ( i , j ) ) , sort , integer(2) )
	rownames ( ij ) <- c ( "i" , "j" )
	M <- t ( ij ) [ as.vector ( ADJ ) , ]
	M [ ! duplicated ( M ) , ] }

