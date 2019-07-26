#' Number of Simulations
#'
#' Gets the number of simulations.
#'
#' @param x The object
#' @param ... Unused.
#' @return A count of the number of simulations.
#' @export
#' @examples
#' nsims(nlists(nlist(x = 1), nlist(x = 4)))
nsims <- function(x, ...) UseMethod("nsims")

#' @describeIn nsims Number of simulations of an nlist object
#' 
#' Always 1L.
#' @export
nsims.nlist <- function(x, ...) 1L

#' @describeIn nsims Number of simulations of an nlists object
#' @export
nsims.nlists <- function(x, ...) {
  length(x)
}
