\name{neatoComposeSBOP-package}

\alias{neatoComposeSBOP-package}
\alias{neatoComposeSBOP}
\alias{\%O\%}
\alias{\%:O\%}

\docType{package}

\title{
    \packageTitle{neatoComposeSBOP}
}

\description{
    \packageDescription{neatoComposeSBOP}
}

\details{

    The special binary operators \code{\%O\%} and \code{\%:O\%}
    compose two functions into one.  The difference between
    \code{\%O\%} and \code{\%:O\%} is the order of the items on
    either side of the operator.
}

\author{
    \packageAuthor{neatoComposeSBOP}

    Maintainer: \packageMaintainer{neatoComposeSBOP}
}

\keyword{ package }

\examples{
sqr <- function(x) x * x
ssq1 <- sqr  %O% sum
ssq2 <- sum %:O% sqr
ssq1(1:5)
ssq2(1:5)
}
