#' Check Numeric Atomic
#' 
#' Checks if numeric atomic object.
#' 
#' Checks if numeric object using:
#' 
#' \code{is.numeric(x) && is.atomic(x)}
#'
#' @inheritParams chk::chk_true
#'
#' @return TRUE if passes check. Otherwise if throws an informative error 
#' unless err = FALSE in which case it returns FALSE.
#' @export
#'
#' @examples
#' chk_natomic(1)
#' chk_natomic(matrix(1L))
#' chk_natomic(TRUE, err = FALSE)
chk_natomic <- function(x, err = TRUE, x_name = NULL) {
  if(is.numeric(x) && is.atomic(x)) return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name)) x_name <- p0("`", deparse(substitute(x)), "`")
  err(x_name, " must be a numeric (integer or double)",
      " atomic (vector, matrix or array) object.")
}

#' Check nlist
#' 
#' Checks if an \code{\link{nlist-object}} while ignoring the class.
#'
#' @inheritParams chk::chk_true
#'
#' @return TRUE if passes check. Otherwise if throws an informative error 
#' unless err = FALSE in which case it returns FALSE.
#' @export
#'
#' @examples
#' chk_nlist(nlist(x = 1))
chk_nlist <- function(x, err = TRUE, x_name = NULL) {
  if(is.list(x) && !is.null(names(x)) && !anyDuplicated(names(x)) && 
     chk_all(x, chk_natomic, err = FALSE))
    return(TRUE)
  if(!err) return(FALSE)
  if(is.null(x_name)) x_name <- p0("`", deparse(substitute(x)), "`")
  chk_list(x, x_name = x_name)
  chk_named(x, x_name = x_name)
  chk_unique(names(x), x_name = p0("names(", x_name, ")"))
  chk_all(x, chk_natomic, x_name = x_name)
}

#' Check nlists
#' 
#' Checks if an \code{\link{nlists-object}} while ignoring the class.
#'
#' @inheritParams chk::chk_true
#'
#' @return TRUE if passes check. Otherwise if throws an informative error 
#' unless err = FALSE in which case it returns FALSE.
#' @export
#'
#' @examples
#' chk_nlists(nlists(nlist(x = 1)))
chk_nlists <- function(x, err = TRUE, x_name = NULL) {
  if(is.list(x) && !length(x)) return(TRUE)
  if(!all(vapply(x, chk_nlist, TRUE, err = FALSE))) {
    if(!err) return(FALSE)
    if(is.null(x_name)) x_name <- p0("`", deparse(substitute(x)), "`")
    err(x_name, " must be a list of nlist objects.")    
  }
  names <- lapply(x, names)
  if(!all(vapply(names, identical, TRUE, y = names[[1]]))) {
    if(!err) return(FALSE)
    if(is.null(x_name)) x_name <- p0("`", deparse(substitute(x)), "`")
    err("nlist elements of ", x_name, " must have matching names.")
  }
  dims <- lapply(x, lapply, dims)
  if(!all(vapply(dims, identical, TRUE, y = dims[[1]]))) {
    if(!err) return(FALSE)
    if(is.null(x_name)) x_name <- p0("`", deparse(substitute(x)), "`")
    err("nlist elements of ", x_name, " must have matching dimensions.")
  }
  typesof <- lapply(x, typesof)
  if(!all(vapply(typesof, identical, TRUE, y = typesof[[1]]))) {
    if(!err) return(FALSE)
    if(is.null(x_name)) x_name <- p0("`", deparse(substitute(x)), "`")
    err("nlist elements of ", x_name, " must have matching types.")
  }
  TRUE
}
