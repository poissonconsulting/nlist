#' Parameter Dimensions of an nlist Object
#'
#' Gets the dimensions of an nlist object.
#'
#' @param x An nlist object.
#' @param ... Unused
#' @return A named list of the dimensions of each [natomic_object()].
#' @seealso [term::pdims()]
#' @export
#'
#' @examples
#' term::pdims(nlist(x = 1:3))
#' term::pdims(nlist(y = 3, zz = matrix(2:5, 2)))
pdims.nlist <- function(x, ...) {
  if (!length(x)) {
    return(list())
  }
  lapply(x, dims)
}

#' Dimensions of an nlists Object
#'
#' Gets the dimensions of an nlists object.
#'
#' @param x An nlists object.
#' @param ... Unused
#' @return A named list of the dimensions of each [natomic_object()].
#' @seealso [term::pdims()]
#' @export
#'
#' @examples
#' term::pdims(nlists(nlist(x = 1:3)))
#' term::pdims(nlists(
#'   nlist(y = 3, zz = matrix(2:5, 2)),
#'   nlist(y = 5, zz = matrix(1:4, 2))
#' ))
#' @export
#' @export
pdims.nlists <- function(x, ...) {
  if (!length(x)) {
    return(list())
  }
  pdims(x[[1]])
}
