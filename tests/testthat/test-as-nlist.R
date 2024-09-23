test_that("as_nlist.numeric", {
  expect_s3_class(as_nlist(c(x = 1)), "nlist")
  expect_error(as_nlist(1), "^`x` must be named[.]$", class = "chk_error")
  expect_error(as_nlist(c(x = 1, x = 2)), "^`names[(]x[)]` must be unique[.]$", class = "chk_error")
  expect_error(as_nlist(c(`x[1]` = 1, `x[1,2]` = 2)), "^All elements of term vector `names[(]x[)]` must be consistent[.]$", class = "chk_error")
  expect_identical(as_nlist(c(`a[2]` = 1, `a[1]` = 2)), structure(list(a = c(2, 1)), class = "nlist"))
  expect_identical(as_nlist(c(`a[2]` = 3L, `a[1]` = 2L)), structure(list(a = c(2L, 3L)), class = "nlist"))
  y <- nlist(g = matrix(1:4, ncol = 2), z = 1:3)
  expect_equal(as_nlist(unlist_nlist(y)), y)
})


test_that("as_nlist.numeric incomplete", {
  expect_identical(as_nlist(c(`a[3]` = 1, `a[1]` = 2)), structure(list(a = c(2, NA, 1)), class = "nlist"))
  expect_identical(as_nlist(c(`a[3]` = 1L, `a[1]` = 2L)), structure(list(a = c(2L, NA, 1L)), class = "nlist"))
})

test_that("as_nlist.list", {
  expect_s3_class(as_nlist(list(x = 1)), "nlist")
  expect_error(as_nlist(list(1)), "^`x` must be named[.]$", class = "chk_error")
})

test_that("as_nlist.mcmc", {
  #  expect_identical(as_nlist(as_mcmc(nlist())), nlist())
  #  expect_identical(as_nlist(as_mcmc(nlist(x = numeric(0)))), nlist())
  expect_identical(as_nlist(as_mcmc(nlist(x = 1))), nlist(x = 1))
  expect_identical(as_nlist(as_mcmc(nlist(x = 1, y = 2))), nlist(x = 1, y = 2))
  expect_identical(as_nlist(as_mcmc(nlist(x = matrix(1:12, nrow = 3)))), nlist(x = matrix(1:12, nrow = 3)))
})

test_that("as_nlist.mcmc.list", {
  #  expect_identical(as_nlist(as_mcmc(nlist())), nlist())
  #  expect_identical(as_nlist(as_mcmc(nlist(x = numeric(0)))), nlist())
  expect_identical(as_nlist(as_mcmc_list(nlist(x = 1))), nlist(x = 1))
  expect_identical(as_nlist(as_mcmc_list(nlist(x = 1, y = 2))), nlist(x = 1, y = 2))
  expect_identical(as_nlist(as_mcmc_list(nlist(x = matrix(1:12, nrow = 3)))), nlist(x = matrix(1:12, nrow = 3)))
  expect_identical(
    as_nlist(as_mcmc_list(nlists(nlist(x = matrix(1:12, nrow = 3))))),
    nlist(x = matrix(1:12, nrow = 3))
  )
  expect_error(as_nlist(as_mcmc_list(nlists(nlist(x = 1), nlist(x = 2)))),
    "`x` must have one iteration.",
    class = "chk_error"
  )
})

test_that("as_nlist.nlist", {
  expect_identical(as_nlist(nlist()), nlist())
  expect_identical(as_nlist(as_nlist(list(x = 1))), as_nlist(list(x = 1)))
})

test_that("as_nlist.data.frame", {
  expect_identical(
    as_nlist(data.frame(
      lgl = c(TRUE, NA),
      int = 1:2,
      dbl = c(2.5, 1.5),
      dte = as.Date(c("2001-01-02", "2001-01-01")),
      fac = factor(c("b", "a"))
    )),
    structure(list(
      lgl = c(1L, NA), int = 1:2, dbl = c(2.5, 1.5),
      dte = c(11324, 11323), fac = 2:1
    ), class = "nlist")
  )
})

test_that("as.nlist deprecated", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  lifecycle::expect_deprecated(as.nlist(data.frame(x = 1)))
  expect_identical(
    as.nlist(data.frame(x = 1)),
    as_nlist(data.frame(x = 1))
  )
})
