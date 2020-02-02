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
  term <- as.term(names(x))
  x <- tibble::tibble(term = term, value1 = x)
  x
}

#' @inherit generics::tidy
#'
#' @export
#' @examples 
#' tidy(nlists(nlist(x = 1, y = 4:6),
#'  nlist(x = 3, y = 7:9)))
tidy.nlists <- function(x, ...) {
  chk_unused(...)
  if(!length(x)) return(tibble::tibble(term = term(0)))
  if(!length(x[[1]])) return(tibble::tibble(term = term(0)))
  
  x <- lapply(x, tidy)
  term <- x[[1]]$term
  x <- lapply(x, function(x) x[[2]])
  names(x) <- p0("value", 1:length(x))
  term <- list(term = term)
  x <- c(term, x)
  x <- tibble::as_tibble(x)
  x
}
