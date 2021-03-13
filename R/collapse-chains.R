#' @export
universals::collapse_chains

#' @inherit universals::collapse_chains
#' @details
#' As mcmc objects can only have 1 chain the object is unchanged.
#' @family collapse
#' @export
#'
#' @examples
#' collapse_chains(as_mcmc(nlist(x = 2)))
collapse_chains.mcmc <- function(x, ...) x

#' @inherit universals::collapse_chains
#' @export
collapse_chains.mcmc.list <- function(x, ...) {
  as.mcmc.list(Reduce(bind_iterations, x))
}

#' @inherit universals::collapse_chains
#' @details
#' As nlist objects can only have 1 chain the object is unchanged.
#' @family collapse
#' @export
#'
#' @examples
#' collapse_chains(nlist(x = 2))
collapse_chains.nlist <- function(x, ...) {
  x
}

#' @inherit universals::collapse_chains
#' @family collapse
#' @export
#'
#' @examples
#' collapse_chains(nlist(x = 2))
#' @export
collapse_chains.nlists <- function(x, ...) {
  attr(x, "nchains") <- NULL
  x
}
