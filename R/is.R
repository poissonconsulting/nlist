#' Is natomic
#' 
#' Test whether x is a numeric, atomic object.
#' An natomic object is a vector, matrix or array of typeof integer or double.
#' 
#' @param x The object to test.
#'
#' @return A flag indicating whether x is a natomic object.
#' @export
#'
#' @examples
#' is.natomic(list(x = 1))
#' is.natomic(1)
is.natomic <- function(x) {
  is.atomic(x) && is.numeric(x)
}

#' Is nlist
#' 
#' Test whether x inherits from class \code{nlist} or \code{nlists}.
#'
#' @param x The object to test.
#'
#' @return A flag indicating whether x inherits from nlist or nlists.
#' @export
#'
#' @examples
#' is.nlist(1)
#' is.nlist(list(x = 1))
#' is.nlist(nlist(x = 1))
is.nlist <- function(x) {
  inherits(x, "nlist")
}

#' @describeIn is.nlist Is nlists
#' @export
#' 
#' @examples
#' is.nlists(nlist(x = 1))
#' is.nlists(nlists(nlist(x = 2), nlist(x = 3.5)))
is.nlists <- function(x) {
  inherits(x, "nlists")
}
