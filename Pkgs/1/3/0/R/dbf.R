DBF.PROTO <- list(
    .SEE.ALSO=list(
        REFERENCES=c(
            "\".dbf\" https://en.wikipedia.org/wiki/.dbf",
            character()),
        .NULL=NULL
    ),
    .init=function(., description) {
        .$.FILENAME <- description
        . },
    .readHead=function(.) {
        .$.HEAD <- readBin(.$.FILENAME, raw(), 32)
        . },
    .parseHead=function(.) {
        .$.HEAD.PARSED <- lapply(
            lapply(list(0, 1:3, 4:7, 8:9, 10:11, 12:13, 14, 15,
                16:27, 28, 29, 30:31), function(i) i + 1L),
            function(i) .$.HEAD[i])
        . },
    .parsedHeadInterpret=function(.) {
        .$NRECORDS <- sum(as.integer(.$.HEAD.PARSED[[3]]) * 256^(0:3))
        .$HEADSIZE <- sum(as.integer(.$.HEAD.PARSED[[4]]) * 256^(0:1))
        .$RECSIZE  <- sum(as.integer(.$.HEAD.PARSED[[5]]) * 256^(0:1))
        . },
    .computeNumberOfFields=function(.) {
        f <- file(.$.FILENAME, "rb")
            r <- readBin(f, raw(), 32)
            n <- 0
            repeat {
                r <- readBin(f, raw(), 32)
                if (r[1] == as.raw(13)) break
                n <- n + 1
            }
        close(f)
        .$NFIELDS <- n
        . },
    .readRawFieldDescriptors=function(.) {
        f <- file(.$.FILENAME, "rb")
            r <- readBin(f, raw(), 32)
            .$.FIELD.DESCRIPTORS.RAW <- vapply(
                1:.$NFIELDS,
                function(k) readBin(f, raw(), 32),
                raw(32))
        close(f)
        . },
    .parseRawFieldDescriptors=function(.) {
        DF <- as.data.frame(.$.FIELD.DESCRIPTORS.RAW)
        li <- lapply(
            list(0:10, 11, 12:15, 16, 17, 18:19, 20, 21:30, 31),
            function(i) i + 1L)
        .$.FIELD.DESCRIPTORS.RAW.PARSED <- lapply(
            seq(.$NFIELDS), function(j) lapply(
                li, function(i) DF[i, j]))
        . },
    .translateRawParsedFieldDescriptors=function(.) {
        .$FIELD.DESCRIPTORS <- lapply(
            .$.FIELD.DESCRIPTORS.RAW.PARSED,
            function(X) list(
                NAME=intToUtf8(as.integer(X[[1]])),
                TYPE =intToUtf8(as.integer(X[[2]])),
                X[[3]],
                LENGTH=as.integer(X[[4]]),
                DECIMAL=as.integer(X[[5]]),
                X[[6]],
                X[[7]],
                X[[8]],
                FLAG=as.integer(X[[9]]) ) )
        . },
    .compileFieldLengths=function(.) {
        .$FIELD.LENGTHS <- vapply(
            .$FIELD.DESCRIPTORS, function(X) X$LENGTH, 1L)
        i <- Reduce(sum, .$FIELD.LENGTHS, accumulate=T)
        .$FIELD.LAYOUT <- rbind(  c(1L, i[-length(i)] + 1L), i  )
        .$FIELD.NAMES <-  vapply(
            .$FIELD.DESCRIPTORS, function(X) X$NAME, "")
        . },
    .compileFieldTypes=function(.) {
        .$FIELD.TYPES <- vapply(
            .$FIELD.DESCRIPTORS, function(X) X$TYPE, "")
        . },
    init=function(., description) {
        . <- .$.init(., description)
        . <- .$.readHead(.)
        . <- .$.parseHead(.)
        . <- .$.parsedHeadInterpret(.)
        . <- .$.computeNumberOfFields(.)
        . <- .$.readRawFieldDescriptors(.)
        . <- .$.parseRawFieldDescriptors(.)
        . <- .$.translateRawParsedFieldDescriptors(.)
        . <- .$.compileFieldLengths(.)
        . <- .$.compileFieldTypes(.)
        .
    },
    info=function(.)
            list(
                DESCRIPTORS=list(
                    RAW.PARSED=.$.FIELD.DESCRIPTORS.RAW.PARSED,
                    DESCRIPTORS=.$FIELD.DESCRIPTORS,
                    RAW=.$.FIELD.DESCRIPTORS.RAW),

                HEAD=list(
                    HEAD.PARSED=.$.HEAD.PARSED,
                    HEAD=.$.HEAD),

                FIELDS=data.frame(
                    stringsAsFactors=F,
                    NAME=.$FIELD.NAMES,
                    TYPE=.$FIELD.TYPES,
                    LENGTH=.$FIELD.LENGTHS,
                    `colnames<-`(t(.$FIELD.LAYOUT), c("FIRST", "LAST"))),

                SIZE=c(
                    NRECORDS=.$NRECORDS,
                    RECSIZE=.$RECSIZE,
                    HEADSIZE=.$HEADSIZE,
                    NFIELDS=.$NFIELDS)),
    readRawSequentialRecords=function(., i) {
        f <- file(.$.FILENAME, "rb")
            seek(f, .$HEADSIZE + (i[1] - 1) * .$RECSIZE + 1)
            .$RECENT <- vapply(i, USE.NAMES=F, FUN.VALUE=raw(.$RECSIZE), FUN=
                function(k) readBin(f, raw(), .$RECSIZE))
        close(f)
        . },
    parseRawRecords=function(.) {
        DF <- as.data.frame(.$RECENT, optional=T)
        II <- lapply(
            1:ncol(.$FIELD.LAYOUT),
            function(j) seq(
                .$FIELD.LAYOUT[1, j],
                .$FIELD.LAYOUT[2, j]))
        .$RECENT <- lapply(DF, function(x) lapply(
            seq_along(II), function(k) x[II[[k]]]))
        . },
    .TRANSLATION=(function() {
        as.text <- function(x) intToUtf8(as.integer(x))
        list(
            C=as.text,
            F=function(r) as.double(as.text(r)),
            L=function(r) as.text(r),
            M=function(r) as.integer(as.text(r)),
            N=function(r) as.double(as.text(r)),
            D=function(r) {
                WORD <- as.text(r)
                start <- c(1, 5, 7)
                stop  <- c(4, 6, 8)
                Text <- vapply(1:3, FUN.VALUE="", FUN=
                    function(i) substr(WORD, start[i], stop[i]))
                Arg <- paste0(Text[1], "-", Text[2], "-", Text[3])
                tryCatch(as.Date(Arg), error=function(e) NA)
            },
            .NULL=NULL)
    })(),
    translateRecords=function(.) {
        .$RECENT <- lapply(
            .$RECENT, function(X) lapply(
                seq_along(X),
                function(i) {
                    .$.TRANSLATION[[.$FIELD.TYPES[i]]](X[[i]])
                }
            )
        )
        . },
    loadSequentialRecords=function(., i) {
        . <- .$readRawSequentialRecords(., i)
        . <- .$parseRawRecords(.)
        . <- .$translateRecords(.)
        .
    },
    .NULL=NULL )
