#' numeric Object
#'
#' A numeric object is an integer or double vector, matrix or array.
#'
#' @name numeric-object
#' @aliases numeric_object
#'
#' @examples
#' mat <- matrix(c(TRUE, FALSE, NA, TRUE), 2L)
#' mat
#' is_numeric(mat)
#' mat <- extras::numericize(mat)
#' mat
#' is_numeric(mat)
NULL
