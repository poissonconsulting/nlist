#' @export
`[.nlist` <- function(x, i, ...) {
  as.nlist(NextMethod())
}

#' @export
`[.nlists` <- function(x, i, j, ...) {
  if (nargs() < 3L) {
    x <- NextMethod()
    x <- as.nlists(x)
    return(x)
  }
  if (!missing(i)) x <- subset(x, chains = i)
  if (!missing(j)) x <- subset(x, iters = j)
  as.nlists(x)
}
