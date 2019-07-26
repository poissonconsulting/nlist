#' Coerce to nlist
#'
#' Coerce an R object to an \code{\link{nlist_object}}.
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

#' @describeIn as.nlist Coerce list to nlist
#' @export
as.nlist.list <- function(x, ...) {
  if(!length(x)) return(nlist())
  x <- numericise(x)
  check_nlist(x, class = NA)
  class(x) <- "nlist"
  x
}

#' @describeIn as.nlist Coerce data.frame to nlist
#' @export
as.nlist.data.frame <- function(x, ...) as.nlist(as.list(x))

#' @export
as.nlist.nlist <- function(x, ...) x
