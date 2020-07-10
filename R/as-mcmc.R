#' Coerce to nlist
#'
#' Coerce an R object to an mcmc object.
#'
#' @inheritParams params
#' @return An nlist object.
#' @export
#' @examples
#' as_nlist(list(x = 1:4))
#' as_nlist(c(`a[2]` = 3, `a[1]` = 2))
as_mcmc <- function(x, ...) {
  UseMethod("as_mcmc")
}

#' @describeIn as_mcmc nlist object to an mcmc object.
#' @export
#' @examples
#' as_mcmc(nlist(x = matrix(1:6, 2)))
as_mcmc.nlist <- function(x, ...) {
  chk_unused(...)
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

#' @describeIn as_mcmc nlists object to an mcmc object.
#' @export
#' @examples
#' as_mcmc(nlists(
#'   nlist(x = matrix(1:6, 2)),
#'   nlist(x = matrix(3:8, 2))
#' ))
as_mcmc.nlists <- function(x, ...) {
  chk_unused(...)
  if (!length(x)) {
    return(as.mcmc(numeric(0)))
  }
  x <- lapply(x, FUN = as_mcmc)
  x <- do.call("rbind", x)
  coda::mcmc(x)
}

#' @importFrom coda as.mcmc
#' @export
coda::as.mcmc

#' @export
as.mcmc.nlist <- function(x, ...) {
  deprecate_soft("0.2.1", "as.mcmc()", "as_mcmc()", id = "as_mcmc")
  chk_unused(...)
  as_mcmc(x)
}

#' @export
as.mcmc.nlists <- function(x, ...) {
  deprecate_soft("0.2.1", "as.mcmc()", "as_mcmc()", id = "as_mcmc")
  chk_unused(...)
  as_mcmc(x)
}
