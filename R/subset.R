#' Subset nlist
#' 
#' @param x An nlist object to be subsetted.
#' @param select A character vector of the parameters to include in the subsetted object.
#' @param ... Unused.
#' @return The modified nlist object.
#' @export
#' 
#' @examples 
#' nlist <- nlist(a = 1, y = 3, x = 1:4)
#' subset(nlist)
#' subset(nlist, "a")
#' subset(nlist, c("x", "a"))
subset.nlist <- function(x, select = NULL, ...) {
  if(is.null(select)) return(x)
  
  check_vector(select, pars(x), unique = TRUE, only = TRUE)
  check_unused(...)
  
  x[select]
}

#' Subset nlists
#' 
#' @param x An nlists object to be subsetted.
#' @inheritParams subset.nlist
#' @param subset An integer vector of the nlist objects to include.
#' @return The modified nlists object.
#' @export
#' 
#' @examples 
#' nlists <- nlists(nlist(a = 1, y = 3, x = 1:4),
#'                 nlist(a = 2, y = 4, x = 4:1),
#'                 nlist(a = 3, y = 6, x = 5:2))
#' subset(nlists)
#' subset(nlists, select = "a")
#' subset(nlists, select = c("x", "a"))
#' subset(nlists, subset = 1L)
#' subset(nlists, subset = c(2L,2L))
subset.nlists <- function(x, subset = NULL, select = NULL, ...) {
  if(!is.null(subset)) {
    check_vector(subset, 1L)
    x <- x[subset]
  }
  if(is.null(select) || !length(x)) return(x)
  
  check_vector(select, pars(x), unique = TRUE, only = TRUE)
  check_unused(...)
  
  x <- lapply(x, subset, select = select)
  class(x) <- "nlists"
  x
}
