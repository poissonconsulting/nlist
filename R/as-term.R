#' @export
as.term.nlist <- function(x, ...) {
  x <- mapply(as.term, x, names(x), SIMPLIFY = FALSE)
  x <- unname(unlist(x))
  if (is.null(x)) {
    return(term(0L))
  }
  as.term(x)
}

#' @export
as.term.nlists <- function(x, ...) {
  as.term(x[[1]])
}
