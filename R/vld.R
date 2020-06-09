#' Validate nlist Object or nlists Object
#'
#' @inheritParams chk::chk_true
#' @return A flag indicating whether the object was validated.
#' @export
#'
#' @examples
#'
#' # vld_nlist
#' vld_nlist(nlist(x = 1))
#' try(vld_nlist(list(x = 1)))
vld_nlist <- function(x) {
  vld_s3_class(x, "nlist") && vld_named(x) && vld_pars(names(x)) &&
    vld_all(x, vld_numeric)
}

#' @describeIn vld_nlist Validate nlists Object
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
