context("is")

test_that("is.nlist",{
  expect_false(is.nlist(1))
  expect_false(is.nlist(list(x = 1)))
})

test_that("is.nlists",{
  expect_false(is.nlists(1))
  expect_false(is.nlists(list(x = 1)))
})
