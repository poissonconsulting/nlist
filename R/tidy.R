#' @export
generics::tidy

#' @inherit generics::tidy
#'
#' @export
#' @examples
#' tidy(nlists(
#'   nlist(x = 1, y = 4:6),
#'   nlist(x = 3, y = 7:9)
#' ))
tidy.nlists <- function(x, ...) {
  chk_unused(...)
  if (!length(x) || !length(x[[1]])) {
    return(tibble::tibble(
      term = term(x = 0),
      estimate = numeric(0),
      sd = numeric(0),
      zscore = numeric(0),
      lower = numeric(0),
      upper = numeric(0),
      svalue = numeric(0)
    ))
  }

  estimate <- unlist(estimates(x, median))
  term <- as_term(names(estimate))
  estimate <- unname(estimate)
  sd <- unname(unlist(estimates(x, sd)))
  zscore <- unname(unlist(estimates(x, zscore)))
  lower <- unname(unlist(estimates(x, lower)))
  upper <- unname(unlist(estimates(x, upper)))
  svalue <- unname(unlist(estimates(x, svalue)))

  tibble::tibble(
    term = term, estimate = estimate,
    sd = sd, zscore = zscore, lower = lower,
    upper = upper, svalue = svalue
  )
}
