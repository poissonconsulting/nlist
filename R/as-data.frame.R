#' @method as.data.frame nlist
#' @export
as.data.frame.nlist <- function(x, ...) {
  x <- as.matrix(x)
  if(!nrow(x)) 
    return(tibble(term = as.term("parameter"), n1 = 1)[-1,])
  tibble(term = list(term = as.term(rownames(x))), n1 = x[[1]])
}
