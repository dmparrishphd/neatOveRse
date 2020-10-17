curry <- function(FUN, ...) {
    #REMINDER COMMENTS #1, #2, #3, AND #4 ARE REFERENCED IN THE LICENCE FILE
    .orig <- match.call() #1
    .orig[[1]] <- NULL #2 Remove first item, which matches FUN
    .orig[[1]] <- NULL #2 Remove second item, which matches the Curried argument
    function(...) {
        .inner <- match.call()
        .inner[[1]] <- NULL # Remove first item, which matches curry #3
        do.call(FUN, c(.orig, .inner), envir=parent.frame()) } } #4
