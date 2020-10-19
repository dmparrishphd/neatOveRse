# Installing the R Package Tarballs

Package tarballs are
[here](https://github.com/dmparrishphd/neatOveRse/tree/master/Files/1/0).

Suggestion: Don't use them. [Why not?](https://github.com/dmparrishphd/tRivia/blob/master/Files/3/0/protopackages.md)

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

    library(package="neatoCurry", lib=LIB, character.only=T)
    
