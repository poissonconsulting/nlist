#' @export
term::as.term

#' @inherit term::as.term
#' @export
#' @examples 
#' as.term(nlist(x = matrix(1:4, ncol = 2)))
as.term.nlist <- function(x, ...) {
  x <- mapply(as.term, x, names(x), SIMPLIFY = FALSE)
  x <- unname(unlist(x))
  if (is.null(x)) {
    return(term(0L))
  }
  as.term(x)
}

#' @inherit term::as.term
#' @export
#' @examples 
#' as.term(nlists(nlist(x = matrix(1:4, ncol = 2))))
as.term.nlists <- function(x, ...) {
  as.term(x[[1]])
}
