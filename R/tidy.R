#' @export
generics::tidy

#' @inherit generics::tidy
#'
#' @export
#' @examples 
#' tidy(nlist(x = 1, y = 4:6))
tidy.nlist <- function(x, ...) {
  chk_unused(...)
  if(!length(x)) return(tibble::tibble(term = term(0)))
  x <- unlist(x)
  x <- as.matrix(x)
  term <- as.term(rownames(x))
  colnames(x) <- p0("value", 1:ncol(x))
  x <- as.data.frame(x)
  x <- as.list(x)
  term <- list(term = term)
  x <- c(term, x)
  x <- tibble::as_tibble(x)
  x
}
