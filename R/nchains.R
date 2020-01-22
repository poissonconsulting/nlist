#' @importFrom universals nchains
#' @export
universals::nchains

#' Number of MCMC Chains of a nlist Object
#'
#' Gets the number of chains of an nlist object.
#' 
#' Always 1L.
#'
#' @inherit universals::nterms
#' @export
#'
#' @examples
#' nchains(nlist(x = 1:2))
nchains.nlist <- function(x, ...) 1L

#' Number of MCMC Chains of a nlists Object
#'
#' Gets the number of chains of an nlists object.
#'
#' @inherit universals::nterms
#' @export
#' 
#' @examples 
#' nchains(nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7))))
#' nchains(split_chains(nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7)))))
nchains.nlists <- function(x, ...) {
  nchains <- attr(x, "nchains")
  if (is.null(nchains)) {
    return(1L)
  }
  nchains
}
