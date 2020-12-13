\name{neatoLcurry2SBOP-package}

\alias{neatoLcurry2SBOP-package}
\alias{neatoLcurry2SBOP}
\alias{\%<=2\%}
\alias{\%2=>\%}

\docType{package}

\title{ \packageTitle{neatoLcurry2SBOP} }

\description{ \packageDescription{neatoLcurry2SBOP} }

\details{

    \packageDESCRIPTION{neatoLcurry2SBOP}

    \packageIndices{neatoLcurry2SBOP}

    The special binary operators \code{\%2=>\%} and \code{\%<=2\%}
    curry single arguments into the second parameter of a
    function.

    The difference between \code{\%2=>\%} and \code{\%<=2\%}
    is the order of the items on either side of the operator.
}

\author{

    \packageAuthor{neatoLcurry2SBOP}

    Maintainer: \packageMaintainer{neatoLcurry2SBOP}
}

\keyword{ package }

\examples{
sub1 <- `-` \%<=2\% 1L
sub1(43)
}

