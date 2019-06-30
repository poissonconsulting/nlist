#' @export
ndims.nlist <- function(x, ...) {
  check_nlist(x)
  if(!length(x)) return(integer(0))
  vapply(x, ndims, 1L)
}

#' @export
ndims.nlists <- function(x, ...) {
  check_nlists(x)
  if(!length(x)) return(integer(0))
  ndims(x[[1]])
}
