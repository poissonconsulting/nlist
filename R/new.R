#' New nlist Object
#' 
#' Creates a new zero-length nlist object.
#' Users are expected to create nlist objects from data using the as.nlist functions.
#'
#' @return A zero-length named list of class nlist.
#' @export
#'
#' @examples
#' new_nlist()
new_nlist <- function() {
  structure(list(), .Names = character(0), class = "nlist")
}
