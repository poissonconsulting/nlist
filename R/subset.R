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
