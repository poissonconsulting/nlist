#' @export
universals::niters

#' @inherit universals::niters
#' @export
niters.mcmc <- function(x, ...) nrow(x)

#' @inherit universals::niters
#' @export
niters.mcmc.list <- function(x, ...) niters(x[[1]])

#' @inherit universals::niters
#' @details Always 1.
#' @export
#'
#' @examples
#' niters(nlist(x = 1:2))
niters.nlist <- function(x, ...) {
  1L
}

#' @inherit universals::niters
#' @export
#'
#' @examples
#' niters(nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7))))
niters.nlists <- function(x, ...) {
  as.integer(nsims(x) / nchains(x))
}
