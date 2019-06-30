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
  check_natomic_vector(value, x_name = "value")
  NextMethod()
}

#' @export
`[[<-.nlists` <- function(x, i, ..., value) {
  check_nlist(value, x_name = "value")
  check_nlists(NextMethod(), x_name = "the nlist elements of x and values")
}
