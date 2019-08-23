context("chk")

test_that("chk_natomic", {
  expect_error(chk_natomic(list()), 
               "^`list[(][)]` must be a numeric [(]integer or double[)] atomic [(]vector, matrix or array[)] object[.]")
  expect_error(chk_natomic(NULL), 
               "^`NULL` must be a numeric [(]integer or double[)] atomic [(]vector, matrix or array[)] object[.]")
  expect_error(chk_natomic(NULL, x_name = "nine"), 
               "^nine must be a numeric [(]integer or double[)] atomic [(]vector, matrix or array[)] object[.]")
  expect_false(chk_natomic(NULL, err = FALSE))
  expect_true(chk_natomic(1))
  expect_true(chk_natomic(matrix(1)))
  expect_true(chk_natomic(array(1)))
})

test_that("chk_nlist", {
  expect_error(chk_nlist(NULL), 
               "^`NULL` must be a list[.]$")
  expect_false(chk_nlist(list(), err = FALSE))
  expect_false(chk_nlist(list(x = 1, x = 2), err = FALSE))
  expect_error(chk_nlist(list(x = 1, x = 2)), "^`list[(]x = 1, x = 2[)]` must inherit from class 'nlist'[.]$")
  expect_true(chk_nlist(nlist(x = 1, y = 2)))
  expect_true(chk_nlist(nlist(x = 1)[-1]))
  expect_true(chk_nlist(nlist()))
  expect_true(chk_nlist(nlist(x = 1)))
  expect_false(chk_nlist(list(x = TRUE), err = FALSE))
  expect_error(chk_nlist(list(x = TRUE)),
               "`list[(]x = TRUE[)]` must inherit from class 'nlist'[.]")
})

test_that("chk_nlists", {
  expect_true(chk_nlists(list()))
  expect_true(chk_nlists(nlists()))
  expect_true(chk_nlists(list(nlist(x = 1))))
  expect_true(chk_nlists(nlists(nlist())))
  expect_true(chk_nlists(nlists(nlist(x = 1), nlist(x = 2))))
  expect_true(chk_nlists(nlists(nlist(x = 1), nlist(x = 2))))
})
