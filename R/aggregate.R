#' Aggregate nlist
#'
#' Aggregates an [nlist_object()] into a named list of numeric scalars.
#'
#' @param x An nlist object.
#' @param fun A function that given a numeric vector returns a numeric scalar.
#' @param ... Additional arguments passed to fun.
#'
#' @return An named list of numeric scalars
#' @export
#'
#' @examples
#' aggregate(nlist(x = 1:9))
#' aggregate(nlist(y = 3:5, zz = matrix(1:9, 3)), fun = function(x) x[1])
aggregate.nlist <- function(x, fun = mean, ...) {
  lapply(x, aggregate_atomic_numeric, fun, ...)
}

#' Aggregate nlists
#'
#' Aggregates an [nlists_object()] into a [nlist_object()]
#' or by_chain = TRUE an [nlists_object()]
#' with `nchains` [nlist_object()]s.
#'
#' @inheritParams aggregate.nlist
#' @param fun A function that given a numeric vector returns a numeric scalar.
#' @param by_chain A flag specifying whether to aggregate by chains.
#' @return An nlist object if `by_chain = FALSE` otherwise an nlists object.
#' @export
#'
#' @examples
#' aggregate(nlists(nlist(x = 1:3), nlist(x = 2:4)))
aggregate.nlists <- function(x, fun = mean, ..., by_chain = FALSE) {
  chk_function(fun)
  chk_flag(by_chain)
  if (!by_chain) {
    x <- transpose(x)
    x <- lapply(x, aggregate_atomic_numerics, fun, ...)
    return(as.nlist(x))
  }
  nchains <- nchains(x)
  x <- split_by_chains(x)
  x <- lapply(x, FUN = aggregate, fun = fun, ..., by_chain = FALSE)
  names(x) <- NULL
  class(x) <- "nlists"
  if (nchains > 1L) attr(x, "nchains") <- nchains
  x
}
