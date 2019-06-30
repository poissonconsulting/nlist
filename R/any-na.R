#' @export
anyNA.nlist <- function(x, recursive = FALSE) {
  anyNA(unclass(x), recursive = TRUE)
}

#' @export
anyNA.nlists <- function(x, recursive = FALSE) {
  x <- lapply(x, unclass)
  anyNA(unclass(x), recursive = TRUE)
}
