aggregate_atomic_numeric <- function(x, FUN, ...) {
  x <- FUN(x, ...)
  if(!identical(length(x), 1L))
    err("function FUN must return a scalar")
  x
}

aggregate_atomic_numerics <- function(x, FUN, ...) {
  if(!length(x)) return(x)
  dims <- dims(x[[1]])
  ndims <- length(dims)
  x <- abind(x, along = ndims + 1L)
  x <- apply(x, MARGIN = 1:ndims, FUN = FUN, ...)
  if(!identical(dims(x), dims)) err("function FUN must return a scalar")
  x
}

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
aggregate.nlists <- function(x, FUN = mean, ...) {
  check_nlists(x)
  check_function(FUN)
  if(!length(x)) return(x)

  x <- purrr::transpose(x)
  x <- lapply(x, aggregate_atomic_numerics, FUN, ...)
  as.nlist(x)
}
