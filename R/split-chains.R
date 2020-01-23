#' @export
universals::split_chains

#' @inherit universals::split_chains
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
