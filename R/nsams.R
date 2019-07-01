#' Number of Sample Values
#'
#' @param x The R object.
#' @param ... Unused.
#' @return A count of the total number of sample values.
#' @export
#' @examples
#' nsams(nlists(nlist(x = c(2,9)), nlist(x = c(1,7))))
nsams <- function(x, ...) UseMethod("nsams")

#' @export
nsams.default <- function(x, ...) {
  nsims(x) * nterms(x)
}
