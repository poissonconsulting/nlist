#' Term Data Frame
#'
#' Creates a \code{term-data-frame} from an \code{nlist-object}.
#'
#' @param x An R object.
#' @param ... Unused.
#' @return A term data frame.
#' @seealso \code{\link{nlist-object}} and \code{\link[term]{term-data-frame}}
#' @export
#' 
#' @examples
#' term::term_df(nlist(x = 1, y = matrix(1:4, 2)))
term_df.nlist <- function(x, ...) {
  x <- as.matrix(x)
  if(!nrow(x)) 
    return(tibble(term = as.term("parameter"), n1 = 1)[-1,])
  tibble(term = list(term = as.term(rownames(x))), n1 = as.vector(x))
}

#' Term Data Frame
#'
#' Creates a \code{term-data-frame} from an \code{nlists-object}.
#'
#' @param x An R object.
#' @param ... Unused.
#' @return A term data frame.
#' @seealso \code{\link{nlists-object}} and \code{\link[term]{term-data-frame}}
#' @export
#' 
#' @examples
#' term::term_df(nlists(nlist(x = 1, y = matrix(1:4, 2)),
#'                      nlist(x = 10, y = matrix(0:3, 2))))
term_df.nlists <- function(x, ...) {
  x <- as.matrix(x)
  if(!nrow(x)) return(tibble(term = as.term("parameter"))[-1,,drop=FALSE])
  colnames(x) <- p0("n", colnames(x))
  term <- as.term(rownames(x))
  x <- as.list(as.data.frame(x))
  x <- c(term = list(term), x)
  do.call("tibble", x)
}
