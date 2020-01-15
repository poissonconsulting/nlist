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
#' fill_na(nlist(x = c(2, NA), y = matrix(c(1:3, NA), nrow = 2)))
#' fill_na(nlists(nlist(x = c(2, NA)), nlist(x = c(NA_real_, NA))))
fill_na <- function(x, ...) UseMethod("fill_na")

#' @describeIn fill_na Fill missing values of logical object
#' @export
fill_na.logical <- function(x, value = FALSE, ...) {
  chk_scalar(value)
  chk_unused(...)
  value <- as.logical(value)
  x[is.na(x)] <- value
  x
}

#' @describeIn fill_na Fill missing values of integer object
#' @export
fill_na.integer <- function(x, value = 0L, ...) {
  chk_scalar(value)
  chk_unused(...)
  value <- as.integer(value)
  x[is.na(x)] <- value
  x
}

#' @describeIn fill_na Fill missing values of numeric object
#' @export
fill_na.numeric <- function(x, value = 0, ...) {
  chk_scalar(value)
  chk_unused(...)
  value <- as.numeric(value)
  x[is.na(x)] <- value
  x
}

#' @describeIn fill_na Fill missing values of character object
#' @export
fill_na.character <- function(x, value = "0", ...) {
  chk_scalar(value)
  chk_unused(...)
  value <- as.character(value)
  x[is.na(x)] <- value
  x
}

#' @describeIn fill_na Fill missing values of nlist object
#' @export
fill_na.nlist <- function(x, value = 0L, ...) {
  chk_scalar(value)
  chk_unused(...)
  x <- lapply(x, fill_na, value = value)
  class(x) <- "nlist"
  x
}

#' @describeIn fill_na Fill missing values of nlist object
#' @export
fill_na.nlists <- function(x, value = 0L, ...) {
  chk_unused(...)
  x <- lapply(x, fill_na, value = value)
  class(x) <- "nlists"
  x
}
