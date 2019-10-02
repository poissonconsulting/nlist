context("any-na")

test_that("anyNA.nlist", {
  expect_false(anyNA(nlist()))
  expect_false(anyNA(nlist(x = 1)))
  expect_true(anyNA(nlist(x = 1, y = NA)))
})

test_that("anyNA.nlists", {
  expect_false(anyNA(nlists()))
  expect_false(anyNA(nlists(nlist(x = 1))))
  expect_true(anyNA(nlists(nlist(x = 1, y = NA))))
})
