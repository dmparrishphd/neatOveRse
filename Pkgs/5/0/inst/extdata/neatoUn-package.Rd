\name{neatoUn-package}

\alias{neatoUn-package}
\alias{neatoUn}
\alias{un}

\docType{package}

\title{
    \packageTitle{neatoFunProgA}
}
\description{
    \packageDescription{neatoFunProgA}
}
\details{
    \code{un} returns a modified version of a function. The
    modified version returns the logical opposite of the
    original. The return of the modified version is a logical
    vector.
}
\author{
    \packageAuthor{neatoFunProgA}

    Maintainer: \packageMaintainer{neatoFunProgA}
}
\keyword{ package }

\examples{
isnot.null <- un(is.null)
isnot.null(NULL)
isnot.null(1)
}
