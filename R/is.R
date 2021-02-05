#' Is numeric, nlist or nlists
#'
#' Ask whether x is a numeric object,
#' [nlist_object()] or [nlists_object()].
#'
#' @inheritParams params
#' @return A flag indicating whether x is a numeric object or inherits from S3 class nlist or nlists.
#' @export
#'
#' @examples
#' # is_numeric
#' is_numeric(list(x = 1))
#' is_numeric(1)
is_numeric <- function(x) {
  is.numeric(x)
}

#' @describeIn is_numeric Is nlist
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

#' @describeIn is_numeric Is nlists
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
