context("check")

test_that("check_natomic", {
  expect_error(check_natomic(list()), 
               "list[(][)] must be an atomic [(]vector, matrix or array[)] object")
  expect_error(check_natomic(NULL), 
               "NULL must be a numeric [(]integer or double[)] object")
  expect_identical(check_natomic(1), 1)
  expect_identical(check_natomic(matrix(1)), matrix(1))
  expect_identical(check_natomic(array(1)), array(1))
})

test_that("check_natomic length", {
  expect_identical(check_natomic(numeric(0)), numeric(0))
  expect_identical(check_natomic(numeric(0), length = FALSE), numeric(0))
  expect_error(check_natomic(numeric(0), length = TRUE), 
               "numeric[(]0[)] must have at least 1 element")
  expect_identical(check_natomic(1, length = TRUE), 1)
  
  expect_identical(check_natomic(matrix(numeric(0))), matrix(numeric(0)))
  expect_error(check_natomic(matrix(numeric(0)), length = TRUE), 
               "matrix[(]numeric[(]0[)][)] must have at least 1 element")
})

test_that("check_natomic missing values", {
  expect_identical(check_natomic(NA_real_), NA_real_)
  expect_identical(check_natomic(NA_real_, nas = TRUE), NA_real_)
  expect_error(check_natomic(1, nas = TRUE), 
               "1 must only include missing values")
  expect_error(check_natomic(NA_real_, nas = FALSE), 
               "NA_real_ must not include missing values")
})

test_that("check_nlist missing values", {
  expect_identical(check_nlist(nlist()), nlist())
  expect_error(check_nlist(nlist(), length = TRUE), 
               "x must have at least 1 element")
})

test_that("check_nlist class", {
  expect_error(check_nlist(list(x = 1), class = TRUE, x_name = "t"), 
               "t must inherit from class nlist")
  expect_error(check_nlist(nlist(), class = FALSE, x_name = "t"), 
               "t must not inherit from class nlist")
})

test_that("check_nlists", {
  expect_identical(check_nlists(nlists()), nlists())
  expect_identical(check_nlists(nlists(nlist(x = 1), nlist(x = 2)), x_name = "y"), 
                   nlists(nlist(x = 1), nlist(x = 2)))
})

test_that("check_nlists class", {
  expect_error(check_nlists(list(list(x = 1)), class = TRUE, x_name = "t"), 
               "t must inherit from class nlist")
  expect_error(check_nlists(nlists(), class = FALSE, x_name = "t"), 
               "t must not inherit from class nlists")
})
