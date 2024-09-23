test_that("tidy.nlists", {
  rlang::local_options(lifecycle_verbosity = "quiet")

  lifecycle::expect_deprecated(tidy(nlists()))

  expect_identical(tidy(nlists()), structure(list(
    term = structure(character(0), class = c(
      "term",
      "vctrs_vctr"
    )), estimate = numeric(0), sd = numeric(0), zscore = numeric(0),
    lower = numeric(0), upper = numeric(0), svalue = numeric(0)
  ), row.names = integer(0), class = c(
    "tbl_df",
    "tbl", "data.frame"
  )))
  expect_equal(
    tidy(nlists(nlist())),
    tibble::tibble(
      term = term(x = 0), estimate = numeric(0), sd = numeric(0), zscore = numeric(0),
      lower = numeric(0), upper = numeric(0), svalue = numeric(0)
    )
  )
  expect_identical(
    tidy(nlists(nlist(x = 2))),
    tibble::tibble(
      term = term("x"), estimate = 2, sd = NA_real_, zscore = NA_real_, lower = 2,
      upper = 2, svalue = 1
    )
  )
  expect_identical(
    tidy(nlists(nlist(x = 2:4))),
    tibble::tibble(term = term(x = 3), estimate = c(2, 3, 4), sd = c(
      NA_real_, NA_real_,
      NA_real_
    ), zscore = c(NA_real_, NA_real_, NA_real_), lower = c(
      2,
      3, 4
    ), upper = c(2, 3, 4), svalue = c(1, 1, 1))
  )
  expect_identical(
    tidy(nlists(nlist(y = 1, s = 1:2))),
    tibble::tibble(term = term("y", s = 2), estimate = c(1, 1, 2), sd = c(
      NA_real_, NA_real_,
      NA_real_
    ), zscore = c(NA_real_, NA_real_, NA_real_), lower = c(
      1,
      1, 2
    ), upper = c(1, 1, 2), svalue = c(1, 1, 1))
  )
  expect_equal(tidy(nlists(nlist(x = 1, y = 1:2), nlist(x = 1, y = 3:4))), tibble::tibble(term = term("x" = 1, y = 2), estimate = c(1, 2, 3), sd = c(
    0, 1.4142135623731,
    1.4142135623731
  ), zscore = c(Inf, 1.41421356237309, 2.12132034355964), lower = c(1, 1.05, 2.05), upper = c(1, 2.95, 3.95), svalue = c(
    1.58496250072116,
    1.58496250072116, 1.58496250072116
  )))
})

test_that("tidy.nlists", {
  expect_identical(tidy(nlists(), simplify = TRUE), structure(list(
    term = structure(character(0), class = c(
      "term",
      "vctrs_vctr"
    )), estimate = numeric(0),
    lower = numeric(0), upper = numeric(0), svalue = numeric(0)
  ), row.names = integer(0), class = c(
    "tbl_df",
    "tbl", "data.frame"
  )))
  expect_equal(
    tidy(nlists(nlist()), simplify = TRUE),
    tibble::tibble(
      term = term(x = 0), estimate = numeric(0),
      lower = numeric(0), upper = numeric(0), svalue = numeric(0)
    )
  )
  expect_identical(
    tidy(nlists(nlist(x = 2)), simplify = TRUE),
    tibble::tibble(
      term = term("x"), estimate = 2, lower = 2,
      upper = 2, svalue = 1
    )
  )
  expect_identical(
    tidy(nlists(nlist(x = 2:4)), simplify = TRUE),
    tibble::tibble(
      term = term(x = 3), estimate = c(2, 3, 4),
      lower = c(
        2,
        3, 4
      ), upper = c(2, 3, 4), svalue = c(1, 1, 1)
    )
  )
  expect_identical(
    tidy(nlists(nlist(y = 1, s = 1:2)), simplify = TRUE),
    tibble::tibble(
      term = term("y", s = 2), estimate = c(1, 1, 2),
      lower = c(
        1,
        1, 2
      ), upper = c(1, 1, 2), svalue = c(1, 1, 1)
    )
  )
  expect_equal(tidy(nlists(nlist(x = 1, y = 1:2), nlist(x = 1, y = 3:4)), simplify = TRUE), tibble::tibble(
    term = term("x" = 1, y = 2), estimate = c(1, 2, 3),
    lower = c(1, 1.05, 2.05), upper = c(1, 2.95, 3.95), svalue = c(
      1.58496250072116,
      1.58496250072116, 1.58496250072116
    )
  ))
})

test_that("tidy.mcmc", {
  nlists <- nlists(nlist(x = 1:3, y = matrix(1)))
  expect_identical(tidy(as_mcmc(nlists), simplify = TRUE), tidy(nlists, simplify = TRUE))
})

test_that("tidy.mcmc.list", {
  nlists <- nlists(nlist(x = 1:3, y = matrix(1)))
  expect_identical(tidy(as_mcmc_list(nlists), simplify = TRUE), tidy(nlists, simplify = TRUE))
})
