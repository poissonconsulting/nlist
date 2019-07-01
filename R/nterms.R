#' @export
nterms.nlist <- function(x, ...) {
  sum(vapply(x, length, 1L))
}

#' @export
nterms.nlists <- function(x, ...) {
  if(!length(x)) return(0L)
  nterms(x[[1]])
}
