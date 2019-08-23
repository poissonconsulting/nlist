#' @export
`[.nlist`  <- function(x, i, ...) {
  as.nlist(NextMethod())
}

#' @export
`[.nlists`  <- function(x, i, j, ...) {
  if(nargs() < 3L) return(as.nlists(NextMethod()))
  x <- unclass(x)
  if(!missing(i)) x <- x[i]
  if(!missing(j)) x <- lapply(x, `[`, j)
  as.nlists(x)
}

#' @export
`[[<-.nlists` <- function(x, i, ..., value) {
  chk_nlist(value, x_name = "value")
  class(value) <- "nlist"
  x <- NextMethod()
  chk_nlists(x, x_name = "`x` and `values`")
  x
}
