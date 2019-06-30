#' Coerce to nlist
#'
#' Coerce an R object to an nlist object.
#'
#' @param x An R object.
#' @param ... Unused
#' @return An nlist object.
#' @export
#' @examples
#' as.nlist(list(x = 1:4))
as.nlist <- function(x, ...) {
  UseMethod("as.nlist")
}

#' @export
as.nlist.list <- function(x, ...) {
  if(!length(x)) return(nlist())
  x <- numericise(x)
  check_nlist(x, class = NA)
  class(x) <- "nlist"
  x
}

#' @export
as.nlist.data.frame <- function(x, ...) {
  x <- as.list(x)
  x <- as.nlist(x)
  x
}

#' @export
as.nlist.nlist <- function(x, ...) x
