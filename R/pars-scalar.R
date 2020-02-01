#' @export
term::pars_scalar

#' @inherit term::pars_scalar
#' @inheritParams params
#' @export
#'
#' @examples
#' pars_scalar(nlist(zz = 1, y = 3:6))
pars_scalar.nlist <- function(x, ...) {
  pars_scalar(as.term(x))
}

#' @inherit term::pars_scalar
#' @inheritParams params
#' @export
#'
#' @examples
#' pars_scalar(nlists(nlist(zz = 1, y = 3:6), nlist(zz = 4, y = 13:16)))
pars_scalar.nlists <- function(x, ...) {
  if (!length(x)) {
    return(character(0))
  }
  pars_scalar(x[[1]])
}
