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
  deprecate_soft("0.1.0.9001",
    what = "is.natomic()",
    with = "is_natomic()"
  )  
  is_natomic(x)
}

#' @describeIn deprecated Is nlist
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [is_nlist()]
#' @export
is.nlist <- function(x) {
  deprecate_soft("0.1.0.9001",
    what = "is.nlist()",
    with = "is_nlist()"
  )  
  is_nlist(x)
}

#' @describeIn deprecated Is nlists
#'
#' \lifecycle{soft-deprecated}
#'
#' Replace by [is_nlists()]
#' @export
is.nlists <- function(x) {
  deprecate_soft("0.1.0.9001",
    what = "is.nlists()",
    with = "is_nlists()"
  )  
  is_nlists(x)
}
