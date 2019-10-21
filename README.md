# neatOveRse

Simple. GIS. Tools.

## Why Are there Two Licence / License Files?

They `curry` function is licensed under LICENCE (with a C). All other content (as of 2019-10-18) under LICENSE (with and S).

## Example Installation

    install.packages(pkgs="PATH/neatoCurry-0.0-0.tar.gz", lib=LIB, repos=NULL, method="internal", type="source", verbose=T)

where `PATH` is the path to the downloaded, compressed, package source and `LIB` is directory where the package is to be installed. See `help(install.packages)` for more information.

## Example "library" Call

    library(package="neatoCurrySBOP", lib=LIB, character.only=T)

## Notes

- The tarballs (.tar.gz files) are R package tarballs. The R code posted here for easy browsing are copies of the R code therein.

### Naming scheme

R source files contain the following elements: the prefix `neato` followed by a four-digit, big-endian hex code, followed by words that describe file content. The hex code may be interpreted as a [two's complement signed integer](https://en.wikipedia.org/wiki/Two's_complement) (`FFFF` --> -1, `0000` --> 0, `0001` --> 1). Code in a file with a certain hex code number depends upon code located in one or more of the files having a lower hex code number. For example, a file with a `0000` code depends on another file with an `FFFF` code.

### curry

- I almost never use `curry` directly, but rather through the _special binary operators_ (hence SBOP) `%<=%`, etc.

## Known Issues

### neatoCurrySBOP_0.0-1.tar.gz

- Build failed with `R CMD build` due to "dependency __ is not available." The tarball was created with [7zip](https://www.7-zip.org/) instead. As a result (apparently), the package is not as full-featured (help is somewhat lacking) as it might be.

### neatoCurry-0.0-0.tar.gz
- Generation of help files during installlation results in partially corrupt help files. The HTML files may be read externally, however.
- During testing (using documented examples), intermitently received error `In fetch(key) : internal error -3 in R_decompress1`. The correct returns were produced, however.

