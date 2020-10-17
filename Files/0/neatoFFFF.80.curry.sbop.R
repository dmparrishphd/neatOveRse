`%<=%` <- function (FUN, X) do.call(curry, c(FUN, list(X)))

`%=>%` <- function (X, FUN) do.call(curry, c(FUN, list(X)))

`%v%` <- function (LIST, FUN) do.call(curry, c(FUN, LIST))

`%^%` <- function (FUN, LIST) do.call(curry, c(FUN, LIST))
