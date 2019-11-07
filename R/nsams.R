#' Number of MCMC Samples
#'
#' Gets the number of MCMC samples (simulations * terms)
#' @param x The R object.
#' @param ... Unused.
#' @return A count of the total number of sample values.
#' @export
#' @seealso [nsims()] and [nterms()]
#' @examples
#' nsams(nlist(x = 2))
#' nsams(nlist(x = 1:2))
#' nsams(nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7))))
nsams <- function(x, ...) UseMethod("nsams")

#' @describeIn nsams Number of sample values of default object
#' @export
nsams.default <- function(x, ...) {
  nsims(x) * nterms(x)
}
