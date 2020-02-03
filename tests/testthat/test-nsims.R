test_that("", {
  expect_identical(nsims(nlist()), 1L)
  expect_identical(nsims(nlist(x = 1)), 1L)
})

test_that("", {
  expect_identical(nsims(nlists()), 0L)
  expect_identical(nsims(nlists(nlist())), 1L)
  expect_identical(nsims(nlists(nlist(), nlist())), 2L)
})
