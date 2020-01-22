#' @importFrom universals niters
#' @export
universals::niters

#' Number of MCMC Iterations of an nlist Object
#'
#' Gets the number of iterations of an nlist Object.
#' 
#' Always 1.
#' @inherit universals::niters
#' @export
#' 
#' @examples
#' niters(nlist(x = 1:2))
niters.nlist <- function(x, ...) {
  1L
}

#' Number of MCMC Iterations of an nlists Object
#'
#' Gets the number of iterations of an nlists Object.
#' 
#' @inherit universals::niters
#' @export
#' 
#' @examples
#' niters(nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7))))
niters.nlists <- function(x, ...) { 
  as.integer(nsims(x) / nchains(x))
}
