# PKG.SOURCE.DIR: PATH TO SUBDIRECTORY OF DOWNLOADED REPOSITORY AND PACKAGES
# SUBDIRS: PATHS TO PACKAGES UNDER PKG.SOURCE.DIR, **** IN ORDER OF INSTALLATION ****
# LIB: WILL INSTALL HERE
installLoadAndAttach <- function(
    PKG.SOURCE.DIR="~Downloads/neatOveRse-master/Pkgs/",
    SUBDIRS=strsplit("0 1/0 2/0 3/0 4/0 5/0 6/0", " ")[[1]],
    LIB="~/Code/R/TempLib")
{
    DESCRIPTIONS <- paste0(SUBDIRS, "/DESCRIPTION")

    PKG.NAMES <- vapply(FUN.VALUE="", USE.NAMES=F,
        vapply(FUN.VALUE="", USE.NAMES=F,
            lapply(paste0(PKG.SOURCE.DIR, DESCRIPTIONS), function(x) scan(x, what="", sep="\n")),
            function(x) grep("^Package:", x, value=T)),
        function(x) Filter(nchar, trimws(strsplit(x, "Package:")[[1]])))

    for (i in seq_along(PKG.NAMES)) {

        PKG.SUBDIR <- SUBDIRS[i]

        LIBRARY.PACKAGE.NAME <- PKG.NAMES[i]

        install.packages(
            pkgs=paste0(PKG.SOURCE.DIR, PKG.SUBDIR),
            lib=LIB,
            repos=NULL,
            method="internal",
            type="source",
            verbose=T)

        library(
            package=LIBRARY.PACKAGE.NAME,
            lib=LIB,
            character.only=T,
            verbose=T)
    }
}
