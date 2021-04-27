function ( path ) {
    Text <- readLines ( paste0 ( path , "R/proto.R" ) )
    REPLACEMENT <- paste0(
         '        DF <- data.frame(`storage.mode<-`(',
         'MATRIX[ , 1:3 , drop = FALSE], "integer"), ',
         'MATRIX[,4])')
    f <- file(open="w+")
        write ( file = f , x = replace ( Text , 79 , REPLACEMENT ) )
        FUN <- source(f)[[1]]
    close ( f )
    FUN ( path ) }
