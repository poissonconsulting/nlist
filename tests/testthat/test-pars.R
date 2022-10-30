test_that("pars.nlist", {
  expect_identical(pars(nlist()), character(0))
  expect_identical(pars(nlist(x = 1)), "x")
  expect_identical(pars(nlist(x = 1, a = 1:10)), c("x", "a"))

  expect_identical(pars(nlist(x = 1, a = 1:10), scalar = TRUE), "x")
  expect_identical(pars(nlist(x = 1, a = 1:10), scalar = TRUE), "x")
  lifecycle::expect_deprecated(pars(nlist(x = 1, a = 1:10), terms = TRUE))
  rlang::local_options(lifecycle_verbosity = "quiet")
  expect_identical(
    pars(nlist(x = 1, a = 1:10), terms = TRUE),
    c("x", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a")
  )
})

test_that("pars.nlists", {
  expect_identical(pars(nlists()), character(0))
  expect_identical(pars(nlists(nlist())), character(0))
  expect_identical(pars(nlists(nlist(x = 1))), "x")
  expect_identical(pars(nlists(nlist(x = 1), nlist(x = 1))), "x")
  expect_identical(pars(nlists(nlist(x = 1, a = 1:10))), c("x", "a"))
  expect_identical(pars(nlists(
    nlist(x = 1, a = 1:10),
    nlist(x = 1, a = 1:10)
  )), c("x", "a"))
})

test_that("pars.nlist scalar", {
  expect_identical(pars(nlist(), scalar = TRUE), character(0))
  expect_identical(pars(nlist(x = 1, a = 1:10), scalar = TRUE), "x")
  expect_identical(pars(nlist(x = 1, a = 1:10), scalar = FALSE), "a")
  expect_identical(pars(nlist(a = 1:10), scalar = TRUE), character(0))
})

test_that("pars.nlists scalar", {
  expect_identical(pars(nlists(), scalar = TRUE), character(0))
  expect_identical(pars(nlists(nlist()), scalar = TRUE), character(0))
  expect_identical(pars(nlists(nlist(), nlist()), scalar = TRUE), character(0))
  expect_identical(pars(nlists(nlist(x = 1, a = 1:10)), scalar = TRUE), "x")
  expect_identical(pars(nlists(nlist(a = 1:10)), scalar = TRUE), character(0))
  expect_identical(pars(nlists(nlist(x = 1, a = 1:10), nlist(x = 2, a = 1:10)), scalar = TRUE), "x")
})

test_that("pars.nlists term", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  lifecycle::expect_deprecated(pars(nlists(nlist(x = 1, a = 1:2)), terms = TRUE))

  expect_identical(pars(nlists(nlist(x = 1, a = 1:2)), terms = TRUE), c("x", "a", "a"))
})
