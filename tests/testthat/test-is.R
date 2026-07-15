test_that("is_numeric", {
  expect_true(is_numeric(1))
  expect_true(is_numeric(1:2))
  expect_true(is_numeric(matrix(1:4, 2)))
  expect_false(is_numeric("1"))
  expect_false(is_numeric(list(x = 1)))
})

test_that("is_nlist", {
  expect_false(is_nlist(1))
  expect_false(is_nlist(list(x = 1)))
  expect_true(is_nlist(nlist()))
  expect_true(is_nlist(nlist(x = 1)))
})

test_that("is_nlists", {
  expect_false(is_nlists(1))
  expect_false(is_nlists(list(x = 1)))
  expect_false(is_nlists(nlist()))
  expect_true(is_nlists(nlists()))
  expect_true(is_nlists(nlists(nlist(x = 1))))
})
