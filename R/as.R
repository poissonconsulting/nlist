#' Coerce to nlist
#'
#' Coerce an R object to an nlist object.
#'
#' @param x An R object.
#' @param ... Unused
#' @return An nlist object.
#' @export
as.nlist <- function(x, ...) {
  UseMethod("as.nlist")
}

#' Coerce to nlists
#'
#' Coerce an R object to an nlists object.
#'
#' @param x An R object.
#' @param ... Unused
#' @return An nlist object.
#' @export
as.nlists <- function(x, ...) {
  UseMethod("as.nlists")
}

#' @export
as.nlist.list <- function(x, ...) {
  check_unused(...)
  x <- numericise(x)
  check_nlist(x, class = NA)
  class(x) <- "nlist"
  x
}

#' @export
as.nlist.data.frame <- function(x, ...) {
  check_unused(...)
  x <- as.list(x)
  x <- as.nlist(x)
  x
}

#' @export
as.nlist.nlist <- function(x, ...) {
  check_unused(...)
  x
}

#' @export
as.nlists.list <- function(x, ...) {
  check_unused(...)
  x <- lapply(x, as.nlist)
  check_nlists(x, class = NA)
  class(x) <- "nlists"
  x
}

#' @export
as.nlists.nlists <- function(x, ...) {
  check_unused(...)
  x
}
