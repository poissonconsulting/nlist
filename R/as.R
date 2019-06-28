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

#' @export
as.nlist.list <- function(x, ...) {
  check_unused(...)
  check_nlist(x, class = FALSE)
  class(x) <- "nlist"
  x
}

#' @export
as.nlist.data.frame <- function(x, ...) {
  check_unused(...)
  x <- as.list(x)
  as.nlist(x)
  x
}

#' @export
as.nlist.nlist <- function(x, ...) {
  check_unused(...)
  x
}

