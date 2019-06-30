#' @export
parameters.nlist <- function(x, scalar_only = FALSE, terms = FALSE, ...) {
  check_unused(...)
  if(!scalar_only && !terms) return(names(x)) # this prevents infinite recursion
  parameters(as.term(x), scalar_only = scalar_only, terms = terms)
}

#' @export
parameters.nlists <- function(x, scalar_only = FALSE, terms = FALSE, ...) {
  check_unused(...)
  parameters(x[[1]], scalar_only = scalar_only, terms = terms)
}
