\name{neatoCurrySBOP-package}

\alias{neatoCurrySBOP-package}
\alias{neatoCurrySBOP}
\alias{\%<=\%}
\alias{\%=>\%}

\docType{package}

\title{ \packageTitle{neatoCurrySBOP} }

\description{ \packageDescription{neatoCurrySBOP} }

\details{

    \packageDESCRIPTION{neatoCurrySBOP}

    \packageIndices{neatoCurrySBOP}

    The special binary operators \code{\%=>\%} and \code{\%<=\%}
    curry single arguments or lists of arguments into a function.

    The difference between \code{\%=>\%} and \code{\%<=\%}
    is the order of the items on either side of the operator.
}

\author{

    \packageAuthor{neatoCurrySBOP}

    Maintainer: \packageMaintainer{neatoCurrySBOP}
}

\keyword{ package }

\examples{
add1 <- `+` \%<=\% 1L # equivalent to lcurry(`+`, 1L)
add1(41)
less1 <- -1L \%=>\% `+` # equivalent to lcurry(`+`, -1L)
less1(43)
data_frame <- data.frame \%<=\% list(stringsAsFactors=FALSE) # equivalent to lcurry(data.frame, stringsAsFactor=FALSE)
str(data_frame("AS YOU WISH!"))
str(data.frame("AS YOU WISH?"))
matrixByRow <- list(byrow=TRUE) \%<=\% matrix # equivalent to lcurry(matrix, byrow=TRUE)
}

