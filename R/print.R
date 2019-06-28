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
  if(length(x[[1]]))
    print(unclass(aggregate(x)))
  cat(cn(length(x), p("an nlists object of %n nlist object%s", 
            cn(length(x[[1]]), 
               "each with %n natomic element%s",
               none = "with 0 natomic elements"))))
  invisible(x)
}
