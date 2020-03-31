#' Create nlists Object
#'
#' Creates an [nlists_object()] from one of more [nlist_object()]s.
#'
#' An nlists object is a S3 class list of [nlist_object()] elements
#' with the same names, dimensionalities and typeofs.
#'
#' nlists objects are useful for storing individual realizations
#' of a simulated data set.
#'
#' @param ... nlist objects.
#' @return An nlists object.
#' @aliases nlists-object nlists_object
#' @export
#'
#' @examples
#' nlists()
#' nlists(nlist())
#' nlists(nlist(x = 1))
#' nlists(nlist(x = 1), nlist(x = -3))
nlists <- function(...) {
  args <- list(...)
  if (length(args)) {
    return(as_nlists(args))
  }

  structure(list(), class = "nlists")
}
