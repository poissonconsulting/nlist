#' Number of Dimensions of an Object
#'
#' Retrieves the number of dimensions of an object as defined by dims.
#'
#' @param x An R object.
#' @param ... Unused
#' @return A vector or list of the number of dimensions.
#' @export
ndims <- function(x, ...) {
  UseMethod("ndims")
}

#' @export
ndims.default <- function(x, ...) {
  length(dims(x))
}

#' @export
ndims.data.frame <- function(x, ...) 2L

#' @export
ndims.nlist <- function(x, ...) {
  check_nlist(x)
  if(!length(x)) return(list())
  lapply(x, ndims)
}

#' @export
ndims.nlists <- function(x, ...) {
  check_nlists(x)
  if(!length(x)) return(list())
  ndims(x[[1]])
}
