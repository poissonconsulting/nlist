#' Sort mcmc Object
#'
#' Sorts an mcmc object by its parameter names.
#'
#' @param x An mcmc object.
#' @inheritParams params
#' @return An mcmc object with the parameters sorted by name.
#' @export
#'
#' @examples
#' sort(as_mcmc(nlist(y = 1, a = 2:3)))
sort.mcmc <- function(x, ...) {
  set_class(x[, order(as_term(x)), drop = FALSE], "mcmc")
}

#' Sort mcmc.list Object
#'
#' Sorts an mcmc.list object by its parameter names.
#'
#' @param x An mcmc.list object.
#' @inheritParams params
#' @return An mcmc.list object with the parameters sorted by name.
#' @export
#'
#' @examples
#' sort(as_mcmc_list(nlist(y = 1, a = 2:3)))
sort.mcmc.list <- function(x, ...) set_class(lapply(x, sort), "mcmc.list")
