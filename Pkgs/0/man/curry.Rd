\name{curry}

\alias{curry}

\title{curry}

\description{}

\usage{ curry(FUN, ...) }

\arguments{

  \item{FUN}{ a function }

  \item{\dots}{ values for actual arguments: positional and/or
                  named } }

\details{}

\value{

    A function, where the values specified by \dots have been
    removed from the argument list.

}

\references{

    Shane (2010) Compose and Curry. StackOverflow.
    https://stackoverflow.com/questions/2228544/higher-level-functions-in-r-is-there-an-official-compose-operator-or-curry-fun?noredirect=1&lq=1

}

\author{

    Aaron McDaid, adapted by D. Michael Parrish

}

\note{}

\seealso{}

\examples{
add1 <- curry(`+`, 1L)
add1(41) # returns 42
csv <- curry(cat, sep=",")
csv("AS", "YOU", "WISH"); cat("\n")
}

\keyword{ ~methods }
