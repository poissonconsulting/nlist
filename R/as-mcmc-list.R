#' Coerce to an mcmc.list Object
#'
#' Coerce an R object to an mcmc.list object.
#'
#' @inheritParams params
#' @return An mcmc.list object.
#' @family mcmc
#' @export
as_mcmc_list <- function(x, ...) {
  UseMethod("as_mcmc_list")
}

#' @describeIn as_mcmc_list Coerce an mcmc object to an mcmc.list object.
#' @export
as_mcmc_list.mcmc <- function(x, ...) {
  chk_unused(...)
  coda::as.mcmc.list(as_mcmc(x))
}

#' @export
as_mcmc_list.mcmc.list <- function(x, ...) x

#' @describeIn as_mcmc_list Coerce an nlist object to an mcmc.list object.
#' @export
#' @examples
#' as_mcmc_list(nlist(x = matrix(1:6, 2)))
as_mcmc_list.nlist <- function(x, ...) {
  chk_unused(...)
  as_mcmc_list(as_mcmc(x))
}

#' @describeIn as_mcmc_list Coerce an nlists object to an mcmc.list object.
#' @export
#' @examples
#'
#' @examples
#' as_mcmc_list(nlists(
#'   nlist(x = matrix(1:6, 2)),
#'   nlist(x = matrix(3:8, 2))
#' ))
as_mcmc_list.nlists <- function(x, ...) {
  chk_unused(...)
  if (nchains(x) == 1L) {
    return(as_mcmc_list(as_mcmc(x)))
  }
  x <- split_by_chains(x)
  x <- lapply(x, FUN = as_mcmc)
  coda::as.mcmc.list(x)
}

#' @method as.mcmc.list nlist
#' @export
as.mcmc.list.nlist <- function(x, ...) {
  deprecate_soft("0.2.1", "as.mcmc.list()", "as_mcmc_list()", id = "as_mcmc_list")
  as_mcmc_list(x, ...)
}

#' @method as.mcmc.list nlists
#' @export
as.mcmc.list.nlists <- function(x, ...) {
  deprecate_soft("0.2.1", "as.mcmc.list()", "as_mcmc_list()", id = "as_mcmc_list")
  as_mcmc_list(x, ...)
}
