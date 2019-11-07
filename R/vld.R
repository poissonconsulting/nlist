#' Validate Numeric Atomic, nlist Object or nlists Object
#'
#' @inheritParams chk::chk_true
#' @return A flag indicating whether the object was validated.
#' @seealso [chk_natomic()]
#' @name vld_natomic
NULL

#' @describeIn vld_natomic Validate Numeric Atomic
#'
#' @export
#'
#' @examples
#' #' vld_natomic
#' vld_natomic(1)
#' vld_natomic(matrix(1L))
#' try(vld_natomic(TRUE))
vld_natomic <- function(x) is.numeric(x) && is.atomic(x)

#' @describeIn vld_natomic Validate nlist Object
#'
#' @export
#'
#' @examples
#'
#' # vld_nlist
#' vld_nlist(nlist(x = 1))
#' try(vld_nlist(list(x = 1)))
vld_nlist <- function(x) {
  vld_s3_class(x, "nlist") && vld_named(x) && vld_unique(names(x)) &&
    vld_all(x, vld_natomic)
}

#' @describeIn vld_natomic Validate nlists Object
#'
#' @export
#'
#' @examples
#'
#' # vld_nlists
#' vld_nlists(nlists(nlist(x = 1)))
#' vld_nlists(1)
vld_nlists <- function(x) {
  vld_s3_class(x, "nlists") && vld_all(x, vld_nlist) &&
    vld_all_identical(lapply(x, names)) &&
    vld_all_identical(lapply(x, lapply, dims)) &&
    vld_all_identical(lapply(x, lapply, typesof))
}
