#' @export
dims.nlist <- function(x, ...) {
  check_nlist(x)
  if(!length(x)) return(list())
  lapply(x, dims)
}

#' @export
dims.nlists <- function(x, ...) {
  check_nlists(x)
  if(!length(x)) return(list())
  dims(x[[1]])
}
