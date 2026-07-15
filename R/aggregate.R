#' @export
stats::aggregate

#' Aggregate nlist
#'
#' \lifecycle{defunct}
#'
#' Replace by [estimates.nlist()].
#'
#' @inheritParams params
#' @param x An nlist object.
#' @param ... Additional arguments passed to fun.
#'
#' @return An named list of numeric scalars
#' @family aggregate
#' @export
aggregate.nlist <- function(x, fun = mean, ...) {
  deprecate_stop(
    "0.1.1",
    what = "nlist::aggregate.nlist()",
    with = "nlist::estimates.nlist()"
  )
}

#' Aggregate nlists
#'
#' \lifecycle{defunct}
#'
#' Replace by [estimates.nlists()].
#'
#' @inheritParams params
#' @return An nlist object if `by_chain = FALSE` otherwise an nlists object.
#' @family aggregate
#' @export
aggregate.nlists <- function(x, fun = mean, ..., by_chain = FALSE) {
  deprecate_stop(
    "0.1.1",
    what = "nlist::aggregate.nlists()",
    with = "nlist::estimates.nlists()"
  )
}
