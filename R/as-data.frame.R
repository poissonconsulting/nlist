#' @method as.data.frame nlist
#' @export
as.data.frame.nlist <- function(x, ...) term::term_df(x)

#' @method as.data.frame nlists
#' @export
as.data.frame.nlists <- function(x, ...) term::term_df(x)
