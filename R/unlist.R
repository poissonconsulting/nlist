#' Flatten nlist Object
#' 
#' Simplifies an nlist object to an atomic vector.
#' 
#' @param x An nlist object.
#' @param recursive Ignored.
#' @param use.names A flag specifying whether to name the vector elements.
#' If \code{TRUE} the elements are named by their terms.
#' @return An atomic numeric vector of the values in x.
#' @method unlist nlist
#' @export
#' @examples 
#' unlist(nlist(y = 2, x = matrix(4:7, ncol = 2)))
unlist.nlist <- function(x, recursive = TRUE, use.names = TRUE) {
  chk_flag(use.names)
  y <- unlist(unclass(x), use.names = use.names)
  if(is.null(y)) y <- numeric(0)
  if(use.names)
    names(y) <- as.term(x)
  y
}
