#' Number of Parameter Dimensions
#'
#' Gets the number of dimensions of each [natomic_object()] in an
#' [nlist_object()].
#'
#' @param x The nlist object
#' @param ... Unused.
#' @return A named list of the number of dimensions of each numeric atomic object.
#' @seealso [pdims()]
#' @export
#'
#' @examples
#' term::npdims(nlist(x = 1:3))
#' term::npdims(nlist(y = 3, zz = matrix(2:5, 2)))
npdims.nlist <- function(x, ...) {
  if (!length(x)) {
    return(integer(0))
  }
  vapply(x, ndims, 1L)
}

#' Number of Parameter Dimensions
#'
#' Gets the number of dimensions of each [natomic_object()] in an
#' [nlists_object()].
#'
#' @param x The nlists object
#' @param ... Unused.
#' @return A named list of the number of dimensions of each numeric atomic object.
#' @seealso [pdims()]
#' @export
#'
#' @examples
#' term::npdims(nlists(nlist(x = 1:3)))
#' term::npdims(nlists(
#'   nlist(y = 3, zz = matrix(2:5, 2)),
#'   nlist(y = 5, zz = matrix(1:4, 2))
#' ))
npdims.nlists <- function(x, ...) {
  if (!length(x)) {
    return(integer(0))
  }
  npdims(x[[1]])
}
