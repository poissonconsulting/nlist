#' Deprecated Functions
#'
#' @inheritParams params
#' @keywords internal
#' @name deprecated
NULL

#' @describeIn deprecated Is natomic
#'
#' \lifecycle{defunct}
#'
#' Replace by [is_numeric()]
#' @export
is.natomic <- function(x) {
  deprecate_stop(
    "0.1.1",
    what = "nlist::is.natomic()",
    with = "nlist::is_numeric()"
  )
}

#' @describeIn deprecated Is nlist
#'
#' \lifecycle{defunct}
#'
#' Replace by [is_nlist()]
#' @export
is.nlist <- function(x) {
  deprecate_stop(
    "0.1.1",
    what = "nlist::is.nlist()",
    with = "nlist::is_nlist()"
  )
}

#' @describeIn deprecated Is nlists
#'
#' \lifecycle{defunct}
#'
#' Replace by [is_nlists()]
#' @export
is.nlists <- function(x) {
  deprecate_stop(
    "0.1.1",
    what = "nlist::is.nlists()",
    with = "nlist::is_nlists()"
  )
}
