#' Subset nlist
#' 
#' @param x An nlist object to be subsetted.
#' @param pars A character vector of the parameters to include in the subsetted vector.
#' @param ... Unused.
#' @return The modified nlist object.
#' @export
#' 
#' @examples 
#' nlist <- nlist(a = 1, y = 3, x = 1:4)
#' subset(nlist)
#' subset(nlist, "a")
#' subset(nlist, c("x", "a"))
subset.nlist <- function(x, pars = NULL, ...) {
  checkor(check_null(pars), check_vector(pars, pars(x), unique = TRUE, only = TRUE))
  check_unused(...)
  
  if(is.null(pars)) return(x)
  x[pars]
}

#' Subset nlist
#' 
#' @param x An nlist object to be subsetted.
#' @param pars A character vector of the parameters to include in the subsetted vector.
#' @param ... Unused.
#' @return The modified nlist object.
#' @export
#' 
#' @examples 
#' nlists <- nlists(nlist(a = 1, y = 3, x = 1:4),
#'                 nlist(a = 2, y = 4, x = 4:1),
#'                 nlist(a = 3, y = 6, x = 5:2))
#' subset(nlists)
#' subset(nlists, "a")
#' subset(nlists, c("x", "a"))
subset.nlists <- function(x, pars = NULL, ...) {
  checkor(check_null(pars), check_vector(pars, pars(x), unique = TRUE, only = TRUE))
  check_unused(...)
  
  if(is.null(pars)) return(x)
  
  x <- lapply(x, subset, pars = pars)
  class(x) <- "nlists"
  x
}
