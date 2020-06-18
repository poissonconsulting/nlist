#' Number of MCMC chains
#'
#' Gets the number of chains of an MCMC object.
#'
#' @param x An MCMC object
#' @param ... Unused
#' @return A count indicating the number of MCMC chains
#' @export
#'
#' @examples
#' nchains(nlist(x = 1:2))
#' nchains(nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7))))
#' nchains(split_chains(nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7)))))
nchains <- function(x, ...) {
  UseMethod("nchains")
}

#' @describeIn nchains Number of chains of an nlists_object.
#'
#' Always 1L.
#' @export
nchains.nlist <- function(x, ...) 1L

#' @describeIn nchains Number of chains of an nlists_object.
#' @export
nchains.nlists <- function(x, ...) {
  nchains <- attr(x, "nchains")
  if (is.null(nchains)) {
    return(1L)
  }
  nchains
}
