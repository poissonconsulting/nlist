context("is")

test_that("is.natomic", {
  expect_false(is.natomic(TRUE))
  expect_true(is.natomic(1))
})

test_that("is.nlist", {
  expect_false(is.nlist(1))
  expect_false(is.nlist(list(x = 1)))
  expect_true(is.nlist(nlist()))
  expect_true(is.nlist(nlist(x = 1)))
})

test_that("is.nlists", {
  expect_false(is.nlists(1))
  expect_false(is.nlists(list(x = 1)))
  expect_false(is.nlists(nlist()))
  expect_true(is.nlists(nlists()))
  expect_true(is.nlists(nlists(nlist(x = 1))))
})
