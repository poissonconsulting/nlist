#' @export
print.nlist <- function(x, ...) {
  if(!length(x)) {
    cat("an nlist object with 0 natomic elements")
    return(invisible(x))
  }
  print(unclass(x))
  cat(cn(length(x), "an nlist object with %n natomic element%s"))
  invisible(x)
}

#' @export
print.nlists <- function(x, ...) {
  if(!length(x)) {
    cat("an nlists object with 0 nlist objects")
    return(invisible(x))
  }
  if(length(x[[1]]))
    print(unclass(aggregate(x)))
  str <- cn(length(x), 
            one = "an nlists object of an nlist object with",
            some = "an nlists object of %n nlist objects each with")
  str <- p0(str, cn(length(x[[1]]), " %n natomic element%s"), collapse = "")
  cat(str)
  invisible(x)
}
