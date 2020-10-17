# Installing the R Packages

## Example Installation

    install.packages(
        pkgs="PATH/neatoCurry-0.0-0.tar.gz",
        lib=LIB,
        repos=NULL,
        method="internal",
        type="source",
        verbose=T)

where `PATH` is the path to the downloaded, compressed, package source and `LIB` is directory where the package is to be installed. See `help(install.packages)` for more information.

## Example "library" Call

    library(package="neatoCurrySBOP", lib=LIB, character.only=T)

