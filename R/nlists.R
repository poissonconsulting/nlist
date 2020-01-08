#' Create nlists Object
#'
#' Creates an [nlists_object()] from one of more [nlist_object()]s.
#'
#' @param ... nlist objects.
#' @return An nlists object.
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
    return(as.nlists(args))
  }

  structure(list(), class = "nlists")
}
