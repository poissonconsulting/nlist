#' @export
coda::thin

#' Thin MCMC Object
#'
#' Thins an MCMC object's iterations.
#'
#' @inheritParams params
#' @return The thinned MCMC object.
#' @export
#' @examples
#' thin(nlists(nlist(x = 1), nlist(x = 2), nlist(x = 3), nlist(x = 4)), nthin = 2)
thin.default <- function(x, nthin = 1L, ...) {
  chk_whole_number(nthin)
  chk_gte(nthin, 1)
  chk_unused(...)

  iters <- seq(1L, niters(x), by = nthin)
  subset(x, iters = iters)
}
