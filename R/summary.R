#' @export
summary.nlist <- function(object, ...) {
  unclass(object)
}

#' @export
summary.nlists <- function(object, ...) {
  summary(median(object))
}
