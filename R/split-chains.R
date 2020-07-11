#' @export
universals::split_chains

#' @inherit universals::split_chains
#' @export
#' @examples 
#' nlists <- nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7)))
#' nchains(nlists)
#' nchains(split_chains(nlists))
split_chains.nlists <- function(x, ...) {
  nchains <- nchains(x)
  niters <- niters(x)
  n <- floor(niters / 2L)

  if (n == 0) abort_chk("`x` must have at least two iterations.")

  if (n < niters / 2L) {
    x <- x[-seq(niters, niters * nchains, by = niters)]
  }

  attr(x, "nchains") <- nchains * 2L
  x
}
