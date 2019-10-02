#' natomic Object
#'
#' An natomic object is an integer or double vector, matrix or array.
#'
#' @name natomic-object
#' @aliases natomic_object
#'
#' @examples
#' mat <- matrix(c("1", "2", "3", "4"), 2L)
#' mat
#' is.natomic(mat)
#' mat <- numericize(mat)
#' mat
#' is.natomic(mat)
NULL
