#' Subset mcmc Object
#'
#' Subsets an mcmc object by its parameters and/or iterations.
#'
#' Future versions should allow it to be reordered by its parameters.
#'
#' @param x An mcmc object.
#' @inheritParams params
#' @return An mcmc object.
#' @export
#'
#' @examples
#' mcmc <- as_mcmc(nlist(beta = 1:2, theta = 1))
#' subset(mcmc, pars = "beta")
#' subset(mcmc, iters = c(1L, 1L))
subset.mcmc <- function(x, iters = NULL, pars = NULL,
                        iterations = NULL, parameters = NULL, ...) {
  if (!missing(iterations)) {
    deprecate_warn("0.2.1", "subset(iterations = )", "subset(iters = )",
      id = "subset_iterations"
    )
    iters <- iterations
  }
  if (!missing(parameters)) {
    deprecate_warn("0.2.1", "subset(parameters = )", "subset(pars = )",
      id = "subset_parameters"
    )
    pars <- parameters
  }
  if (!is.null(iters)) {
    chk_whole_numeric(iters)
    chk_range(iters, c(1L, niters(x)))
  }
  if (!is.null(pars)) {
    chk_s3_class(pars, "character")
    chk_not_any_na(pars)
    chk_unique(pars)
    chk_subset(pars, pars(x))
  }
  chk_unused(...)

  if (!is.null(pars)) x <- x[, pars_terms(as_term(x)) %in% pars, drop = FALSE]
  if (!is.null(iters)) x <- x[iters, , drop = FALSE]
  set_class(x, "mcmc")
}

#' Subset mcmc.list Object
#'
#' Subsets an mcmc.list object by its chains, parameters and/or iterations.
#'
#' Future versions should allow it to be reordered by its parameters.
#'
#' @param x An mcmc.list object.
#' @inheritParams params
#' @return An mcmc.list object.
#' @export
#'
#' @examples
#' mcmc.list <- as_mcmc_list(nlists(
#'   nlist(beta = 1:2, theta = 1),
#'   nlist(beta = 3:4, theta = -1)
#' ))
#' subset(mcmc.list, pars = "beta")
#' subset(mcmc.list, iters = c(1L, 1L))
subset.mcmc.list <- function(x, chains = NULL, iters = NULL, pars = NULL,
                             iterations = NULL, parameters = NULL, ...) {
  if (!missing(iterations)) {
    deprecate_warn("0.2.1", "subset(iterations = )", "subset(iters = )",
      id = "subset_iterations"
    )
    iters <- iterations
  }
  if (!missing(parameters)) {
    deprecate_warn("0.2.1", "subset(parameters = )", "subset(pars = )",
      id = "subset_parameters"
    )
    pars <- parameters
  }
  if (!is.null(chains)) {
    chk_whole_numeric(chains)
    chk_not_any_na(chains)
    chk_range(chains, c(1L, nchains(x)))
  }
  chk_unused(...)

  if (!is.null(chains)) {
    x <- x[chains]
  }
  x <- lapply(x, subset, iters = iters, pars = pars)
  class(x) <- "mcmc.list"
  x
}

#' Subset nlist Object
#'
#' Subsets an nlist object by its parameters.
#'
#' It can also be used to reorder the parameters.
#'
#' @param x An nlist object.
#' @inheritParams params
#' @return An nlist object.
#' @export
#'
#' @examples
#' nlist <- nlist(a = 1, y = 3, x = 1:4)
#' subset(nlist)
#' subset(nlist, "a")
#' subset(nlist, c("x", "a"))
subset.nlist <- function(x, pars = NULL, ...) {
  if (is.null(pars)) {
    return(x)
  }
  chk_subset(pars, pars(x))
  chk_unused(...)

  x[unique(pars)]
}

#' Subset nlists Object
#'
#' Subsets an nlists object by its parameters, chains and iterations.
#'
#' It can also be used to reorder the parameters as well as duplicate
#' chains and iterations.
#'
#' @param x An nlists object.
#' @inheritParams params
#' @return An nlists object.
#' @export
#'
#' @examples
#' nlists <- nlists(
#'   nlist(a = 1, y = 3, x = 1:4),
#'   nlist(a = 2, y = 4, x = 4:1),
#'   nlist(a = 3, y = 6, x = 5:2)
#' )
#' subset(nlists)
#' subset(nlists, pars = "a")
#' subset(nlists, pars = c("x", "a"))
#' subset(nlists, iters = 1L)
#' subset(nlists, iters = c(2L, 2L))
subset.nlists <- function(x, chains = NULL, iters = NULL, pars = NULL, ...) {
  if (!is.null(chains)) chk_subset(chains, 1:nchains(x))
  if (!is.null(iters)) chk_subset(chains, 1:niters(x))
  if (!is.null(pars)) chk_subset(pars, pars(x))
  chk_unused(...)

  if (!is.null(pars)) x <- lapply_nlists(x, subset, pars = pars)
  x <- split_by_chains(x)
  if (!is.null(chains)) x <- x[chains]
  nchains <- length(x)
  if (!is.null(iters)) x <- lapply(x, function(x, iter) x[iter], iter = iters)
  x <- .c_nlists(x)
  if (nchains > 1L) attr(x, "nchains") <- nchains
  names(x) <- NULL
  x
}
