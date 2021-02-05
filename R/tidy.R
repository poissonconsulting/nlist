#' @export
generics::tidy

#' @inheritParams params
#' @inherit generics::tidy
#' @export
tidy.mcmc <- function(x, simplify = FALSE, ...) {
  chk_unused(...)
  tidy(as_nlists(x), simplify = simplify)
}

#' @inheritParams params
#' @inherit generics::tidy
#'
#' @export
tidy.mcmc.list <- function(x, simplify = FALSE, ...) {
  chk_unused(...)
  tidy(as_nlists(x), simplify = simplify)
}

#' @inheritParams params
#' @inherit generics::tidy
#'
#' @export
#' @examples
#' tidy(nlists(
#'   nlist(x = 1, y = 4:6),
#'   nlist(x = 3, y = 7:9)
#' ), simplify = TRUE)
tidy.nlists <- function(x, simplify = FALSE, ...) {
  chk_flag(simplify)
  chk_unused(...)
  
  if(!simplify) {
    lifecycle::deprecate_warn("0.3.1", "tidy(simplify = 'must be TRUE')")
  }
  if (!length(x) || !length(x[[1]])) {
    term <- term(x = 0)
    estimate <- numeric(0)
    sd <- numeric(0)
    zscore <- numeric(0)
    lower <- numeric(0)
    upper <- numeric(0)
    svalue <- numeric(0)
    
    if(simplify) {
      return(tibble::tibble(
        term = term, estimate = estimate,
        lower = lower, upper = upper, svalue = svalue
      ))
    } 
    return(tibble::tibble(
      term = term, estimate = estimate,
      sd = sd, zscore = zscore, 
      lower = lower, upper = upper, svalue = svalue
    ))
    
  } else {
    estimate <- unlist(estimates(x, median))
    term <- as_term(names(estimate))
    estimate <- unname(estimate)
    sd <- unname(unlist(estimates(x, sd)))
    zscore <- unname(unlist(estimates(x, zscore)))
    lower <- unname(unlist(estimates(x, lower)))
    upper <- unname(unlist(estimates(x, upper)))
    svalue <- unname(unlist(estimates(x, svalue)))
  }
  if(simplify) {
    return(  tibble::tibble(
      term = term, estimate = estimate,
      lower = lower,
      upper = upper, svalue = svalue
    ))
  }
  
  tibble::tibble(
    term = term, estimate = estimate,
    sd = sd, zscore = zscore, lower = lower,
    upper = upper, svalue = svalue
  )
}
