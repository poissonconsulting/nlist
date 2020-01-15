#' Coerce to nlist
#'
#' Coerce an R object to an [nlist_object()].
#'
#' @param x An R object.
#' @param ... Unused
#' @return An nlist object.
#' @export
#' @examples
#' as.nlist(list(x = 1:4))
#' as.nlist(c(`a[2]` = 3, `a[1]` = 2))
as.nlist <- function(x, ...) {
  UseMethod("as.nlist")
}

#' @describeIn as.nlist Coerce named numeric vector to nlist
#' @export
as.nlist.numeric <- function(x, ...) {
  chk_named(x)
  chk_term(as.term(names(x)), validate = "consistent", x_name = "`names(x)`")
  chk_not_any_na(names(x))
  chk_unique(names(x))
  chk_unused(...)

  if (!length(x)) {
    return(nlist())
  }
  terms <- as.term(names(x))
  if (is.incomplete_terms(terms)) {
    terms <- complete_terms(terms)
    y <- rep(NA_integer_, length(terms))
    names(y) <- terms
    y[names(x)] <- x
    x <- y
  }
  x <- split(x, pars(terms, terms = TRUE))
  x <- lapply(x, function(x) x[order(as.term(names(x)))])
  x <- lapply(x, function(x) set_dim(x, pdims(as.term(names(x)))[[1]]))
  as.nlist(x)
}

#' @describeIn as.nlist Coerce list to nlist
#' @export
as.nlist.list <- function(x, ...) {
  chk_unused(...)

  if (!length(x)) {
    return(nlist())
  }
  x <- numericise(x)
  class(x) <- "nlist"
  chk_nlist(x)
  x
}

#' @describeIn as.nlist Coerce data.frame to nlist
#' @export
as.nlist.data.frame <- function(x, ...) as.nlist(as.list(x))

#' @export
as.nlist.nlist <- function(x, ...) x
