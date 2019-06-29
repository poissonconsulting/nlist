check_identical <- function(x, x_name) {
  if(length(x) < 2) return(x)
  identical <- vapply(x, identical, TRUE, y = x[[1]])
  if(!all(identical)) 
    err("the ", x_name, " must be identical")
  x
}

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
#' check_natomic(1)
check_natomic <- function(x, length = NA, nas = NA, 
                          x_name = substitute(x)) {
  check_scalar(length, c(TRUE, NA))
  check_scalar(nas, c(TRUE, NA))
  
  x_name <- chk_deparse(x_name)
  
  if(!is.atomic(x)) 
    err(x_name, " must be an atomic (vector, matrix or array) object")
  if(!is.numeric(x)) 
    err(x_name, " must be a numeric (integer or double) object")
  
  check_length(x, length = length, x_name = x_name)
  if(!length(x)) return(invisible(x))
  
  if(isFALSE(nas) && any(is.na(x))) 
    err(x_name, " must not include missing values")
  if(isTRUE(nas) && !all(is.na(x))) 
    err(x_name, " must only include missing values")
  invisible(x)
}

.check_natomic <- function(x, x_name, length, nas)
  check_natomic(x, length = length, nas = nas, x_name = x_name)

#' Check nlist
#' 
#' Checks if an object is a numeric list.
#'
#' @inheritParams checkr::check_length
#' @inheritParams check_natomic
#' @param length A flag indicating whether x and the elements of x should have elements 
#' (versus no elements) or a missing value indicating no requirements.
#' @param class A flag indicating whether x should inherit from nlist
#' (versus not inherit) or a missing value indicating no requirements.
#'
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
#' @examples 
#' check_nlist(nlist())
check_nlist <- function(x, length = NA, nas = NA, class = TRUE, 
                        x_name = substitute(x)) {
  x_name <- chk_deparse(x_name)
  check_scalar(class, c(TRUE, NA))

  if(isTRUE(class) && !is.nlist(x)) 
    err(x_name, " must inherit from class nlist")
  if(isFALSE(class) && is.nlist(x)) 
    err(x_name, " must not inherit from class nlist")
  
  check_list(x, x_name = x_name)
  check_length(x, length = length, x_name = x_name)
  check_named(x, unique = TRUE, x_name = x_name)
  
  if(!length(x)) return(invisible(x))
  
  mapply(.check_natomic, x, p("element", names(x), "of", x_name),
         MoreArgs = list(length = length, nas = nas))
  
  invisible(x)
}

.check_nlist <- function(x, x_name, length, nas, class)
  check_nlist(x, length = length, nas = nas, class = class, x_name = x_name)

#' Check nlist
#' 
#' Checks if an object is a numeric list.
#'
#' @inheritParams checkr::check_length
#' @inheritParams check_natomic
#' @param length A flag indicating the nlist elements should have elements 
#' (versus no elements) or a missing value indicating no requirements.
#' @param class A flag indicating whether x should inherit from nlists and the elements from nlist
#' (versus not inherit) or a missing value indicating no requirements.
#'
#' @return An invisible copy of x (if it doesn't throw an error).
#' @export
check_nlists <- function(x, length = NA, nas = NA, class = TRUE, 
                         x_name = substitute(x)) {
  x_name <- chk_deparse(x_name)
  check_scalar(class, c(TRUE, NA))
  
  if(isTRUE(class) && !is.nlists(x)) 
    err(x_name, " must inherit from class nlists")
  if(isFALSE(class) && is.nlists(x)) 
    err(x_name, " must not inherit from class nlists")
  
  check_list(x, x_name = x_name)
  check_length(x, length = TRUE, x_name = x_name)
  
  mapply(.check_nlist, x, p("element", 1:length(x), "of", x_name),
         MoreArgs = list(length = length, nas = nas, class = class))

  check_identical(lapply(x, names), x_name = p("names of", x_name))
  check_identical(lapply(x, dims), x_name = p("dims of", x_name))
  check_identical(lapply(x, typeof), x_name = p("type of", x_name))
  
  invisible(x)
}
