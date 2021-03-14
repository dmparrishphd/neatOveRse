detach ( "protopkg:topoSortNaive" )
DIR <- stop("See the README_TOO file at the protopackage root.")
NEATOVERSE <- stop("See the README_TOO file at the protopackage root.")
FILENAME <- paste0 ( DIR , "/R/_ATTACH.R" )
source ( FILENAME ) [[ 1 ]] ( DIR , neatoverse = NEATOVERSE )

topoSortNaive (list(list("A", list ("B"))))

source ( paste0 ( DIR , "/demo/example.R" ) ) [[1]]

ls ( as.environment ( "protopkg:topoSortNaive" ) , all = TRUE )

environment ( topoSortNaive )
ls ( environment ( topoSortNaive ) , all = TRUE )

parent.env ( environment ( topoSortNaive ) )
ls ( parent.env ( environment ( topoSortNaive ) ) , all = TRUE )

parent.env ( parent.env ( environment ( topoSortNaive ) ) )
