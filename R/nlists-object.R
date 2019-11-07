#' nlists Object
#'
#' An nlists object is a S3 class list of [nlist_object()] elements
#' with the same names, dimensionalities and typeofs.
#'
#' nlists objects are useful for storing individual realizations
#' of a simulated data set.
#' @name nlists-object
#' @aliases nlists_object
#'
#' @examples
#' nlists(nlist(x = 1, zz = matrix(1:9, 3)), nlist(x = 3.5, zz = matrix(2:10, 3)))
NULL
