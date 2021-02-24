#' Coerce to nlist
#'
#' Coerce an R object to an [nlist_object()].
#'
#' @inheritParams params
#' @return An nlist object.
#' @family coerce
#' @export
#' @examples
#' as_nlist(list(x = 1:4))
#' as_nlist(c(`a[2]` = 3, `a[1]` = 2))
as_nlist <- function(x, ...) {
  UseMethod("as_nlist")
}

#' @rdname as_nlist
#' @export
as.nlist <- function(x, ...) {
  deprecate_soft("0.1.1",
                 what = "nlist::as.nlist()",
                 with = "nlist::as_nlist()"
  )
  UseMethod("as_nlist")
}

#' @describeIn as_nlist Coerce named numeric vector to nlist
#' @export
as_nlist.numeric <- function(x, ...) {
  chk_named(x)
  chk_term(as_term(names(x)), validate = "consistent", x_name = "`names(x)`")
  chk_not_any_na(names(x))
  chk_unique(names(x))
  chk_unused(...)
  
  if (!length(x)) {
    return(nlist())
  }
  terms <- as_term(names(x))
  if (is_incomplete_terms(terms)) {
    terms <- complete_terms(terms)
    y <- rep(NA_integer_, length(terms))
    names(y) <- terms
    y[names(x)] <- x
    x <- y
  }
  x <- split(x, pars_terms(terms))
  x <- lapply(x, function(x) x[order(as_term(names(x)))])
  x <- lapply(x, function(x) set_dim(x, pdims(as_term(names(x)))[[1]]))
  as_nlist(x)
}

#' @describeIn as_nlist Coerce list to nlist
#' @export
as_nlist.list <- function(x, ...) {
  chk_unused(...)
  if (!length(x)) {
    return(nlist())
  }
  x <- numericise(x)
  class(x) <- "nlist"
  chk_nlist(x)
  x
}

#' @describeIn as_nlist Coerce data.frame to nlist
#' @export
as_nlist.data.frame <- function(x, ...) as_nlist(as.list(x))

#' @describeIn as_nlist Coerce mcmc (with one iteration) to nlist
#' @export
as_nlist.mcmc <- function(x, ...) {
  chk_unused(...)
  if(!identical(nrow(x), 1L)) abort_chk("`x` must have one iteration.")

  x <- complete_terms(x)

  pars <- pars(x)
  x <- lapply(pars, function(p, x) subset(x, pars = p), x = x)
  names(x) <- pars
  x <- lapply(x, function(x) set_dim(as.vector(x), pdims(x)[[1]]))
  as_nlist(x)
}

#' @describeIn as_nlist Coerce mcmc.list (with one iteration) to nlist
#' @export
as_nlist.mcmc.list <- function(x, ...) {
  as_nlist(as_mcmc(x), ...)
}

#' @export
as_nlist.nlist <- function(x, ...) x

