bounding.box.xy <- function(xy) {
    niceRange <- function(x) {
        x <- x[!is.na (x)]
        x <- x[!is.nan(x)]
        x <- if (length(x)) x else vector(typeof(x), 1) + NA
        range(x) }
    cbind(
        range(xy[,1]),
        range(xy[,2]) ) }
