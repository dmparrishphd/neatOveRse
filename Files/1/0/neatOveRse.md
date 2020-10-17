# About NeatOveRse

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

A branch is indicated with a letter or letters. For example, Version `0A.0-0` would be a branch of version `0.0-0`. A branch of a branch might be indicated as, for example, version `0BUSHclintonBUSH.0-0` might be a branch of `0BUSHclinton.0-0` (alternating case allows for multi-character branch names to be distinguished).
