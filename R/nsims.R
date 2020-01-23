#' @export
universals::nsims

#' @inherit universals::nsims
#' @details Always 1L.
#' @export
#'
#' @examples
#' nsims(nlist(x = 1:2))
nsims.nlist <- function(x, ...) {
  1L
}

#' @inherit universals::nsims
#' @export
#'
#' @examples
#' nsims(nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7))))
#' nsims(split_chains(nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7)))))
nsims.nlists <- function(x, ...) {
  length(x)
}
