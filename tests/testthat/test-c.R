context("c")

test_that("c.nlist", {
  expect_identical(c(nlist()), nlist())
  expect_identical(c(nlist(x = 1)), nlist(x = 1))
  expect_identical(c(nlist(x = 1), nlist(y = 2)), nlist(x = 1, y = 2))
  expect_identical(c(nlist(), nlist()), nlist())
  expect_identical(c(nlist(), nlist(x = 1)), nlist(x = 1))
  expect_error(c(nlist(x = 1), nlist(x = 1)), 
               "nlist objects must have distinctly named natomic elements in order to be concatenated")
  expect_error(c(nlist(x = 1), list(x = 1)), 
               "all objects in ... must inherit from class nlist")
})
