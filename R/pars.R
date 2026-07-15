#' @export
universals::pars

#' @inherit universals::pars
#' @inheritParams params
#' @export
pars.mcmc <- function(x, scalar = NULL, terms = FALSE, ...) {
  if (!missing(terms)) {
    deprecate_stop(
      "0.2.1",
      "nlist::pars(terms =)",
      details = "If `terms = TRUE` use `terms::pars_terms(as_term(x))` otherwise replace `pars(x, terms = FALSE)` with `pars(x)`."
    )
  }
  if (!is.null(scalar)) {
    chk_flag(scalar)
  }
  chk_unused(...)

  pars(as_term(x), scalar = scalar)
}

#' @inherit universals::pars
#' @inheritParams params
#' @export
pars.mcmc.list <- function(x, scalar = NULL, terms = FALSE, ...) {
  if (!missing(terms)) {
    deprecate_stop(
      "0.2.1",
      "nlist::pars(terms =)",
      details = "If `terms = TRUE` use `terms::pars_terms(as_term(x))` otherwise replace `pars(x, terms = FALSE)` with `pars(x)`."
    )
  }
  if (!is.null(scalar)) {
    chk_flag(scalar)
  }
  chk_unused(...)

  x <- x[[1]]
  pars(as_term(x), scalar = scalar)
}

#' @inherit universals::pars
#' @inheritParams params
#' @export
#'
#' @examples
#' pars(nlist(zz = 1, y = 3:6))
pars.nlist <- function(x, scalar = NULL, terms = FALSE, ...) {
  if (!missing(terms)) {
    deprecate_stop(
      "0.1.1",
      "nlist::pars(terms =)",
      details = "If `terms = TRUE` use `terms::pars_terms(as_term(x))` otherwise replace `pars(x, terms = FALSE)` with `pars(x)`."
    )
  }
  if (!is.null(scalar)) {
    chk_flag(scalar)
  }
  chk_unused(...)

  if (is.null(scalar)) {
    return(names(x))
  }
  pars(as_term(x), scalar = scalar)
}

#' @inherit universals::pars
#' @inheritParams params
#' @export
#'
#' @examples
#' pars(nlists(nlist(zz = 1, y = 3:6), nlist(zz = 4, y = 13:16)))
pars.nlists <- function(x, scalar = NULL, terms = FALSE, ...) {
  if (!missing(terms)) {
    deprecate_stop(
      "0.1.1",
      "nlist::pars(terms =)",
      details = "If `terms = TRUE` use `terms::pars_terms(as_term(x))` otherwise replace `pars(x, terms = FALSE)` with `pars(x)`."
    )
  }
  if (!is.null(scalar)) {
    chk_flag(scalar)
  }
  chk_unused(...)

  if (!length(x)) {
    return(character(0))
  }
  pars(as_term(x[[1]]), scalar = scalar)
}
