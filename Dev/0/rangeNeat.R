
# maxle and minge are intended to be defined in a manner compatible with the "1.R" files under
# https://github.com/dmparrishphd/constrainedExtremaSimple-WORM/tree/main/inst/extdata/R
rangeNeat <- function ( x , minsNeat , widthsNeat ) {
    RANGE <- range ( x )
    MIN <- maxle ( RANGE [[ 1 ]] , minsNeat )
    MAX <- minge ( RANGE [[ 2 ]] , MIN + widthsNeat )
    MIN + c ( 0 , minge ( MAX - MIN , widthsNeat ) ) }
