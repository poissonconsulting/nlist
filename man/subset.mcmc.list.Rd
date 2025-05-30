% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subset.R
\name{subset.mcmc.list}
\alias{subset.mcmc.list}
\title{Subset mcmc.list Object}
\usage{
\method{subset}{mcmc.list}(
  x,
  chains = NULL,
  iters = NULL,
  pars = NULL,
  iterations = NULL,
  parameters = NULL,
  ...
)
}
\arguments{
\item{x}{An mcmc.list object.}

\item{chains}{An integer vector of chains.}

\item{iters}{An integer vector of iterations.}

\item{pars}{A character vector of parameter names.}

\item{iterations}{An integer vector (or NULL) of the iterations to subset by.}

\item{parameters}{A character vector (or NULL) of the parameters to subset by.}

\item{...}{Unused.}
}
\value{
An mcmc.list object.
}
\description{
Subsets an mcmc.list object by its chains, parameters and/or iterations.
}
\details{
Future versions should allow it to be reordered by its parameters.
}
\examples{
mcmc.list <- as_mcmc_list(nlists(
  nlist(beta = 1:2, theta = 1),
  nlist(beta = 3:4, theta = -1)
))
subset(mcmc.list, pars = "beta")
subset(mcmc.list, iters = c(1L, 1L))
}
