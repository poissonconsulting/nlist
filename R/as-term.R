#' @importFrom term as_term
#' @export
term::as_term

#' @importFrom term as.term
#' @export
term::as.term

#' Coerce to a Term Vector
#'
#' @inheritParams params
#' @family coerce term
#' @export
#' @examples
#' as_term(as_mcmc(nlist(x = matrix(1:4, ncol = 2))))
as_term.mcmc <- function(x, ...) {
  chk_unused(...)
  as_term(colnames(x))
}

#' Coerce to a Term Vector
#'
#' @inheritParams params
#' @family coerce term
#' @export
#' @examples
#' as_term(nlist(x = matrix(1:4, ncol = 2)))
as_term.nlist <- function(x, ...) {
  chk_unused(...)
  x <- mapply(as_term, x, names(x), SIMPLIFY = FALSE)
  x <- unname(unlist(x))
  if (is.null(x)) {
    return(term(x = 0))
  }
  as_term(x)
}

#' Coerce to a Term Vector
#'
#' @inheritParams params
#' @family coerce term
#' @export
#' @examples
#' as_term(nlists(nlist(x = matrix(1:4, ncol = 2))))
as_term.nlists <- function(x, ...) {
  chk_unused(...)
  if (!length(x)) {
    return(term(x = 0))
  }
  as_term(x[[1]])
}
