#' @export
as.term.nlist <- function(x, ...) {
  x <- mapply(as.term, x, names(x), SIMPLIFY = FALSE)
  as.term(unname(unlist(x)))
}

#' @export
as.term.nlists <- function(x, ...) {
  as.term(x[[1]])
}
