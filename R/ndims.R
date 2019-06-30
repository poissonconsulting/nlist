#' @export
ndims.nlist <- function(x, ...) {
  check_nlist(x)
  if(!length(x)) return(list())
  lapply(x, ndims)
}

#' @export
ndims.nlists <- function(x, ...) {
  check_nlists(x)
  ndims(x[[1]])
}
