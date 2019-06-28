#' Dimensions of an Object
#'
#' Retrieves the dimensions of an object.
#' Unlike base::dim(), dims returns a scalar corresponding to the length of
#' a vector and two values corresponding to the number of rows and columns 
#' of a data frame.
#'
#' @param x A R object.
#' @param ... Unused
#' @return A vector or list of the dimensions.
#' @export
dims <- function(x, ...) {
  UseMethod("dims")
}

#' @describeIn dims Dimensions of a default object
#' @export
dims.default <- function(x, ...) {
  check_unused(...)
  if (is.vector(x) || is.factor(x)) length(x) else dim(x)
}

#' @describeIn dims Dimensions of a nlist object
#' @export
dims.data.frame <- function(x, ...) {
  check_unused(...)
  return(c(nrow(x), ncol(x)))
}

#' @describeIn dims Dimensions of a nlist object
#' @export
dims.nlist <- function(x, ...) {
  check_unused(...)
  check_nlist(x)
  if(!length(x)) return(list())
  lapply(x, dims)
}

#' @describeIn dims Dimensions of a nlist object
#' @export
dims.nlist <- function(x, ...) {
  check_unused(...)
  check_nlists(x)
  if(!length(x)) return(list())
  dims(x[[1]])
}
