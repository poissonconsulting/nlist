#' @export
c.nlist <- function(...) {
  x <- list(...)
  chk_all(x, chk_nlist, x_name = "...")

  x <- lapply(x, unclass)
  x <- do.call("c", x)
  if (!length(x)) {
    return(nlist())
  }
  class(x) <- "nlist"
  if (anyDuplicated(names(x))) {
    abort_chk("nlist objects must have distinctly named numeric elements in order to be concatenated.", tidy = FALSE)
  }
  x
}

.c_nlists <- function(x) {
  chk_all(x, chk_nlists, x_name = "...")
  if (!vld_all_identical(lapply(x, nchains))) {
    abort_chk("All elements of ... must have the same number of chains.")
  }

  if (!length(x)) {
    return(nlists())
  }
  nchains <- nchains(x[[1]])
  if (nchains > 1L) {
    x <- lapply(x, split_by_chains)
    x <- transpose(x)
    x <- lapply(x, .c_nlists)
    names(x) <- NULL
  }
  x <- lapply(x, unclass)
  x <- do.call("c", x)
  class(x) <- "nlists"
  chk_nlists(x, x_name = "...")
  if (nchains > 1L) attr(x, "nchains") <- nchains
  return(x)
}

#' @export
c.nlists <- function(...) {
  x <- list(...)
  .c_nlists(x)
}
