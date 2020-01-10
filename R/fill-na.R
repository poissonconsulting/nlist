#' Fill Missing Values
#'
#' Fills missing values.
#' 
#' @param x The object.
#' @param value A scalar of the value to replace missing values with.
#' @param ... Unused.
#' @return The object with missing values filled.
#' @export
#' @examples
#' nsams(nlist(x = 2))
#' nsams(nlist(x = 1:2))
#' nsams(nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7))))
fill_na <- function(x, ...) UseMethod("fill_na")

#' @describeIn fill_na Fill missing values of default object
#' @export
fill_na.default <- function(x, value = 0, ...) {
  chk_scalar(value)
  chk_unused(...)
  x[is.na(x)] <- value
  x
}

#' @describeIn fill_na Fill missing values of logical vector
#' @export
fill_na.logical <- function(x, value = FALSE, ...) {
  chk_scalar(value)
  chk_unused(...)
  x[is.na(x)] <- value
  x
}

#' @describeIn fill_na Fill missing values of integer vector
#' @export
fill_na.integer <- function(x, value = 0L, ...) {
  chk_scalar(value)
  chk_unused(...)
  x[is.na(x)] <- value
  x
}

