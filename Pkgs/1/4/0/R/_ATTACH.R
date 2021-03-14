function ( path = "" , parent.name = globalenv () ,
          name = "protopkg:topoSortNaive" , quiet = TRUE ,
          neatoverse = "" ) {
    `%//%` <- paste0
    DIR <- path %//% "/inst/extdata/"
    scan. <- function ( file ) scan (
        file = file ,
        what = "" ,
        sep = "\n" ,
        quiet = quiet ,
        comment.char = "#" )

    FILENAMES.IMPORTS <- paste0 ( neatoverse , "/", scan. (
        DIR %//% "_IMPORTS_NEATOVERSE.dat" ) )
    FILENAMES.NAMESPACE <- paste0 ( DIR , "/R/" , scan. (
        DIR %//% "_NAMESPACE.dat" ) )
    FILENAMES.EXPORT <- paste0 ( DIR , "/R/" , scan. (
        DIR %//% "_EXPORT.dat" ) )

    Imports <- new.env ( parent = as.environment ( parent.name ) )
    Namespace <- new.env ( parent = Imports )
    Export <- new.env ( parent = Namespace )

    attr(Namespace, "name") <- name %//% ":namespace"
    attr(Imports, "name") <- name %//% ":imports"

    for ( Filename in FILENAMES.IMPORTS ) source (
        file= Filename , local = Imports )
    for ( Filename in FILENAMES.NAMESPACE ) source (
        file= Filename , local = Namespace )
    for ( Filename in FILENAMES.EXPORT ) source (
        file= Filename , local = Export )

    for ( Name in ls ( envir = Export ) )
            if ( is.function ( Export [[ Name ]] ) )
                    environment ( Export [[ Name ]] ) <- Namespace

    attach ( name = name , what = Export )
    invisible () }
