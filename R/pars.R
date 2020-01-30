#' @export
universals::pars

#' @inherit universals::pars
#' @inheritParams params
#' @export
#'
#' @examples
#' pars(nlist(zz = 1, y = 3:6))
pars.nlist <- function(x, scalar = NA, terms = FALSE, ...) {
  chk_lgl(scalar)
  chk_flag(terms)
  chk_unused(...)
  
  if(!missing(terms)) {
    deprecate_soft("0.1.0.9001", "pars(terms =)", details = "If `terms = TRUE` use `terms::pars_terms(as.term(x)) otherwise replace `pars(x, terms = FALSE)` with `pars(x)`.", id = "pars")
  }

  if (is.na(scalar) && !terms) {
    return(names(x))
  }
  if(terms) return(pars_terms(as.term(x), scalar = scalar))
  pars(as.term(x), scalar = scalar)
}

#' @inherit universals::pars
#' @inheritParams params
#' @export
#'
#' @examples
#' pars(nlists(nlist(zz = 1, y = 3:6), nlist(zz = 4, y = 13:16)))
pars.nlists <- function(x, scalar = NA, terms = FALSE, ...) {
  chk_unused(...)
  if(!missing(terms)) {
    deprecate_soft("0.1.0.9001", "pars(terms =)", details = "If `terms = TRUE` use `terms::pars_terms(as.term(x)) otherwise replace `pars(x, terms = FALSE)` with `pars(x)`.", id = "pars")
  }
  if (!length(x)) {
    return(character(0))
  }
  if(terms) {
    return(pars(as.term(x[[1]]), scalar = scalar))
  }
  pars(x[[1]], scalar = scalar)
}
