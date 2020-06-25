#' @export
coda::as.mcmc

#' @inherit coda::as.mcmc
#' @export
#' @examples
#' as.mcmc(nlist(x = matrix(1:6, 2)))
as.mcmc.nlist <- function(x, ...) {
  if (!length(x)) {
    return(as.mcmc(numeric(0)))
  }
  term <- as.character(as_term(x))
  x <- lapply(x, as.vector)
  x <- unlist(x)
  x <- matrix(x, ncol = 1)
  x <- t(x)
  colnames(x) <- term
  coda::mcmc(x)
}

#' @inherit coda::as.mcmc
#' @export
#' @examples
#' as.mcmc(nlists(
#'   nlist(x = matrix(1:6, 2)),
#'   nlist(x = matrix(3:8, 2))
#' ))
as.mcmc.nlists <- function(x, ...) {
  if (!length(x)) {
    return(as.mcmc(numeric(0)))
  }
  x <- lapply(x, FUN = coda::as.mcmc)
  x <- do.call("rbind", x)
  coda::mcmc(x)
}
