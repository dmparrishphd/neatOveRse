\name{neatoFunProgA-package}

\alias{neatoFunProgA-package}
\alias{neatoFunProgA}
\alias{argswap}
\alias{un}

\docType{package}

\title{
    \packageTitle{neatoFunProgA}
}
\description{
    \packageDescription{neatoFunProgA}
}
\details{
    \code{argswap} returns a modified version of a function of
    two or more parameters. The return is the same as the
    argument, except that the order of the first two arguments
    is reversed.
}
\author{
    \packageAuthor{neatoFunProgA}

    Maintainer: \packageMaintainer{neatoFunProgA}
}
\keyword{ package }

\examples{
negativedifference <- argswap(`-`)
negativedifference(1, 2)
`-`(1, 2)
}
