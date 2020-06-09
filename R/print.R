#' @export
print.nlist <- function(x, ...) {
  n <- length(x)
  if (!n) {
    cat("an nlist object with 0 numeric elements\n")
    return(invisible(x))
  }
  print(unclass(x))
  str <- "an nlist object with"
  str <- p(str, if (n == 1) "1 numeric element\n" else p(n, "numeric elements"))
  cat(str)
  invisible(x)
}

#' @export
print.nlists <- function(x, ...) {
  n <- niters(x)
  if (!n) {
    cat("an nlists object with 0 nlist objects\n")
    return(invisible(x))
  }
  nn <- length(x[[1]])
  if (nn) print(unclass(estimates(x)))

  str <- "an nlists object"
  nchains <- nchains(x)
  str <- p(str, if (nchains > 1) p("with", nchains, "chains of") else "of")
  str <- p(str, if (n == 1) "an nlist object with" else p(n, "nlist objects each with"))
  str <- p(str, if (nn == 1) "1 numeric element" else p(nn, "numeric elements"))
  cat(str)
  invisible(x)
}
