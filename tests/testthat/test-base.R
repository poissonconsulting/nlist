test_that("base R atomic", {
  expect_true(is.atomic(1))
  expect_true(is.atomic(matrix(1)))
  expect_true(is.atomic(array(1)))

  expect_false(is.atomic(list()))
})

test_that("base R numeric", {
  expect_true(is.numeric(1))
  expect_true(is.numeric(matrix(1)))
  expect_true(is.numeric(array(1)))

  expect_true(is.numeric(1L))
  expect_true(is.numeric(matrix(1L)))
  expect_true(is.numeric(array(1L)))

  expect_false(is.numeric(TRUE))
  expect_false(is.numeric(matrix(TRUE)))
  expect_false(is.numeric(array(TRUE)))
})
