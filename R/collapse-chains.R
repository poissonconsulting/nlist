#' Collapse Chains
#'
#' Collapses an MCMC object's chains into a single chain.
#'
#' @param x An MCMC object.
#' @param ... Unused.
#' @export
collapse_chains <- function(x, ...) {
  UseMethod("collapse_chains")
}

#' @describeIn collapse_chains Collapse chains for an nlist object
#'
#' As nlist objects can only have 1 chain the object is unchanged.
#' @export
collapse_chains.nlist <- function(x, ...) {
  x
}

#' @describeIn collapse_chains Collapse chains for an nlists object
#' @export
collapse_chains.nlists <- function(x, ...) {
  attr(x, "nchains") <- NULL
  x
}
