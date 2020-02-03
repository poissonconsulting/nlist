.as.data.frame.nlist <- function(x, sample = NULL) {
  if(!length(x)) {
    if(!is.null(sample)) {
      return(as.data.frame(tibble::tibble(
        term = term(0), 
        sample = integer(0),
        value = numeric(0))))
    }
    return(as.data.frame(tibble::tibble(
      term = term(0), 
      value = numeric(0))))
  }
  x <- unlist(x)
  term <- as.term(names(x))
  x <- unname(x)
  if(!is.null(sample)) {
    return(as.data.frame(tibble::tibble(
      term = term, 
      sample = sample, 
      value = x)))
  } 
  as.data.frame(tibble::tibble(
    term = term, 
    value = x))
}

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
  .as.data.frame.nlist(x)
}

#' Coerce nlists Object to Data Frame
#' 
#' Coerces an nlists object to a data.frame with a term, sample and value column.
#' 
#' @export
#' @param x An nlists object.
#' @inheritParams params
#' @return A data.frame.
#' @examples 
#' as.data.frame(nlists(nlist(x = 1, y = 4:6), 
#'   nlist(x = 3, y = 1:3)))
as.data.frame.nlists <- function(x, ...) {
  chk_unused(...)
  if(!length(x) || !length(x[[1]])) 
    return(as.data.frame(tibble::tibble(term = term(0), 
                                        sample = integer(0),
                                        value = numeric(0))))
  x <- mapply(.as.data.frame.nlist, x, sample = 1:length(x),
              SIMPLIFY = FALSE)
  x <- do.call("rbind", x)
  x
}

