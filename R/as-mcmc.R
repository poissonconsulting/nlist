#' Coerce to mcmc Object
#'
#' Coerce an R object to an mcmc object.
#'
#' @inheritParams params
#' @return An mcmc object.
#' @seealso [coda::as.mcmc()]
#' @family mcmc
#' @export
as_mcmc <- function(x, ...) {
  UseMethod("as_mcmc")
}

#' @export
as_mcmc.mcmc <- function(x, ...) x

#' @describeIn as_mcmc Coerce an mcmc.list object to an mcmc object.
#' @export
#' @examples
#' as_mcmc(as_mcmc_list(nlists(nlist(x = 2), nlist(x = 3))))
as_mcmc.mcmc.list <- function(x, ...) {
  x <- collapse_chains(x)
  x[[1]]
}

#' @describeIn as_mcmc Coerce an nlist object to an mcmc object.
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

#' @describeIn as_mcmc Coerce an nlists object to an mcmc object.
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
