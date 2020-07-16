#' @export
universals::set_pars

#' @export
universals::`pars<-`

#' @inherit universals::set_pars
#' @export
set_pars.mcmc <- function(x, value, ...) {
  term <- set_pars(as_term(x), value, ...)
  colnames(x) <- as.character(term)
  x
}

#' @inherit universals::set_pars
#' @export
set_pars.mcmc.list <- function(x, value, ...) {
  x <- lapply(x, set_pars, value = value, ...)
  class(x) <- "mcmc.list"
  x
}
#' Set Parameter Names
#'
#' @inherit universals::set_pars
#'
#' @export
#' @examples
#' nlist <-  nlist(x = 1, y = 3:4)
#' pars(nlist) <- c("a", "b")
#' nlist
#' set_pars(nlist, c("z", "c1"))
set_pars.nlist <- function(x, value, ...) {
  chk_pars(value)
  chk_not_any_na(value)
  chk_unique(value)
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
#' @examples 
#' nlists <- nlists(nlist(x = 2), nlist(x = 3))
#' pars(nlists) <- "a"
#' nlists
#' set_pars(nlists, "zz")
set_pars.nlists <- function(x, value, ...) {
  chk_unused(...)

  if (!length(x) && length(value)) {
    abort_chk("`value` must be length 0, not %n.", n = length(value))
  }
  x <- lapply(x, set_pars, value = value)
  class(x) <- "nlists"
  x
}
