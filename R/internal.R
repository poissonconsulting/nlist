aggregate_atomic_numeric <- function(x, FUN, ...) {
  x <- FUN(x, ...)
  if(!identical(length(x), 1L))
    err("function FUN must return a scalar")
  x
}

aggregate_atomic_numerics <- function(x, FUN, ...) {
  dims <- dims(x[[1]])
  ndims <- length(dims)
  x <- abind(x, along = ndims + 1L)
  x <- apply(x, MARGIN = 1:ndims, FUN = FUN, ...)
  if(!identical(dims(x), dims)) err("function FUN must return a scalar")
  x
}

typesof <- function(x) vapply(x, typeof, "")

tibble <- function(...) {
  data <- data.frame(..., stringsAsFactors = FALSE)
  class(data) <- c("tbl_df", "tbl", "data.frame")
  data
}
