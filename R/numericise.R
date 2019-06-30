#' Numericise (or Numericize)
#'
#' If possible recursively coerces an non-numeric R object to an integer or double while
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
numericise <- function(x, ...) UseMethod("numericise")

#' @export
numericize <- function(x, ...) UseMethod("numericise")

#' @export
numericise.logical <- function(x, ...) as.integer(x)

#' @export
numericise.integer <- function(x, ...) x

#' @export
numericise.double <- function(x, ...) x

#' @export
numericise.character <- function(x, ...) x

#' @export
numericise.factor <- function(x, ...) as.integer(x)

#' @export
numericise.Date <- function(x, ...) {
  x <- unclass(x)
  x <- floor(x)
  as.integer(x)
}

#' @export
numericise.POSIXct <- function(x, ...) {
  x <- unclass(x)
  x <- floor(x)
  as.integer(x)
}

#' @export
numericise.hms <- function(x, ...) {
  x <- unclass(x)
  x <- floor(x)
  as.integer(x)
}

#' @export
numericise.matrix <- function(x, ...) {
  if(is.logical(x))
    mode(x) <- "integer"
  x
}

#' @export
numericise.array <- function(x, ...) {
  if(is.logical(x))
    mode(x) <- "integer"
  x
}

#' @export
numericise.list <- function(x, ...) lapply(x, numericise)

#' @export
numericise.data.frame <- function(x, ...) {
  x[] <- lapply(x, numericise)
  x
}
