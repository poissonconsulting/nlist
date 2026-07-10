#' @export
generics::tidy

warn_default_directional_information <- function(
  env = parent.frame(),
  user_env = parent.frame(2)
) {
  lifecycle::deprecate_soft(
    "0.5.0",
    "tidy(directional_information = 'should be explicitly set')",
    details = paste(
      "The default value of `directional_information` will change from",
      "`FALSE` to `TRUE` in a future release."
    ),
    env = env,
    user_env = user_env
  )
}

#' @inheritParams params
#' @inherit generics::tidy
#' @export
tidy.mcmc <- function(
  x,
  simplify = FALSE,
  directional_information = FALSE,
  ...
) {
  chk_unused(...)
  if (missing(directional_information)) {
    warn_default_directional_information()
  }
  tidy(
    as_nlists(x),
    simplify = simplify,
    directional_information = directional_information
  )
}

#' @inheritParams params
#' @inherit generics::tidy
#'
#' @export
tidy.mcmc.list <- function(
  x,
  simplify = FALSE,
  directional_information = FALSE,
  ...
) {
  chk_unused(...)
  if (missing(directional_information)) {
    warn_default_directional_information()
  }
  tidy(
    as_nlists(x),
    simplify = simplify,
    directional_information = directional_information
  )
}

#' @inheritParams params
#' @inherit generics::tidy
#'
#' @export
#' @examples
#' tidy(nlists(
#'   nlist(x = 1, y = 4:6),
#'   nlist(x = 3, y = 7:9)
#' ), simplify = TRUE, directional_information = FALSE)
#' tidy(nlists(
#'   nlist(x = 1, y = 4:6),
#'   nlist(x = 3, y = 7:9)
#' ), simplify = TRUE, directional_information = TRUE)
tidy.nlists <- function(
  x,
  simplify = FALSE,
  directional_information = FALSE,
  ...
) {
  chk_flag(simplify)
  chk_flag(directional_information)
  chk_unused(...)

  if (missing(directional_information)) {
    warn_default_directional_information()
  }
  if (!simplify) {
    lifecycle::deprecate_warn("0.3.1", "tidy(simplify = 'must be TRUE')")
  }
  if (!length(x) || !length(x[[1]])) {
    term <- term(x = 0)
    estimate <- numeric(0)
    sd <- numeric(0)
    zscore <- numeric(0)
    lower <- numeric(0)
    upper <- numeric(0)
    svalue <- numeric(0)

    if (simplify) {
      return(tibble::tibble(
        term = term,
        estimate = estimate,
        lower = lower,
        upper = upper,
        svalue = svalue
      ))
    }
    return(tibble::tibble(
      term = term,
      estimate = estimate,
      sd = sd,
      zscore = zscore,
      lower = lower,
      upper = upper,
      svalue = svalue
    ))
  } else {
    estimate <- unlist(estimates(x, median))
    term <- as_term(names(estimate))
    estimate <- unname(estimate)
    sd <- unname(unlist(estimates(x, sd)))
    zscore <- unname(unlist(estimates(x, zscore)))
    lower <- unname(unlist(estimates(x, lower)))
    upper <- unname(unlist(estimates(x, upper)))
    svalue_fun <- if (directional_information) {
      extras::directional_information
    } else {
      svalue
    }
    svalue <- unname(unlist(estimates(x, svalue_fun)))
  }
  if (simplify) {
    return(tibble::tibble(
      term = term,
      estimate = estimate,
      lower = lower,
      upper = upper,
      svalue = svalue
    ))
  }

  tibble::tibble(
    term = term,
    estimate = estimate,
    sd = sd,
    zscore = zscore,
    lower = lower,
    upper = upper,
    svalue = svalue
  )
}
