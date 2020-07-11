aggregate_atomic_numeric <- function(x, FUN, ...) {
  x <- FUN(x, ...)
  if (!identical(length(x), 1L)) {
    abort_chk("`fun` must return a scalar.")
  }
  x
}

aggregate_atomic_numerics <- function(x, fun, ...) {
  dims <- dims(x[[1]])
  ndims <- length(dims)
  x <- abind(x, along = ndims + 1L)
  x <- apply(x, MARGIN = 1:ndims, FUN = fun, ...)
  if (!identical(dims(x), dims)) abort_chk("`fun` must return a scalar.")
  x
}

typesof <- function(x) vapply(x, typeof, "")

split_by_chains <- function(x) split(x, ceiling(seq_along(x) / niters(x)))

lapply_nlists <- function(x, FUN, ...) {
  nchains <- nchains(x)
  x <- lapply(x, FUN = FUN, ...)
  class(x) <- "nlists"
  if (nchains > 1L) attr(x, "nchains") <- nchains
  x
}

set_dim <- function(x, value) {
  dim(x) <- value
  if (length(value) == 1L) dim(x) <- NULL
  x
}

set_class <- function(x, class) {
  class(x) <- class
  x
}
