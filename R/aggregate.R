#' @export
stats::aggregate

#' Aggregate nlist
#'
#' Aggregates an [nlist_object()] into a named list of numeric scalars.
#'
#' @inheritParams params
#' @param x An nlist object.
#' @param ... Additional arguments passed to fun.
#'
#' @return An named list of numeric scalars
#' @family aggregate
#' @export
#' @examples
#' aggregate(nlist(x = 1:9))
#' aggregate(nlist(y = 3:5, zz = matrix(1:9, 3)), fun = function(x) x[1])
aggregate.nlist <- function(x, fun = mean, ...) {
  deprecate_soft("0.1.1",
    what = "nlist::aggregate.nlist()",
    with = "nlist::estimates.nlist()"
  )
  lapply(x, aggregate_atomic_numeric, fun, ...)
}

#' Aggregate nlists
#'
#' Aggregates an [nlists_object()] into a [nlist_object()]
#' or by_chain = TRUE an [nlists_object()]
#' with `nchains` [nlist_object()]s.
#'
#' @inheritParams params
#' @return An nlist object if `by_chain = FALSE` otherwise an nlists object.
#' @family aggregate
#' @export
#'
#' @examples
#' aggregate(nlists(nlist(x = 1:3), nlist(x = 2:4)))
aggregate.nlists <- function(x, fun = mean, ..., by_chain = FALSE) {
  deprecate_soft("0.1.1",
    what = "nlist::aggregate.nlists()",
    with = "nlist::estimates.nlists()"
  )
  chk_function(fun)
  chk_flag(by_chain)
  if (!by_chain) {
    x <- transpose(x)
    x <- lapply(x, aggregate_atomic_numerics, fun, ...)
    return(as_nlist(x))
  }
  nchains <- nchains(x)
  x <- split_by_chains(x)
  x <- lapply(x, FUN = aggregate, fun = fun, ..., by_chain = FALSE)
  names(x) <- NULL
  class(x) <- "nlists"
  if (nchains > 1L) attr(x, "nchains") <- nchains
  x
}
