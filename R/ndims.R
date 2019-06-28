#' Number of Dimensions of an Object
#'
#' Retrieves the number of dimensions of an object as defined by 
#' \code{\link{dims}()}.
#'
#' @param x A R object.
#' @param ... Unused
#' @return A vector or list of the dimensions.
#' @export
ndims <- function(x) {
  length(dims(x))
}
