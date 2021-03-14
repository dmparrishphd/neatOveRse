EXAMPLE1 <- list (
    list ( "foo" , list () ) ,
    list ( "bar" , list ( "foo" ) ) ,
    list ( "baz" , list () ) ,
    list ( "qux" , list ( "foo" , "baz" ) ) ,
    list ( c ("foo" , "bar") , list() ) ,
    list ( list ( list () ) , list (c ("foo", "bar")) ) ,
    list ( "quux" , list ( "asdf" ) ) ,
    NULL )

topoSortNaive( EXAMPLE1 )
