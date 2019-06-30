#' @export
pars.nlist <- function(x, scalar_only = FALSE, terms = FALSE, ...) {
  check_unused(...)
  if(!scalar_only && !terms) return(names(x)) # this prevents infinite recursion
  pars(as.term(x), scalar_only = scalar_only, terms = terms)
}

#' @export
pars.nlists <- function(x, scalar_only = FALSE, terms = FALSE, ...) {
  check_unused(...)
  pars(x[[1]], scalar_only = scalar_only, terms = terms)
}
