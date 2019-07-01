#' @method as.data.frame nlist
#' @export
as.data.frame.nlist <- function(x, ...) {
  x <- as.matrix(x)
  if(!nrow(x)) 
    return(tibble(term = as.term("parameter"), n1 = 1)[-1,])
  tibble(term = list(term = as.term(rownames(x))), n1 = x[[1]])
}

#' @method as.data.frame nlists
#' @export
as.data.frame.nlists <- function(x, ...) {
  x <- as.matrix(x)
  if(!nrow(x)) return(tibble(term = as.term("parameter"))[-1,,drop=FALSE])
  colnames(x) <- p0("n", colnames(x))
  term <- as.term(rownames(x))
  x <- as.list(as.data.frame(x))
  x <- c(term = list(term), x)
  do.call("tibble", x)
}
