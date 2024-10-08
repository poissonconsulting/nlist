#' Coerce to nlists
#'
#' Coerce an R object to an [nlists_object()].
#'
#' @inheritParams params
#' @return An nlists object.
#' @family coerce
#' @export
#' @examples
#' as_nlists(list(nlist(x = c(1, 5)), nlist(x = c(2, 3)), nlist(x = c(3, 2))))
as_nlists <- function(x, ...) {
  UseMethod("as_nlists")
}

#' @rdname as_nlist
#' @export
as.nlists <- function(x, ...) {
  deprecate_warn("0.1.1",
    what = "nlist::as.nlists()",
    with = "nlist::as_nlists()"
  )
  UseMethod("as_nlists")
}

#' @describeIn as_nlists Coerce list to nlists
#' @export
as_nlists.list <- function(x, ...) {
  x <- lapply(x, as_nlist)
  class(x) <- "nlists"
  chk_nlists(x)
  x
}

#' @describeIn as_nlists Coerce mcmc to nlists
#' @export
as_nlists.mcmc <- function(x, ...) {
  chk_unused(...)
  rlang::check_installed("mcmcr", "to convert mcmc objects to nlist.")
  mcmcr::as_nlists(mcmcr::as.mcmcr(x))
}

#' @describeIn as_nlists Coerce mcmc.list to nlists
#' @export
as_nlists.mcmc.list <- function(x, ...) {
  nchains <- nchains(x)
  x <- as_mcmc(x)
  x <- as_nlists(x)
  if (nchains != 1L) {
    attr(x, "nchains") <- nchains
  }
  x
}

#' @describeIn as_nlists Coerce nlist to nlists
#' @export
as_nlists.nlist <- function(x, ...) {
  x <- list(x)
  class(x) <- "nlists"
  x
}

#' @export
as_nlists.nlists <- function(x, ...) x
