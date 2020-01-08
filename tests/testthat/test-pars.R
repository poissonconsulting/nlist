context("pars")

test_that("pars.nlist", {
  expect_identical(pars(nlist()), character(0))
  expect_identical(pars(nlist(x = 1)), "x")
  expect_identical(pars(nlist(x = 1, a = 1:10)), c("x", "a"))
  expect_identical(pars(nlist(x = 1, a = 1:10), scalar = TRUE), "x")
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
