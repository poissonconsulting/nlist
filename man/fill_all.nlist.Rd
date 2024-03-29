% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fill-all.R
\name{fill_all.nlist}
\alias{fill_all.nlist}
\title{Fill All Values}
\usage{
\method{fill_all}{nlist}(x, value = 0L, nas = TRUE, ...)
}
\arguments{
\item{x}{An object.}

\item{value}{A scalar of the value to replace values with.}

\item{nas}{A flag specifying whether to also fill missing values.}

\item{...}{Other arguments passed to methods.}
}
\value{
The modified object.
}
\description{
Fills all of an object's (missing and non-missing) values
while preserving the object's dimensionality and class.
}
\details{
It should only be defined for objects with values of consistent class ie
not standard data.frames.
}
\section{Methods (by class)}{

\itemize{
\item \code{fill_all(logical)}: Fill All for logical Objects

\item \code{fill_all(integer)}: Fill All for integer Objects

\item \code{fill_all(numeric)}: Fill All for numeric Objects

\item \code{fill_all(character)}: Fill All for character Objects

}
}

\examples{
fill_all(nlist(x = c(2, NA), y = matrix(c(1:3, NA), nrow = 2)))
fill_all(nlist(x = c(2, NA), y = matrix(c(1:3, NA), nrow = 2)), nas = FALSE)
}
\seealso{
Other fill: 
\code{\link[extras]{fill_na}()}
}
