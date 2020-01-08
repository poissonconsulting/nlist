#' Create nlist Object
#'
#' Creates a [nlist_object()] from one of more uniquely named [natomic_object()] arguments.
#' @param ... Uniquely named atomic numeric objects.
#' @return An nlist object.
#' @export
#'
#' @examples
#' nlist()
#' nlist(x = 1)
#' nlist(y = 1:4, zz = matrix(1:9, 3))
nlist <- function(...) {
  args <- list(...)
  if (length(args)) {
    return(as.nlist(args))
  }
  structure(list(), .Names = character(0), class = "nlist")
}
