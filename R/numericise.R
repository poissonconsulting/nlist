#' Numericise (or Numericize)
#'
#' If possible recursively coerces an non-numeric R object to an integer while
#' preserving its dimensions.
#' 
#' Date, POSIXct and hms objects are floored first.
#'
#' @param x An R object.
#' @param ... Unused
#' @return The modified object.
#' @aliases numericize
#' @export
#' @examples 
#' numericize(TRUE)
numericise <- function(x, ...) {
  UseMethod("numericise")
}

#' @export
numericize <- function(x, ...) {
  UseMethod("numericise")
}

#' @export
numericise.logical <- function(x, ...) {
  check_unused(...)
  as.integer(x)
}

#' @export
numericise.character <- function(x, ...) {
  x
}

#' @export
numericise.factor <- function(x, ...) {
  check_unused(...)
  as.integer(x)
}

#' @export
numericise.Date <- function(x, ...) {
  check_unused(...)
  x <- unclass(x)
  x <- floor(x)
  as.integer(x)
}

#' @export
numericise.POSIXct <- function(x, ...) {
  check_unused(...)
  x <- unclass(x)
  x <- floor(x)
  as.integer(x)
}

#' @export
numericise.hms <- function(x, ...) {
  check_unused(...)
  x <- unclass(x)
  x <- floor(x)
  as.integer(x)
}

#' @export
numericise.matrix <- function(x, ...) {
  check_unused(...)
  if(is.logical(x))
    mode(x) <- "integer"
  x
}

#' @export
numericise.array <- function(x, ...) {
  check_unused(...)
  if(is.logical(x))
    mode(x) <- "integer"
  x
}

#' @export
numericise.list <- function(x, ...) {
  check_unused(...)
  lapply(x, numericise)
}

#' @export
numericise.data.frame <- function(x, ...) {
  check_unused(...)
  x[] <- lapply(x, numericise)
  x
}
