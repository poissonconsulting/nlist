#' @export
sort.mcmc <- function(x, ...) set_class(x[, order(as_term(x)), drop = FALSE], "mcmc")

#' @export
sort.mcmc.list <- function(x, ...) set_class(lapply(x, sort), "mcmc.list")
