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
#' is.nlist(list(x = 1))
#' is.nlists(1)
is.nlist <- function(x) {
  inherits(x, "nlist")
}

#' @describeIn is.nlist Is nlists
#' @export
is.nlists <- function(x) {
  inherits(x, "nlists")
}
