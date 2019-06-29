#' @export
c.nlist <- function(...) {
  x <- list(...)
  lapply(x, check_nlist, x_name  = "all objects in ...")
  x <- lapply(x, unclass)
  x <- do.call("c", x)
  if(!length(x)) return(nlist())
  class(x) <- "nlist"
  if(anyDuplicated(names(x)))
    err("nlist objects must have distinctly named natomic elements in order to be concatenated")
  x
}

#' @export
c.nlists <- function(...) {
  x <- list(...)
  lapply(x, check_nlists, x_name  = "all objects in ...")
  x <- lapply(x, unclass)
  x <- do.call("c", x)
  class(x) <- "nlists"
  check_nlists(x, x_name = "the natomic elements of ...")
}
