#' @export
universals::collapse_chains

#' @inherit universals::collapse_chains
#' @details
#' As nlist objects can only have 1 chain the object is unchanged.
#' @export
#'
#' @examples
#' collapse_chains(nlist(x = 2))
collapse_chains.nlist <- function(x, ...) {
  x
}

#' @inherit universals::collapse_chains
#' @export
#'
#' @examples
#' collapse_chains(nlist(x = 2))
#' @export
collapse_chains.nlists <- function(x, ...) {
  attr(x, "nchains") <- NULL
  x
}
