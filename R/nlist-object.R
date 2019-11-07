#' nlist Object
#'
#' An nlist object is an S3 class list of uniquely named
#' [natomic_object()] elements.
#'
#' nlist objects are the raw data inputs for analytic engines
#' such as JAGS, STAN and TMB.
#' @name nlist-object
#' @aliases nlist_object
#'
#' @examples
#' nlist <- nlist(x = 1, zz = matrix(1:9, 3))
#' str(nlist)
#' nlist
NULL
