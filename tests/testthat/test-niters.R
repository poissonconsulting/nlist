context("niters")

test_that("niters nlist", {
  expect_identical(niters(nlist()), 1L)
  expect_identical(niters(nlist(x = 1)), 1L)
})

test_that("", {
  expect_identical(niters(nlists()), 0L)
  expect_identical(nsims(nlists(nlist())), 1L)
  expect_identical(nsims(nlists(nlist(), nlist())), 2L)
})
