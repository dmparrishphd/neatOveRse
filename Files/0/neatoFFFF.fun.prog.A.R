argswap <- function (FUN) function(x, y, ...) do.call(FUN, c(list(y, x), ...))

un <- function (FUN) function(...) ! FUN(...)
