#' Parameter Names
#'
#' Gets the parameter names for an [nlist_object()].
#'
#' @param x An nlist object.
#' @param scalar A logical scalar specifying whether to get the names of
#' all parameters (NA), only scalars (TRUE) or all parameters
#' except scalars (FALSE).
#' @param terms A flag specifying whether to return the parameter name
#' for each term.
#' @param ... Unused.
#' @return A character vector of the parameter names.
#' @export
#'
#' @examples
#' term::pars(nlist(zz = 1, y = 3:6))
pars.nlist <- function(x, scalar = NA, terms = FALSE, ...) {
  chk_lgl(scalar)
  chk_flag(terms)
  chk_unused(...)

  if (is.na(scalar) && !terms) {
    return(names(x))
  } # this prevents infinite recursion
  pars(as.term(x), scalar = scalar, terms = terms)
}

.par_name_pattern <- "[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz][ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789._]*"

pars.term <- function(x, scalar = NA, terms = FALSE, ...) {
  chk_lgl(scalar)
  chk_flag(terms)
  chk_unused(...)
  
  x <- as.character(x)
  if (!is.na(scalar)) {
    bol <- grepl("\\[", x)
    x <- x[if (scalar) !bol else bol]
  }
  x <- sub(p0("^(", .par_name_pattern, ")(.*)"), "\\1", x)
  if (!terms) x <- unique(x)
  x
}

#' Parameter Names
#'
#' Gets the parameter names for an [nlists_object()].
#'
#' @param x An nlists object.
#' @inheritParams pars.nlist
#' @return A character vector of the parameter names.
#' @export
#'
#' @examples
#' term::pars(nlists(nlist(zz = 1, y = 3:6), nlist(zz = 4, y = 13:16)))
pars.nlists <- function(x, scalar = NA, terms = FALSE, ...) {
  chk_unused(...)
  if (!length(x)) {
    return(character(0))
  }
  pars(x[[1]], scalar = scalar, terms = terms)
}
