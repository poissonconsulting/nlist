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
    what = "nlist::is.natomic()",
    with = "nlist::is_natomic()"
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
    what = "nlist::is.nlist()",
    with = "nlist::is_nlist()"
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
    what = "nlist::is.nlists()",
    with = "nlist::is_nlists()"
  )  
  is_nlists(x)
}
