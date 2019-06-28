context("check")

test_that("check_atomic_numeric", {
  expect_error(check_atomic_numeric(list()), 
               "list[(][)] must be an atomic [(]vector, matrix or array[)] object")
  expect_error(check_atomic_numeric(NULL), 
               "NULL must be a numeric [(]integer or double[)] object")
  expect_identical(check_atomic_numeric(1), 1)
  expect_identical(check_atomic_numeric(matrix(1)), matrix(1))
  expect_identical(check_atomic_numeric(array(1)), array(1))
})

test_that("check_atomic_numeric length", {
  expect_identical(check_atomic_numeric(numeric(0)), numeric(0))
  expect_identical(check_atomic_numeric(numeric(0), length = FALSE), numeric(0))
  expect_error(check_atomic_numeric(numeric(0), length = TRUE), 
               "numeric[(]0[)] must have at least 1 element")
  expect_identical(check_atomic_numeric(1, length = TRUE), 1)
  
  expect_identical(check_atomic_numeric(matrix(numeric(0))), matrix(numeric(0)))
  expect_error(check_atomic_numeric(matrix(numeric(0)), length = TRUE), 
               "matrix[(]numeric[(]0[)][)] must have at least 1 element")
})

test_that("check_atomic_numeric missing values", {
  expect_identical(check_atomic_numeric(NA_real_), NA_real_)
  expect_identical(check_atomic_numeric(NA_real_, nas = TRUE), NA_real_)
  expect_error(check_atomic_numeric(1, nas = TRUE), 
               "1 must only include missing values")
  expect_error(check_atomic_numeric(NA_real_, nas = FALSE), 
               "NA_real_ must not include missing values")
})

test_that("check_nlist missing values", {
  expect_identical(check_nlist(nlist()), nlist())
  expect_error(check_nlist(nlist(), length = TRUE), 
               "x must have at least 1 element")
  expect_error(check_nlist(nlist(), class = FALSE), 
               "nlist must inherit from class nlist")
})
