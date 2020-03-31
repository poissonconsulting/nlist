#' @export
universals::set_pars

#' Set Parameter Names
#'
#' @inherit universals::set_pars
#'
#' @export
set_pars.nlist <- function(x, value, ...) {
  chk_pars(value)
  chk_unused(...)

  if (!identical(npars(x), length(value))) {
    abort_chk("`value` must be length ", npars(x), ", not %n.", n = length(value))
  }

  if (!length(x)) {
    return(x)
  }
  names(x) <- value
  x
}


#' Set Parameter Names
#'
#' @inherit universals::set_pars
#'
#' @export
set_pars.nlists <- function(x, value, ...) {
  chk_unused(...)

  if (!length(x) && length(value)) {
    abort_chk("`value` must be length 0, not %n.", n = length(value))
  }
  x <- lapply(x, set_pars, value = value)
  class(x) <- "nlists"
  x
}
