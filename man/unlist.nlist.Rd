% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/unlist-nlist.R
\name{unlist.nlist}
\alias{unlist.nlist}
\title{Flatten nlist Object}
\usage{
\method{unlist}{nlist}(x, recursive = TRUE, use.names = TRUE)
}
\arguments{
\item{x}{An nlist object.}

\item{recursive}{Ignored.}

\item{use.names}{A flag specifying whether to preserve names.}
}
\value{
A named numeric vector of the values in x.
}
\description{
Flatten nlist Object
}
\examples{
unlist(nlist(y = 2, x = matrix(4:7, ncol = 2)))
}
\seealso{
\code{\link[=unlist_nlist]{unlist_nlist()}}
}
