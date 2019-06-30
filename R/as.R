#' @export
as.matrix.nlist <- function(x, ...) {
  if(!length(x)) return(matrix(1, dimnames = list("parameter", "1"))[-1,1,drop = FALSE])
  rownames <- as.character(term(x))
  x <- lapply(x, as.vector)
  x <- unlist(x)
  matrix(x, ncol = 1, dimnames = list(rownames, "1"))
}

#' @export
as.data.frame.nlist <- function(x, ...) {
  x <- as.matrix(x)
  if(!nrow(x)) 
    return(tibble(term = as.term("parameter"), n1 = 1)[-1,])
  tibble(term = list(term = as.term(rownames(x))), n1 = x[[1]])
}

#' @export
as.matrix.nlists <- function(x, ...) {
  if(!length(x)) 
    return(matrix(1, dimnames = list("parameter", "1"))[-1,-1,drop = FALSE])
  x <- lapply(x, FUN = as.matrix)
  term <- rownames(x[[1]])
  x <- lapply(x, as.vector)
  ncol <- length(x)
  x <- unlist(x)
  x <- matrix(x, nrow = length(term), ncol = ncol, 
              dimnames = list(term, 1:ncol))
  x
}
