#' @export
universals::estimates

#' @inherit universals::estimates
#' @inheritParams params
#' @param ... Additional arguments passed to fun.
#' @export
#' @examples
#' estimates(nlist(x = 1:9))
#' estimates(nlist(y = 3:5, zz = matrix(1:9, 3)))
estimates.nlist <- function(x, fun = median, ...) {
  if (missing(fun)) {
    return(x)
  }
  if (!length(x)) {
    return(x)
  }
  x <- nlists(x)
  estimates(x, fun = fun, ...)
}

#' @inherit universals::estimates
#' @inheritParams params
#' @param ... Additional arguments passed to fun.
#' @export
#' @examples
#' estimates(nlists(nlist(x = 1:3), nlist(x = 2:4)), fun = mean)
estimates.nlists <- function(x, fun = median, ...) {
  chk_function(fun)
  x <- transpose(x)
  x <- lapply(x, aggregate_atomic_numerics, fun, ...)
  as_nlist(x)
}
