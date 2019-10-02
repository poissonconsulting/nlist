#' Number of MCMC Iterations
#'
#' Gets the number of MCMC iterations (in a chain).
#'
#' @param x The object
#' @param ... Unused.
#' @return A count indicating the number of MCMC iterations.
#' @export
#' @examples
#' niters(nlist(x = 1:2))
#' niters(nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7))))
niters <- function(x, ...) {
  UseMethod("niters")
}

#' @describeIn niters Number of MCMC iterations for an nlist object
#'
#' Always 1.
#' @export
niters.nlist <- function(x, ...) 1L

#' @describeIn niters Number of MCMC iterations for an nlists object
#'
#' @export
niters.nlists <- function(x, ...) as.integer(nsims(x) / nchains(x))
