context("nchains")

test_that("nchains nlist", {
  expect_identical(nchains(nlist()), 1L)
  expect_identical(nchains(nlist(x = 1)), 1L)
})

test_that("nchains nlists", {
  expect_identical(nchains(nlists()), 1L)
  expect_identical(nchains(nlists(nlist())), 1L)
  expect_identical(nchains(nlists(nlist(), nlist())), 1L)
  nlists <- nlists(nlist(x = 1), nlist(x = 3))
  attr(nlists, "nchains") <- 2L
  expect_identical(nchains(nlists), 2L)
})
