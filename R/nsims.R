#' Number of MCMC Simulations
#'
#' Gets the number of MCMC simulations (iterations * chains)
#'
#' @param x The object
#' @param ... Unused.
#' @return A count of the number of simulations.
#' @seealso [niters()] and [nchains()]
#' @export
#' @examples
#' nsims(nlist(x = 1:2))
#' nsims(nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7))))
#' nsims(split_chains(nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7)))))
nsims <- function(x, ...) UseMethod("nsims")

#' @describeIn nsims Number of simulations of an nlist object
#'
#' Always 1L.
#' @export
nsims.nlist <- function(x, ...) 1L

#' @describeIn nsims Number of simulations of an nlists object
#' @export
nsims.nlists <- function(x, ...) length(x)
