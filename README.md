# neatOveRse

Simple. GIS. Tools.

## Brief Contents
- LICENCE (with a C): the `curry` function is licensed thereunder.
- LICENSE (with and S): as of 2019-10-18, all content not licensed under LICENCE (with a C) is licensed under LUCENSE (with an S).
- tarballs (.tar.gz files): R package tarballs
- R code (.R files): copies of the R code found in the tarballs, repeated for easy browsing.
- Issues previously mentioned in this README have been moved to the Issues tracker.

## Example Installation

    install.packages(pkgs="PATH/neatoCurry-0.0-0.tar.gz", lib=LIB, repos=NULL, method="internal", type="source", verbose=T)

where `PATH` is the path to the downloaded, compressed, package source and `LIB` is directory where the package is to be installed. See `help(install.packages)` for more information.

## Example "library" Call

    library(package="neatoCurrySBOP", lib=LIB, character.only=T)

## Naming Scheme

R source files contain the following elements: the prefix `neato` followed by a four-digit, big-endian hex code, followed by words that describe file content. The hex code may be interpreted as a [two's complement signed integer](https://en.wikipedia.org/wiki/Two's_complement) (`FFFF` --> -1, `0000` --> 0, `0001` --> 1). Code in a file with a certain hex code number depends upon code located in one or more of the files having a lower hex code number. For example, a file with a `0000` code depends on another file with an `FFFF` code.

## Versioning Scheme

The project as a whole does not have versions. The intended use is to mix and match the components needed for specific applications.

I will try to stick to the following versioning sheme:

### Sequential Versioning

A version identifier takes the form `n.m-k`, where `n`, `m`, and `k` are positive integers in standard form. The first few values are 0, 1, 2,... , 9, 10, 11,...

Versions with different `n`-values are likely incompatible in some way. A version with greater `n` than another is better in some subjective way.

Versions with same `n` but different `m`: The higher-`m` version is a superset of the lower-`m` version. Components may have been added;  _optional_ arguments may have been added to functions; functions may have been extended to handle a wider variety of inputs.

Versions with same `n` and `m`, but different `k`: The higher-`k` is the result of a bug-fix. Otherwise, no new features.

THERE IS NO INTENTION OF CARRYING UNDOCUMENTED FEATURES (E.G., USEFUL BUGS) INTO MORE "ADVANCED" VERSIONS.

### Branching Versions

A branch is indicated with a letter or letters. For example, Version `0A.0-0` would be a branch of version `0.0-0`. A branch of a branch might be indicated as, for example, version `0BUSHclintonBUSH.0-0` might be a brangh of `0BUSHclinton.0-0` (alternating case allows for multi-character branch names to be distinguished).

### curry

- I almost never use `curry` directly, but rather through the _special binary operators_ (hence SBOP) `%<=%`, etc.
