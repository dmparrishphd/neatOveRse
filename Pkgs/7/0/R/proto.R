function(path) {

    `%//%` <- paste0

    source.object <- function(file)
            source(file=file, local=T)[[1]]

    lcurry <- function(f, X)
            function(...) do.call(f, c(X, list(...)))

    `%<=%` <- function (FUN, X) lcurry(FUN, X)

    `%|%` <- function(X, FUN) FUN(X)

    flipr <- function(rows)
            if (nrow(rows) < 2) rows else rows[nrow(rows):1,]

    ############################################################

    . <- list()

    .$SHAPETYPES <- read.csv(path %//% "inst/extdata/shapetypes.csv",
        stringsAsFactors=F)

    .$.readIBig <- path %//% "R/readIBig.R" %|% source.object

    .$.readILittle <- path %//% "R/readILittle.R" %|% source.object

    .$.readDouble <- path %//% "R/readDoubles.R" %|% source.object

    .$.doubleToPoints <- function(x) t(matrix(x, 2))

    .$.HEADERNAMES <- read.csv(stringsAsFactors=F,
        path %//% "inst/extdata/header.names.csv")[[1]]

    .$.init <- function(., filename)  {
        .$.FILENAME <- filename
        . }

    .$.header <- function(.) {
        File <- .$.open(.)
            Header <- lapply(
                list(
                    .$.readIBig %<=% list(n=7),
                    .$.readILittle %<=% list(n=2),
                    .$.readDouble %<=% list(n=8)),
                function(FUN) File %|% FUN) %|% unlist
        close(File)
        names(Header) <- .$.HEADERNAMES
        Header }

    .$.loadHeader <- function(.) {
        .$HEADER <- .$.header(.)
        . }

    .$.open <- function(.) file(.$.FILENAME, "rb")

    .$.seekFirstRecordHeader <- function(con) seek(con, 100)

    .$.readRecordHeader <- .$.readIBig %<=% list(n=2)

    .$.recordHeaders <- function(.) {
        stopifnot(!is.null(.$HEADER))
        Con <- .$.open(.)
            .$.seekFirstRecordHeader(Con)
            Pos <- seek(Con)
            RecordHeaders <- list()
            repeat {
                Pos <- seek(Con)
                RecordHeader <- .$.readRecordHeader(Con)
                if (!length(RecordHeader)) break
                ShapeType <- .$.readILittle(Con, 1)
                RecordHeaders <- list(
                    c(RecordHeader, ShapeType, Pos), RecordHeaders)
                seek(where=-4 + 2 * RecordHeaders[[1]][[2]],
                    origin="current", con=Con) }
        close(Con)
        MATRIX <- flipr(t(matrix(unlist(RecordHeaders), 4)))
        DF <- data.frame(`storage.mode<-`(MATRIX[,1:3], "integer"), MATRIX[,4])
        names(DF) <- strsplit(split=" ",
            "Record.Number Content.Length Shape.Type where")[[1]]
        DF }

    .$.loadRecordHeaders <- function(.) {
        .$RECORD.HEADERS <- .$.recordHeaders(.)
        . }

    .$init <- function(., filename) {
        . <- .$.init(., filename)
        . <- .$.loadHeader(.)
        . <- .$.loadRecordHeaders(.)
        . }

    .
}
