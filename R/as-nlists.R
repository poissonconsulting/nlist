#' Coerce to nlists
#'
#' Coerce an R object to an [nlists_object()].
#'
#' @param x An R object.
#' @param ... Unused
#' @return An nlists object.
#' @export
#' @examples
#' as.nlists(list(nlist(x = c(1, 5)), nlist(x = c(2, 3)), nlist(x = c(3, 2))))
as.nlists <- function(x, ...) {
  UseMethod("as.nlists")
}

#' @describeIn as.nlists Coerce list to nlists
#' @export
as.nlists.list <- function(x, ...) {
  x <- lapply(x, as.nlist)
  class(x) <- "nlists"
  chk_nlists(x)
  x
}

#' @describeIn as.nlists Coerce nlist to nlists
#' @export
as.nlists.nlist <- function(x, ...) {
  x <- list(x)
  class(x) <- "nlists"
  x
}

#' @export
as.nlists.nlists <- function(x, ...) x
