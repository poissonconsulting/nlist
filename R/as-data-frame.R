#' Coerce nlist Object to Data Frame
#' 
#' Coerces an nlist object to a data.frame with an term column and a value column.
#' 
#' @export
#' @param x An nlist object.
#' @inheritParams params
#' @return A data.frame.
#' @examples 
#' as.data.frame(nlist(x = 1, y = 4:6))
as.data.frame.nlist <- function(x, ...) {
  chk_unused(...)
  if(!length(x)) 
    return(as.data.frame(tibble::tibble(term = term(0), value = numeric(0))))
  x <- unlist(x)
  term <- as.term(names(x))
  x <- unname(x)
  x <- as.data.frame(tibble::tibble(term = term, value = x))
  x
}
