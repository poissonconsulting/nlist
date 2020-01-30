#' @export
universals::pdims

#' @inherit universals::pdims
#' @export
#'
#' @examples
#' pdims(nlist(x = 1:3))
#' pdims(nlist(y = 3, zz = matrix(2:5, 2)))
pdims.nlist <- function(x, ...) {
  if (!length(x)) {
    return(list())
  }
  lapply(x, dims)
}

#' @inherit universals::pdims
#' @export
#'
#' @examples
#' pdims(nlists(nlist(x = 1:3)))
#' pdims(nlists(
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
