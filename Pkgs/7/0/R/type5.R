function(path) {

    `%//%` <- paste0

    source.object <- function(file)
            source(file=file, local=T)[[1]]

    lcurry <- function(f, X)
            function(...) do.call(f, c(X, list(...)))

    `%<=%` <- function (FUN, X) lcurry(FUN, X)

    `%|%` <- function(X, FUN) FUN(X)

    ############################################################

    . <- source.object(path %//% "R/proto.R")(path)

    .$.readRecordSubheader <- function(., con) {
        Fixed <- lapply(
            list(
                .$.readILittle %<=% list(n=1),
                .$.readDouble %<=% list(n=4),
                .$.readILittle %<=% list(n=2)),
            function(FUN) con %|% FUN) %|% unlist
        NumParts <- Fixed[6]
        Parts <- .$.readILittle(con, NumParts)
        c(Fixed, Parts) }

    .$.preInit <- .$init

    .$.skipRecordHeader <- function(., con)
            .$.readIBig(con, 2)

    .$init <- function(., filename) {
        . <- .$.preInit(., filename)
        Con <- .$.open(.)
            SUBHEADERS <- lapply(
                1:nrow(.$RECORD.HEADERS),
                function(i)  {
                    if (!.$RECORD.HEADERS[i, "Shape.Type"]) {
                        rep(NA_real_, 7) } else {
                        seek(Con, .$RECORD.HEADERS[i, "where"])
                        .$.skipRecordHeader(., Con)
                        Subheader <- .$.readRecordSubheader(., Con)
                        c(44 + 4 * Subheader[6], Subheader)}
                })
        close(Con)
        i <- 1:8
        TABLE <- do.call(rbind, lapply(SUBHEADERS, function(x) x[i]))
        TABLE <- data.frame(
            as.integer(TABLE[,1]),
            TABLE[,2:5],
            `storage.mode<-`(TABLE[,6:8], "integer"))
        names(TABLE) <-  strsplit(split=" ",
            "Size Shape.Type XMin YMin XMax YMax NumParts NumPoints")[[1]]
        PARTS <- lapply(SUBHEADERS, function(x) x[-i])
        .$SUBHEADERS <- TABLE[, c(2:8, 1)]
        .$PARTS <- PARTS
        .$N <- lapply(
            seq_along(.$PARTS),
            function(i) diff(c(.$PARTS[[i]], .$SUBHEADERS[i, "NumPoints"])))
        .
    }

    .$.skipSubheader <- function(., Con, i)
        seek(Con, origin="current", where=
            .$SUBHEADERS[i, "Size"])

    .$.seekPoints <- function(., Con, n, k)  {
        seek(Con, .$RECORD.HEADERS[n, "where"])
        .$.skipRecordHeader(., Con)
        .$.skipSubheader(., Con, n)
        seek(Con, origin="current", where=
            8 * .$PARTS[[n]][k]) }

    .$.points <- function(., con, n, k) {
        .$.seekPoints(., con, n, k)
        .$.doubleToPoints(.$.readDouble(
            con, 2 * .$N[[n]][k] ) ) }

    .$points <- function(., n, k) {
        stopifnot(!is.null(.$RECORD.HEADERS))
        Con <- .$.open(.)
        .$.points(., Con, n, k)
        close(Con)
        POINTS }

    .$loadAllPoints <- function(.) {
        Con <- .$.open(.)
            .$POINTS <- lapply(
                seq_along(.$PARTS),
                function(n) lapply(
                    seq_along(.$PARTS[[n]]),
                    function(k) .$.points(., Con, n, k)))
        close(Con)
        . }

    .
}
