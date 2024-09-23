#' @export
universals::bind_iterations

#' @inherit universals::bind_iterations
#' @export
#' @examples
#' bind_iterations(as_mcmc(nlist(x = 1)), as_mcmc(nlist(x = 3)))
bind_iterations.mcmc <- function(x, x2, ...) {
  chk_s3_class(x2, "mcmc")

  x <- sort(x)
  x2 <- sort(x2)

  if (!identical(pars(x), pars(x2))) {
    abort_chk("`x` and `x2` must have the same parameters")
  }

  if (!identical(pdims(x), pdims(x2))) {
    abort_chk("`x` and `x2` must have the same parameter dimensions")
  }

  if (!identical(nchains(x), nchains(x2))) {
    abort_chk("`x` and `x2` must have the same number of chains")
  }

  x <- abind(x, x2, along = 1)
  as.mcmc(x)
}

#' @inherit universals::bind_iterations
#' @export
#' @examples
#' bind_iterations(as_mcmc_list(nlist(x = 1)), as_mcmc_list(nlist(x = 3)))
bind_iterations.mcmc.list <- function(x, x2, ...) {
  if (!(vld_s3_class(x2, "mcmc.list") || vld_s3_class(x2, "mcmc"))) {
    if (!vld_all_identical(lapply(x, lapply, dims))) {
      abort_chk("`x2` must inherit from S3 class 'mcmc.list' or 'mcmc'.")
    }
  }

  x <- sort(x)
  x2 <- sort(x2)

  if (!identical(pars(x), pars(x2))) {
    abort_chk("`x` and `x2` must have the same parameters")
  }

  if (!identical(pdims(x), pdims(x2))) {
    abort_chk("`x` and `x2` must have the same parameter dimensions")
  }

  if (!identical(nchains(x), nchains(x2))) {
    abort_chk("`x` and `x2` must have the same number of chains")
  }

  x <- mapply(x, x2, FUN = bind_iterations, SIMPLIFY = FALSE)
  set_class(x, "mcmc.list")
}
