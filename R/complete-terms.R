#' @importFrom term complete_terms
#' @export 
term::complete_terms

#' Complete Terms
#'
#' Adds any absent elements to an mcmc object.
#'
#' The terms are repaired before being completed.
#' Missing or invalid or inconsistent terms are dropped with a warning.
#'
#' @param x An mcmc object.
#' @param silent A flag specifying whether to suppress warning messages.
#' @param ... Unused
#' @return The repaired and complete mcmc object.
#' @export
#'
#' @examples
#' mcmc <- as_mcmc(nlist(beta = matrix(1:4, nrow = 2)))
#' mcmc <- mcmc[, -4, drop = FALSE]
#' complete_terms(mcmc)
complete_terms.mcmc <- function(x, silent = FALSE, ...) {
  chk_flag(silent)
  chk_unused(...)
  
  if (!silent && anyNA(colnames(x))) {
    wrn("terms with missing values have been dropped")
  }

  x <- as.matrix(x)
  x <- x[,!is.na(colnames(x)), drop = FALSE]
  colnames(x) <- as.character(as_term(colnames(x), repair = TRUE))
  if (anyNA(!silent && anyNA(colnames(x)))) wrn("invalid terms have been dropped")
  x <- x[, !is.na(colnames(x)), drop = FALSE]
  if (!ncol(x)) {
    return(coda::as.mcmc(x))
  }
  consistent <- consistent_term(as_term(colnames(x)))
  if (anyNA(!silent && any(!consistent))) {
    wrn("inconsistent terms have been dropped")
  }
  x <- x[, consistent, drop = FALSE]
  
  if (!ncol(x)) {
    return(coda::as.mcmc(x))
  }
  pdims <- pdims(as_term(colnames(x)))
  absent <- setdiff(term(!!!pdims), as_term(colnames(x)))
  if (length(absent)) {
    na <- if (is.integer(x[[1]])) NA_integer_ else NA_real_
    matrix <- matrix(na, ncol = length(absent), nrow = nrow(x))
    colnames(matrix) <- absent
    mcpar <- attr(x, "mcpar")
    x <- cbind(x, matrix)
    attr(x, "mcpar") <- mcpar
  }
  x <- x[, order(as_term(colnames(x))), drop = FALSE]
  coda::as.mcmc(x)
}
