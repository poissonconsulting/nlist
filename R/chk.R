#' Check nlist Object or nlists Object
#'
#' `chk_nlist`
#' checks if an [nlist-object()].
#'
#' @inheritParams chk::chk_true
#' @return `NULL`, invisibly. Called for the side effect of throwing an error
#'   if the condition is not met.
#' @export
#'
#' @examples
#'
#' # chk_nlist
#' chk_nlist(nlist(x = 1))
#' try(chk_nlist(list(x = 1)))
chk_nlist <- function(x, x_name = NULL) {
  if (vld_nlist(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_s3_class(x, "nlist", x_name = x_name)
  chk_named(x, x_name = x_name)
  x_name_names <- backtick_chk(p0("names(", unbacktick_chk(x_name), ")"))
  chk_pars(names(x), x_name = x_name_names)
  chk_not_any_na(names(x), x_name = x_name_names)
  chk_unique(names(x), x_name = x_name_names)
  chk_all(x, chk_numeric, x_name = x_name)
}

#' @describeIn chk_nlist Check nlists Object
#'
#' `chk_nlists`
#' checks if an [nlists-object()].
#' @export
#' @examples
#'
#' # chk_nlists
#' chk_nlists(nlists(nlist(x = 1)))
chk_nlists <- function(x, x_name = NULL) {
  if (vld_nlists(x)) {
    return(invisible())
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk(substitute(x))
  chk_s3_class(x, "nlists", x_name = x_name)
  chk_all(x, chk_nlist, x_name = x_name)
  if (!vld_all_identical(lapply(x, names))) {
    abort_chk("nlist elements of ", x_name, " must have matching names.", tidy = FALSE)
  }
  if (!vld_all_identical(lapply(x, lapply, dims))) {
    abort_chk("nlist elements of ", x_name, " must have matching dimensions.", tidy = FALSE)
  }
  abort_chk("nlist elements of ", x_name, " must have matching types.", tidy = FALSE)
}
