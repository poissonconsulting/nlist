#' @export
universals::as_list

#' @inherit universals::as_list
#' @export
#' @examples
#' as_list(nlists(nlist(x = 1)))
#' as_list(nlists(nlist(x = 1), nlist(x = 3)))
as_list.nlists <- function(x, ...) {
  x <- lapply(x, as_list)
  do.call("c", x)
}
