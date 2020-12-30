maxdiff.m
=========

An omnidirectional `diff` for matrices.

Compute the maximum difference between matrix elements and neighbor elements.

Usage
-----

    maxdiff.m(m)
    
| Argument | Description          |
| -------: | :------------------- |
|      `m` | a `numeric` `matrix` |
    
Value
-----

A `double` `matrix` of the same dimensions as the argument.

Examples
--------

    M1 <- row(matrix(nrow=3, ncol=4))
    M2 <- col(matrix(nrow=3, ncol=4))
    M3 <- matrix(NA_real_, 3, 4)

    M1
    maxdiff.m(M1)

    M1^2
    maxdiff.m(M1^2)

    M2
    maxdiff.m(M2)

    M2^2
    maxdiff.m(M2^2)

    M3
    maxdiff.m(M3)
