#' Flatten nlist Object
#'
#' Simplifies an nlist object to an named atomic vector
#' where the names are the terms.
#'
#' @param x An nlist object.
#' @return An named atomic numeric vector of the values in x.
#' @seealso [as.nlist.numeric()] and [relist_nlist()]
#' @export
#' @examples
#' unlist_nlist(nlist(y = 2, x = matrix(4:7, ncol = 2)))
unlist_nlist <- function(x) {
  chk_s3_class(x, "nlist")
  y <- unlist(unclass(x))
  if (is.null(y)) y <- numeric(0)
  names(y) <- as.term(x)
  y
}

#' Flatten nlist Object
#'
#' @param x An nlist object.
#' @param recursive Ignored.
#' @param use.names A flag specifying whether to preserve names.
#' @return An named atomic numeric vector of the values in x.
#' @seealso [unlist_nlist()]
#' @method unlist nlist
#' @export
#' @examples
#' unlist(nlist(y = 2, x = matrix(4:7, ncol = 2)))
unlist.nlist <- function(x, recursive = TRUE, use.names = TRUE) {
  chk_flag(use.names)
  x <- unlist_nlist(x)
  if (!use.names) x <- unname(x)
  x
}
