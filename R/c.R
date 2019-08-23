#' @export
c.nlist <- function(...) {
  x <- list(...)
  lapply(x, chk_nlist, x_name  = "All objects in ...")
  x <- lapply(x, unclass)
  x <- do.call("c", x)
  if(!length(x)) return(nlist())
  class(x) <- "nlist"
  if(anyDuplicated(names(x)))
    err("nlist objects must have distinctly named natomic elements in order to be concatenated.")
  x
}

#' @export
c.nlists <- function(...) {
  x <- list(...)
  lapply(x, chk_nlists, x_name  = "All objects in ...")
  x <- lapply(x, unclass)
  x <- do.call("c", x)
  class(x) <- "nlists"
  chk_nlists(x, x_name = "...")
  x
}
