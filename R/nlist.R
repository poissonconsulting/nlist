#' Create nlist Object
#' 
#' Creates a nlist object from one of more uniquely named atomic numeric arguments.
#' @param ... Uniquely named atomic numeric objects.
#' @return An nlist object.
#' @export
#'
#' @examples
#' nlist()
nlist <- function(...) {
  args <- list(...)
  if(!length(args))
  return(structure(list(), .Names = character(0), class = "nlist"))
}
