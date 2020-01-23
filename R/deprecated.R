#' Deprecated Functions
#'
#' @inheritParams params
#' @keywords internal
#' @name deprecated
NULL

#' @describeIn deprecated Is natomic
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [is_natomic()]
#' @export
is.natomic <- function(x) {
  deprecate_soft("0.0.1",
    what = "is.natomic()",
    with = "is_natomic()"
  )  
  is_natomic(x)
}