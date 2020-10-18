# Installing from Open-Packages

You should be able to use something a lot like the following to install and attach the open packages.
The order of installation should respect imports and depends
(see the DESCRIPTION and NAMESPACE files of the package[s] in question).

    # WILL INSTALL HERE
    LIB <- "~/Code/R/TempLib"

    # PATH TO SUBDIRECTORY OF DOWNLOADED REPOSITORY AND PACKAGE
    PKG.SOURCE.DIR <- "~/Downloads/neatOveRse-master/Pkgs/3/"

    # SUBDIRECTORY CONTAINING A SINGLE PACKAGE
    PKG.SUBDIR <- "0"

    # PACKAGE NAME OF PACKAGE FOUND AT paste0(PKG.SOURCE.DIR, PKG.SUBDIR)
    LIBRARY.PACKAGE.NAME <- "neatoPipeSBOP"

    install.packages(
        pkgs=	,
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
