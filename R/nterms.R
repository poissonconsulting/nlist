#' Number of Terms
#'
#' Gets the number of terms of an [nlist_object()].
#'
#' @param x The object.
#' @param ... Unused.
#' @return A count of the number of terms.
#' @export
#'
#' @examples
#' term::nterms(nlist(x = 2))
#' term::nterms(nlist(x = NA_real_))
#' term::nterms(nlist(x = 3, zz = matrix(2:5, 2)))
nterms.nlist <- function(x, ...) {
  sum(vapply(x, length, 1L))
}

#' Number of Terms
#'
#' Gets the number of terms of an [nlists_object()].
#'
#' @param x The object.
#' @param ... Unused.
#' @return A count of the number of terms.
#' @export
#'
#' @examples
#' term::nterms(nlists(nlist(x = 1:3)))
#' term::nterms(nlists(
#'   nlist(y = 3, zz = matrix(2:5, 2)),
#'   nlist(y = 5, zz = matrix(1:4, 2))
#' ))
nterms.nlists <- function(x, ...) {
  if (!length(x)) {
    return(0L)
  }
  nterms(x[[1]])
}
