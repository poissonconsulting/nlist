#' Aggregate nlist
#' 
#' Aggregates an nlist into a named list of numeric scalars.
#'
#' @param x An R object.
#' @param FUN A function that given a numeric vector returns a numeric scalar.
#' @param ... Additional arguments passed to FUN.
#'
#' @return An named list of numeric scalars
#' @export
#' @examples
#' aggregate(nlist(x = 1:9))
aggregate.nlist <- function(x, FUN = mean, ...) {
  check_nlist(x)
  check_function(FUN)

  lapply(x, aggregate_atomic_numeric, FUN, ...)
}

#' Aggregate nlists
#' 
#' Aggregates an nlists into an nlist
#'
#' @inheritParams aggregate.nlist
#'
#' @return An nlist
#' @export
#' @examples
#' aggregate(nlists(nlist(x = 1:3), nlist(x = 2:4)))
aggregate.nlists <- function(x, FUN = mean, ...) {
  check_nlists(x)
  check_function(FUN)

  x <- transpose(x)
  x <- lapply(x, aggregate_atomic_numerics, FUN, ...)
  as.nlist(x)
}
