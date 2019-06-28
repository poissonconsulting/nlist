#' @export
median.nlist <- function(x, na.rm = FALSE, ...) {
  check_unused(...)
  lapply(x, median, na.rm = na.rm)
}

#' @export
median.nlists <- function(x, na.rm = FALSE, ...) {
  check_nlist(x)
  check_flag(na.rm)
  check_unused(...)
  
  .NotYetImplemented()
  x
}
