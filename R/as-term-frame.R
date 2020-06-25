#' Coerce to a Term Frame
#'
#' A term frame is a tibble with the first column a
#' term vector called and a numeric column called
#' value and in the case of an nlists object an integer
#' vector called samples. It includes the original nlist or nlists object.
#'
#' @inheritParams params
#' @return An term_frame object.
#' @export
as_term_frame <- function(x, ...) {
  UseMethod("as_term_frame")
}

#' Coerce nlist Object to Data Frame
#'
#' Coerces an nlist object to a data.frame with an term column 
#' and a value column.
#'
#' @export
#' @param x An nlist object.
#' @inheritParams params
#' @return A data.frame.
#' @examples
#' as_term_frame(nlist(x = 1, y = 4:6))
as_term_frame.nlist <- function(x, ...) {
  chk_unused(...)
  as_term_frame_nlist_impl(x)
}

as_term_frame_nlist_impl <- function(x, sample = NULL) {
  if (!length(x)) {
    if (!is.null(sample)) {
      return(as.data.frame(tibble::tibble(
        term = term(x = 0),
        sample = integer(0),
        value = numeric(0)
      )))
    }
    return(as.data.frame(tibble::tibble(
      term = term(x = 0),
      value = numeric(0)
    )))
  }
  x <- unlist(x)
  term <- as_term(names(x))
  x <- unname(x)
  if (!is.null(sample)) {
    return(as.data.frame(tibble::tibble(
      term = term,
      sample = sample,
      value = x
    )))
  }
  as.data.frame(tibble::tibble(
    term = term,
    value = x
  ))
}

#' Coerce nlists Object to Data Frame
#'
#' Coerces an nlists object to a data.frame with a term, sample 
#' and value column.
#'
#' @export
#' @param x An nlists object.
#' @inheritParams params
#' @return A data.frame.
#' @examples
#' as_term_frame(nlists(
#'   nlist(x = 1, y = 4:6),
#'   nlist(x = 3, y = 1:3)
#' ))
as_term_frame.nlists <- function(x, ...) {
  chk_unused(...)
  if (!length(x) || !length(x[[1]])) {
    return(as.data.frame(tibble::tibble(
      term = term(x = 0),
      sample = integer(0),
      value = numeric(0)
    )))
  }
  x <- mapply(as_term_frame_nlist_impl, x,
    sample = 1:length(x),
    SIMPLIFY = FALSE
  )
  x <- do.call("rbind", x)
  # FIXME hack to deal with
  # https://github.com/poissonconsulting/term/issues/40
  x$term <- term::new_term(as.character(x$term))
  x
}
