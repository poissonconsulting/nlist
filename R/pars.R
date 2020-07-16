#' @export
universals::pars

#' @inherit universals::pars
#' @inheritParams params
#' @export
pars.mcmc <- function(x, scalar = NULL, terms = FALSE, ...) {
  if (!is.null(scalar)) chk_flag(scalar)
  chk_flag(terms)
  chk_unused(...)

  if (!missing(terms)) {
    deprecate_soft("0.2.1", "nlist::pars(terms =)", details = "If `terms = TRUE` use `terms::pars_terms(as_term(x)) otherwise replace `pars(x, terms = FALSE)` with `pars(x)`.", id = "pars_terms")
  }
  x <- as_term(x)
  if(terms) return(pars_terms(x, scalar = scalar))
  pars(x, scalar = scalar)
}

#' @inherit universals::pars
#' @inheritParams params
#' @export
pars.mcmc.list <- function(x, scalar = NULL, terms = FALSE, ...) {
  pars(x[[1]], scalar = scalar, terms = terms, ...)
}

#' @inherit universals::pars
#' @inheritParams params
#' @export
#'
#' @examples
#' pars(nlist(zz = 1, y = 3:6))
pars.nlist <- function(x, scalar = NULL, terms = FALSE, ...) {
  if (!is.null(scalar)) chk_flag(scalar)
  chk_flag(terms)
  chk_unused(...)

  if (!missing(terms)) {
    deprecate_soft("0.1.1", "nlist::pars(terms =)", details = "If `terms = TRUE` use `terms::pars_terms(as_term(x)) otherwise replace `pars(x, terms = FALSE)` with `pars(x)`.", id = "pars_terms")
  }

  if (is.null(scalar) && !terms) {
    return(names(x))
  }
  if (terms) {
    if (is.null(scalar)) {
      return(pars_terms(as_term(x)))
    }
    return(pars_terms(as_term(x), scalar = scalar))
  }
  return(pars(as_term(x), scalar = scalar))
}

#' @inherit universals::pars
#' @inheritParams params
#' @export
#'
#' @examples
#' pars(nlists(nlist(zz = 1, y = 3:6), nlist(zz = 4, y = 13:16)))
pars.nlists <- function(x, scalar = NULL, terms = FALSE, ...) {
  if (!is.null(scalar)) chk_flag(scalar)
  chk_unused(...)

  if (!missing(terms)) {
    deprecate_soft("0.1.1", "nlist::pars(terms =)", details = "If `terms = TRUE` use `terms::pars_terms(as_term(x)) otherwise replace `pars(x, terms = FALSE)` with `pars(x)`.", id = "pars_terms")
  }
  if (!length(x)) {
    return(character(0))
  }
  x <- x[[1]]
  if (terms) {
    x <- as_term(x)
    if (!is.null(scalar)) {
      x <- x[scalar_term(x) == scalar]
    }
    return(pars_terms(x))
  }
  pars(as_term(x), scalar = scalar)
}
