# neatOveRse

Simple. GIS. Tools.

## Example Installation

    install.packages(pkgs="PATH/neatoCurry-0.0-0.tar.gz", lib=LIB, repos=NULL, method="internal", type="source",	verbose=T)

where `PATH` is the path to the downloaded, compressed, package source and `LIB` is directory where the package is to be installed. See `help(install.packages)` for more information.

## Example Library

    library(package="neatoCurry", lib=LIB, character.only=T)

## Known Issues

### neatoCurry-0.0-0.tar.gz
- Generation of help files during installlation results in partially corrupt help files. The HTML files may be read externally, however.
- During testing (using documented examples), intermitently received error `In fetch(key) : internal error -3 in R_decompress1`. The correct returns were produced, however.

