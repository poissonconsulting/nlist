#' Is natomic, nlist or nlists
#'
#' Test whether x is a [natomic_object()],
#' [nlist_object()] or [nlists_object()].
#'
#' @param x The object to test.
#'
#' @return A flag indicating whether x is a natomic object (is atomic and numeric) or inherits from S3 class nlist or nlists.
#' @name is_natomic
NULL

#' @describeIn is_natomic Is natomic
#' @export
#'
#' @examples
#' # is_natomic
#' is_natomic(list(x = 1))
#' is_natomic(1)
is_natomic <- function(x) {
  is.atomic(x) && is.numeric(x)
}

#' @describeIn is_natomic Is nlist
#'
#' @export
#'
#' @examples
#'
#' # is_nlist
#' is_nlist(1)
#' is_nlist(list(x = 1))
#' is_nlist(nlist(x = 1))
is_nlist <- function(x) {
  vld_s3_class(x, "nlist")
}

#' @describeIn is_natomic Is nlists
#'
#' @export
#'
#' @examples
#'
#' # is_nlists
#' is_nlists(nlist(x = 1))
#' is_nlists(nlists(nlist(x = 2), nlist(x = 3.5)))
is_nlists <- function(x) {
  vld_s3_class(x, "nlists")
}
