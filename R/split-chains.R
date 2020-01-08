#' Split Chains
#'
#' Splits each chain in half to double the number chains and halve
#' the number of iterations.
#'
#' @param x An MCMC object.
#' @param ... Unused.
#' @export
split_chains <- function(x, ...) {
  UseMethod("split_chains")
}

#' @describeIn split_chains Split chains for an [nlists_object()].
#' @export
split_chains.nlists <- function(x, ...) {
  nchains <- nchains(x)
  niters <- niters(x)
  n <- floor(niters / 2L)

  if (n == 0) err("`x` must have at least two iterations.")

  if (n < niters / 2L) {
    x <- x[-seq(niters, niters * nchains, by = niters)]
  }

  attr(x, "nchains") <- nchains * 2L
  x
}
