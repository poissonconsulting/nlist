context("ndims")

test_that("ndims.nlist", {
  expect_identical(ndims(nlist()), list())
  expect_identical(ndims(nlist(x = 1:3, y = matrix(1, c(2,3)))),
                   list(x = 1L, y = 2L))
})

test_that("ndims.nlists", {
  expect_identical(ndims(nlists()), list())
  expect_identical(ndims(nlists(nlist(x = 1:3, y = matrix(1, c(2,3))), 
                               nlist(x = 1:3, y = matrix(1, c(2,3))))),
                   list(x = 1L, y = 2L))
})
