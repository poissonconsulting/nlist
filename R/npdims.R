#' @export
universals::npdims

#' @inherit universals::npdims
#' @export
#'
#' @examples
#' npdims(nlist(x = 1:3))
#' npdims(nlist(y = 3, zz = matrix(2:5, 2)))
npdims.nlist <- function(x, ...) {
  if (!length(x)) {
    return(integer(0))
  }
  vapply(x, ndims, 1L)
}

#' @inherit universals::npdims
#' @export
#'
#' @examples
#' npdims(nlists(nlist(x = 1:3)))
#' npdims(nlists(
#'   nlist(y = 3, zz = matrix(2:5, 2)),
#'   nlist(y = 5, zz = matrix(1:4, 2))
#' ))
npdims.nlists <- function(x, ...) {
  if (!length(x)) {
    return(integer(0))
  }
  npdims(x[[1]])
}
