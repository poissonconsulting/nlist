aggregate_atomic_numeric <- function(x, FUN, ...) {
  x <- FUN(x, ...)
  if(!identical(length(x), 1L))
    err("`fun` must return a scalar.")
  x
}

aggregate_atomic_numerics <- function(x, fun, ...) {
  dims <- dims(x[[1]])
  ndims <- length(dims)
  x <- abind(x, along = ndims + 1L)
  x <- apply(x, MARGIN = 1:ndims, FUN = fun, ...)
  if(!identical(dims(x), dims)) err("`fun` must return a scalar.")
  x
}

typesof <- function(x) vapply(x, typeof, "")

split_by_chains <- function(x) split(x, ceiling(seq_along(x)/niters(x)))
