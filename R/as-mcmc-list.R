#' As mcmc.list Object
#'
#' Coerces an nlist object to a `coda::mcmc.list` object.
#' @inheritParams params
#' @return An mcmc.list object.
#' @seealso [nlist-object()] and [coda::mcmc()]
#' @export
#'
#' @examples
#' coda::as.mcmc.list(nlist(x = matrix(1:6, 2)))
as.mcmc.list.nlist <- function(x, ...) coda::as.mcmc.list(as.mcmc(x))

#' As mcmc Object
#'
#' Coerces an nlists object to a `coda::mcmc` object.
#' @inheritParams params
#' @return An mcmc object.
#' @seealso [nlists-object()] and [coda::mcmc()]
#' @export
#'
#' @examples
#' coda::as.mcmc.list(nlists(
#'   nlist(x = matrix(1:6, 2)),
#'   nlist(x = matrix(3:8, 2))
#' ))
as.mcmc.list.nlists <- function(x, ...) {
  if (nchains(x) == 1L) {
    return(coda::as.mcmc.list(as.mcmc(x)))
  }
  x <- split_by_chains(x)
  x <- lapply(x, FUN = coda::as.mcmc)
  coda::as.mcmc.list(x)
}
