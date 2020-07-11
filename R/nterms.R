#' @export
universals::nterms

#' @inherit universals::nterms
#' @export
nterms.mcmc <- function(x, ...) ncol(x)

#' @inherit universals::nterms
#' @export
nterms.mcmc.list <- function(x, ...) nterms(x[[1]])

#' @inherit universals::nterms
#' @export
#'
#' @examples
#' nterms(nlist(x = 2))
#' nterms(nlist(x = NA_real_))
#' nterms(nlist(x = 3, zz = matrix(2:5, 2)))
nterms.nlist <- function(x, ...) {
  sum(vapply(x, length, 1L))
}
#' @inherit universals::nterms
#' @export
#'
#' @examples
#' nterms(nlists(nlist(x = 1:3)))
#' nterms(nlists(
#'   nlist(y = 3, zz = matrix(2:5, 2)),
#'   nlist(y = 5, zz = matrix(1:4, 2))
#' ))
nterms.nlists <- function(x, ...) {
  if (!length(x)) {
    return(0L)
  }
  nterms(x[[1]])
}
