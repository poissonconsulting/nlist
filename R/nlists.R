#' Create nlists Object
#' 
#' Creates a nlists object from one of more nlist objects.
#' @param ... nlist objects.
#' @return An nlists object.
#' @export
#'
#' @examples
#' nlists()
nlists <- function(...) {
  args <- list(...)
  if(length(args)) return(as.nlists(args))
  
  structure(list(), class = "nlists")
}
