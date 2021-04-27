function ( path ) {
    Text <- readLines ( paste0 ( path , "R/type5.R" ) )
    R17 <-
            "    . <- source.object(path %//% \"R/proto1.R\")(path)"
    R52..54 <- c (
            "            as.integer(TABLE[,1,drop=FALSE])," ,
            "            TABLE[,2:5,drop=FALSE]," ,
            "            `storage.mode<-`(TABLE[,6:8,drop=FALSE], \"integer\"))" )
    R79..80 <- c (
            '        POINTS <- .$.doubleToPoints(.$.readDouble(' ,
            '            con, 2 * .$N[[n]][k] ) )' ,
            '        colnames(POINTS) <- c ("x","y")' ,
            '        POINTS }' )
    R85 <-
            '            POINTS <- .$.points(., Con, n, k)'
    f <- file(open="w+")
        write ( file = f , c (
            Text [ 1:16 ] ,
            R17 ,
            Text [ 18:51 ] ,
            R52..54 ,
            Text [ 55:78 ] ,
            R79..80 ,
            Text [ 81:84 ] ,
            R85 ,
            Text [ -85:-1] ) )
        FUN <- source ( f ) [[ 1 ]]
    close ( f )
    FUN ( path ) }
