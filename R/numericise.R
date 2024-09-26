#' @exportS3Method NULL
numericise.list <- function(x, ...) lapply(x, numericise)

numericise.nlist <- function(x, ...) x
