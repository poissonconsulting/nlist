#' Number of Simulations
#'
#' Gets the number of simulations.
#'
#' @param x The object
#' @param ... Unused.
#' @export
#' @examples
#' nsims(nlists(nlist(x = 1), nlist(x = 4)))
nsims <- function(x, ...) UseMethod("nsims")

#' @export
nsims.nlist <- function(x, ...) 1L

#' @export
nsims.nlists <- function(x, ...) {
  length(x)
}
