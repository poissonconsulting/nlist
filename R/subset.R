#' Subset nlist
#' 
#' @param x An nlist object to be subsetted.
#' @param pars A character vector of the parameters to include in the subsetted vector.
#' @param ... Unused.
#' @return The modified nlist object.
#'
#' @export
#' @examples 
#' nlist <- nlist(a = 1, y = 3, x = 1:4)
#' subset(nlist)
#' subset(nlist, "a")
#' subset(nlist, c("x", "a"))
#' @export
subset.nlist <- function(x, pars = NULL, ...) {
  checkor(check_null(pars), check_vector(pars, pars(x), unique = TRUE, only = TRUE))
  check_unused(...)
  
  if(is.null(pars)) return(x)
  x[pars]
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
