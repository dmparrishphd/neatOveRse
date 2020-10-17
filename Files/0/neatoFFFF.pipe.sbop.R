`%|%`    <- function(x, FUN) FUN(x)

`%:|%`   <- function(FUN, x) FUN(x)

`%||%`   <- function(X, FUN) do.call(FUN, X)

`%:||%`  <- function(FUN, X) do.call(FUN, X)
