#' @export
subset.nlist <- function(x, pars = NULL, ...) {
  checkor(check_null(pars), check_vector(pars, pars(x), unique = TRUE, only = TRUE))
  check_unused(...)
  
  if(is.null(pars)) return(x)
  x[names(x) %in% pars]
}

#' @export
subset.nlists <- function(x, pars = NULL, ...) {
  checkor(check_null(pars), check_vector(pars, pars(x), unique = TRUE, only = TRUE))
  check_unused(...)
  
  if(is.null(pars)) return(x)
  
  x <- lapply(x, subset, pars = pars)
  class(x) <- "nlists"
  x
}
