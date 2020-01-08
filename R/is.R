#' Is natomic, nlist or nlists
#'
#' Test whether x is a [natomic_object()],
#' [nlist_object()] or [nlists_object()].
#'
#' @param x The object to test.
#'
#' @return A flag indicating whether x is a natomic object (is atomic and numeric) or inherits from nlist or nlists.
#' @name is_natomic
NULL

#' @describeIn is_natomic Is natomic
#' @export
#'
#' @examples
#' # is.natomic
#' is.natomic(list(x = 1))
#' is.natomic(1)
is.natomic <- function(x) {
  is.atomic(x) && is.numeric(x)
}

#' @describeIn is_natomic Is nlist
#'
#' @export
#'
#' @examples
#'
#' # is.nlist
#' is.nlist(1)
#' is.nlist(list(x = 1))
#' is.nlist(nlist(x = 1))
is.nlist <- function(x) {
  inherits(x, "nlist")
}

#' @describeIn is_natomic Is nlists
#'
#' @export
#'
#' @examples
#'
#' # is.nlists
#' is.nlists(nlist(x = 1))
#' is.nlists(nlists(nlist(x = 2), nlist(x = 3.5)))
is.nlists <- function(x) {
  inherits(x, "nlists")
}
