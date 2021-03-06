% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tidy.R
\name{tidy.nlists}
\alias{tidy.nlists}
\title{Turn an object into a tidy tibble}
\usage{
\method{tidy}{nlists}(x, simplify = FALSE, ...)
}
\arguments{
\item{x}{An object.}

\item{simplify}{A flag specifying whether to drop sd and zscore columns.}

\item{...}{Unused.}
}
\value{
A \code{\link[tibble:tibble]{tibble::tibble()}} with information about model components.
}
\description{
Turn an object into a tidy tibble
}
\section{Methods}{


\Sexpr[stage=render,results=rd]{generics:::methods_rd("tidy")}

}

\examples{
tidy(nlists(
  nlist(x = 1, y = 4:6),
  nlist(x = 3, y = 7:9)
), simplify = TRUE)
}
