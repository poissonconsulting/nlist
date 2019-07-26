#' Parameter Names
#'
#' Gets the parameter names for an \code{\link{nlist_object}}.
#'
#' @param x An nlist object.
#' @param scalar_only A flag specifying whether to only get the names of
#' parameters with one term.
#' @param terms A flag specifying whether to return the parameter name
#' for each term.
#' @param ... Unused.
#' @return A character vector of the parameter names.
#' @export
#' 
#' @examples
#' term::pars(nlist(zz = 1, y = 3:6))
pars.nlist <- function(x, scalar_only = FALSE, terms = FALSE, ...) {
  check_unused(...)
  if(!scalar_only && !terms) return(names(x)) # this prevents infinite recursion
  pars(as.term(x), scalar_only = scalar_only, terms = terms)
}

#' Parameter Names
#'
#' Gets the parameter names for an \code{\link{nlists_object}}.
#'
#' @param x An nlists object.
#' @inheritParams pars.nlist
#' @return A character vector of the parameter names.
#' @export
#' 
#' @examples
#' term::pars(nlists(nlist(zz = 1, y = 3:6), nlist(zz = 4, y = 13:16)))
pars.nlists <- function(x, scalar_only = FALSE, terms = FALSE, ...) {
  check_unused(...)
  if(!length(x)) return(character(0))
  pars(x[[1]], scalar_only = scalar_only, terms = terms)
}
