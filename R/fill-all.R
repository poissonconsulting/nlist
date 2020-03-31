#' @export
extras::fill_all

#' @inherit extras::fill_all
#' @inheritParams params
#' @export
#' @examples
#' fill_all(nlist(x = c(2, NA), y = matrix(c(1:3, NA), nrow = 2)))
#' fill_all(nlist(x = c(2, NA), y = matrix(c(1:3, NA), nrow = 2)), nas = FALSE)
fill_all.nlist <- function(x, value = 0L, nas = TRUE, ...) {
  chk_number(value)
  chk_flag(nas)
  chk_unused(...)
  x <- lapply(x, fill_all, value = value, nas = nas)
  class(x) <- "nlist"
  x
}

#' @inherit extras::fill_all
#' @inheritParams params
#' @export
#' @examples
#' fill_all(nlists(nlist(x = c(2, NA)), nlist(x = c(NA_real_, NA))))
#' fill_all(nlists(nlist(x = c(2, NA)), nlist(x = c(NA_real_, NA))), nas = FALSE)
fill_all.nlists <- function(x, value = 0L, nas = TRUE, ...) {
  chk_unused(...)
  x <- lapply(x, fill_all, value = value, nas = nas)
  class(x) <- "nlists"
  x
}
