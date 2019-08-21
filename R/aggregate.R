#' Aggregate nlist
#' 
#' Aggregates an \code{\link{nlist_object}} into a named list of numeric scalars.
#'
#' @param x An nlist object.
#' @param FUN A function that given a numeric vector returns a numeric scalar.
#' @param ... Additional arguments passed to FUN.
#'
#' @return An named list of numeric scalars
#' @export
#' 
#' @examples
#' aggregate(nlist(x = 1:9))
#' aggregate(nlist(y = 3:5, zz = matrix(1:9, 3)), FUN = function(x) x[1])
aggregate.nlist <- function(x, FUN = mean, ...) {
  lapply(x, aggregate_atomic_numeric, FUN, ...)
}

#' Aggregate nlists
#' 
#' Aggregates an \code{\link{nlists_object}} into a \code{\link{nlist_object}}.
#'
#' @inheritParams aggregate.nlist
#' @return An nlist object
#' @export
#' 
#' @examples
#' aggregate(nlists(nlist(x = 1:3), nlist(x = 2:4)))
aggregate.nlists <- function(x, FUN = mean, ...) {
  x <- transpose(x)
  x <- lapply(x, aggregate_atomic_numerics, FUN, ...)
  as.nlist(x)
}
