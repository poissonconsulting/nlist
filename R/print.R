#' @export
print.nlist <- function(x, ...) {
  if(!length(x)) {
    cat("an nlist object of length 0")
    return(invisible(x))
  }
  print(unclass(x))
  cat("an nlist object of length", length(x))
  invisible(x)
}

#' @export
print.nlists <- function(x, ...) {
  if(length(x[[1]]))
    print(unclass(aggregate(x)))
  cat("an nlists object of", length(x), "nlist objects of length", length(x[[1]]))
  invisible(x)
}
