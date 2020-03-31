#' @export
extras::fill_na

#' @inherit extras::fill_na
#' @export
#' @examples
#' fill_na(nlist(x = c(2, NA), y = matrix(c(1:3, NA), nrow = 2)))
#' fill_na(nlists(nlist(x = c(2, NA)), nlist(x = c(NA_real_, NA))))
fill_na.nlist <- function(x, value = 0L, ...) {
  chk_scalar(value)
  chk_unused(...)
  x <- lapply(x, fill_na, value = value)
  class(x) <- "nlist"
  x
}

#' @inherit extras::fill_na
#' @export
#' @examples
#' fill_na(nlist(x = c(2, NA), y = matrix(c(1:3, NA), nrow = 2)))
fill_na.nlists <- function(x, value = 0L, ...) {
  chk_unused(...)
  x <- lapply(x, fill_na, value = value)
  class(x) <- "nlists"
  x
}
