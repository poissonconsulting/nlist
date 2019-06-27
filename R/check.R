#' Check Atomic Numeric
#'
#' @inheritParams checkr::check_length
#' @param length A flag indicating whether x should have elements 
#' (versus no elements) or a missing value indicating no requirements.
#' @param nas A flag indicating whether x should only have missing values
#' (versus no missing values) or a missing value indicating no requirements.
#'
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#'
#' @examples
#' check_atomic_numeric(1)
check_atomic_numeric <- function(x, length = NA, nas = NA, 
                                 x_name = substitute(x), error = TRUE) {
  check_scalar(length, c(TRUE, NA))
  check_scalar(nas, c(TRUE, NA))
  
  x_name <- chk_deparse(x_name)
  
  if(!is.atomic(x)) 
    err(x_name, " must be an atomic (vector, matrix or array) object")
  if(!is.numeric(x)) 
    err(x_name, " must be a numeric (integer or double) object")
  
  check_length(x, length = length, x_name = x_name, error = error)
  if(!length(x)) return(invisible(x))
  
  if(isFALSE(nas) && any(is.na(x))) 
    err(x_name, " must not include missing values")
  if(isTRUE(nas) && !all(is.na(x))) 
    err(x_name, " must only include missing values")
  invisible(x)
}

#' Check nlist
#' 
#' Checks if an object is a numeric list.
#'
#' @inheritParams checkr::check_length
#' @inheritParams check_atomic_numeric
#' @param length A flag indicating whether x and the elements of x should have elements 
#' (versus no elements) or a missing value indicating no requirements.
#' @param class A flag indicating whether x should inherit from nlist
#' (versus not inherit) or a missing value indicating no requirements.
#'
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#' @examples 
#' check_nlist(new_nlist())
check_nlist <- function(x, length = NA, nas = NA, class = TRUE, 
                        x_name = substitute(x), error = TRUE) {
  check_list(x)
  check_length(x, length = length)
  check_named(x, unique = TRUE, error = error)
  
  if(isFALSE(class) && is.nlist(x)) 
    err(x_name, " must inherit from class nlist")
  if(isTRUE(class) && !is.nlist(x)) 
    err(x_name, " must not inherit from class nlist")
  
  if(length(x))
    mapply(check_atomic_numeric, x, p("element", names(x), "of", x_name))
  
  invisible(x)
}
