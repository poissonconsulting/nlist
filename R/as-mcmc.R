#' As mcmc Object
#'
#' Coerces an nlist object to a `coda::mcmc` object.
#' @param x A nlist object.
#' @param ... Unused.
#' @return An mcmc object.
#' @seealso [nlist-object()] and [coda::mcmc()]
#' @export
#'
#' @examples
#' coda::as.mcmc(nlist(x = matrix(1:6, 2)))
as.mcmc.nlist <- function(x, ...) {
  if (!length(x)) {
    return(coda::as.mcmc(numeric(0)))
  }
  term <- as.character(as.term(x))
  x <- lapply(x, as.vector)
  x <- unlist(x)
  x <- matrix(x, ncol = 1)
  x <- t(x)
  colnames(x) <- term
  coda::mcmc(x)
}

#' As mcmc Object
#'
#' Coerces an nlists object to a `coda::mcmc` object.
#' @param x A nlists object.
#' @param ... Unused.
#' @return An mcmc object.
#' @seealso [nlists-object()] and [coda::mcmc()]
#' @export
#'
#' @examples
#' coda::as.mcmc(nlists(
#'   nlist(x = matrix(1:6, 2)),
#'   nlist(x = matrix(3:8, 2))
#' ))
as.mcmc.nlists <- function(x, ...) {
  if (!length(x)) {
    return(coda::as.mcmc(numeric(0)))
  }
  x <- lapply(x, FUN = coda::as.mcmc)
  x <- do.call("rbind", x)
  coda::mcmc(x)
}
