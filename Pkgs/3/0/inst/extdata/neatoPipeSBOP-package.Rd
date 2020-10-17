\name{neatoPipeSBOP-package}

\alias{neatoPipeSBOP-package}
\alias{neatoPipeSBOP}
\alias{\%|\%}
\alias{\%:|\%}
\alias{\%||\%}
\alias{\%:||\%}

\docType{package}

\title{
    \packageTitle{neatoPipeSBOP}
}

\description{
    \packageDescription{neatoPipeSBOP}
}

\details{

    \packageDESCRIPTION{neatoPipeSBOP}

    \packageIndices{neatoPipeSBOP}

    The special binary operators defined in this package allow
    function calls without the use of grouping symbols
    \code{()}.  Thus, it begins to be possible to write code
    that flows from left to right, rather than in and out of
    nests of grouping symbols.

}

\author{

    \packageAuthor{neatoPipeSBOP}

    Maintainer: \packageMaintainer{neatoPipeSBOP}
}

\keyword{ package }

\examples{
\code{1 \%|\% `-`}
\code{`-` \%:|\% 1}
\code{list(1, 2) \%||\% rbind}
\code{rbind \%:||\% list(1, 2)}
}
