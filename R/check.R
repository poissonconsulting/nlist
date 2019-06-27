
#' Check nlist
#' 
#' Checks if an object is a numeric list.
#'
#' @param x The object to check.
#' @param length A flag specifying whether x should have elements 
#' (versus no elements) or a missing value indicating no requirements or 
#' a count or count range of the number of elements or 
#' a count vector of the permitted number of elements.
#' @param sorted xx
#' @param class xx
#' @param x_name xx
#' @param error xx
#'
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
check_nlist <- function(x, length = NA, sorted = FALSE, class = FALSE, 
                        x_name = substitute(x), error = TRUE) {
  
  if(class) check_classes(x, "nlist")
}
