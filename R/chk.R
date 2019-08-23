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
  if(!is_chk_on()) return(TRUE)
  if(is.null(x_name)) x_name <- p0("`", deparse(substitute(x)), "`")
  if(!chk_is(x, "nlist", err = err, x_name = x_name)) return(FALSE)
  if(!chk_named(x, err = err, x_name = x_name)) return(FALSE)
  if(!chk_unique(names(x), err = err, x_name = p0("names(", x_name, ")")))
    return(FALSE)
  chk_all(x, chk_natomic, err = err, x_name = x_name)
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
  if(!is_chk_on()) return(TRUE)
  if(is.null(x_name)) x_name <- p0("`", deparse(substitute(x)), "`")
  if(!chk_is(x, "nlists", err = err, x_name = x_name)) return(FALSE)
  if(!chk_all(x, chk_nlist, err = err, x_name = x_name)) return(FALSE)
  if(!chk_all_identical(lapply(x, names), err = FALSE)) {
    if(err == FALSE) return(FALSE)
    err("nlist elements of ", x_name, " must have matching names.")
  }
  if(!chk_all_identical(lapply(x, lapply, dims), err = FALSE)) {
    if(err == FALSE) return(FALSE)
    err("nlist elements of ", x_name, " must have matching dimensions.")
  }
  if(!chk_all_identical(lapply(x, lapply, typesof), err = FALSE)) {
    if(err == FALSE) return(FALSE)
    err("nlist elements of ", x_name, " must have matching types.")
  }
  TRUE
}
