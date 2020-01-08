#' Check Numeric Atomic, nlist Object or nlists Object
#'
#' @inheritParams chk::chk_true
#' @return `NULL`, invisibly. Called for the side effect of throwing an error
#'   if the condition is not met.
#' @seealso [vld_natomic()]
#' @name chk_natomic
NULL

#' @describeIn chk_natomic Check Numeric Atomic
#'
#' @description
#'
#' `chk_natomic`
#' checks if numeric object using
#'
#' `is.numeric(x) && is.atomic(x)`.
#' @export
#'
#' @examples
#'
#' # chk_natomic
#' chk_natomic(1)
#' chk_natomic(matrix(1L))
#' try(chk_natomic(TRUE))
chk_natomic <- function(x, x_name = NULL) {
  if (vld_natomic(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  abort_chk(
    x_name, " must be a numeric (integer or double)",
    " atomic (vector, matrix or array) object."
  )
}

#' @describeIn chk_natomic Check nlist Object
#'
#' @description
#'
#' `chk_natomic`
#' checks if an [nlist-object()] while ignoring the class.
#'
#' @export
#'
#' @examples
#'
#' # chk_nlist
#' chk_nlist(nlist(x = 1))
#' try(chk_nlist(list(x = 1)))
chk_nlist <- function(x, x_name = NULL) {
  if (vld_nlist(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_s3_class(x, "nlist", x_name = x_name)
  chk_named(x, x_name = x_name)
  if (!vld_unique(names(x))) {
    abort_chk("names(", x_name, ") must be unique.", tidy = FALSE)
  }
  chk_all(x, chk_natomic, x_name = x_name)
}

#' @describeIn chk_natomic Check nlists Object
#'
#' @description
#' `chk_nlists`
#' checks if an [nlists-object()] while ignoring the class.
#'
#' @export
#'
#' @examples
#'
#' # chk_nlists
#' chk_nlists(nlists(nlist(x = 1)))
chk_nlists <- function(x, x_name = NULL) {
  if (vld_nlists(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_s3_class(x, "nlists", x_name = x_name)
  chk_all(x, chk_nlist, x_name = x_name)
  if (!vld_all_identical(lapply(x, names))) {
    abort_chk("nlist elements of ", x_name, " must have matching names.", tidy = FALSE)
  }
  if (!vld_all_identical(lapply(x, lapply, dims))) {
    abort_chk("nlist elements of ", x_name, " must have matching dimensions.", tidy = FALSE)
  }
  abort_chk("nlist elements of ", x_name, " must have matching types.", tidy = FALSE)
}
