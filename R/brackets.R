#' @export
`[.nlist` <- function(x, i, ...) {
  x <- NextMethod()
  x <- as_nlist(x)
  chk_nlist(x)
  x
}

#' @export
`[.nlists` <- function(x, i, j, ...) {
  if (nargs() < 3L) {
    x <- NextMethod()
    x <- as_nlists(x)
    return(x)
  }
  if (!missing(i)) x <- subset(x, chains = i)
  if (!missing(j)) x <- subset(x, iters = j)
  as_nlists(x)
}
