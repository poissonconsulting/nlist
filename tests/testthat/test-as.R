context("as")

test_that("as.nlist.list", {
  expect_is(as.nlist(list(x = 1)), "nlist")
  expect_error(as.nlist(list(1)), "x must be named")
})

test_that("as.nlist.nlist", {
  expect_identical(as.nlist(as.nlist(list(x = 1))), as.nlist(list(x = 1)))
})
