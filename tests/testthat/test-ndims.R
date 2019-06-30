context("ndims")

test_that("ndims.nlist", {
  expect_identical(ndims(nlist()), integer(0))
  expect_identical(ndims(nlist(x = 1:3, y = matrix(1, c(2,3)))),
                   c(x = 1L, y = 2L))
})

test_that("ndims.nlists", {
  expect_identical(ndims(nlists()), integer(0))
  expect_identical(ndims(nlists(nlist())), integer(0))
  expect_identical(ndims(nlists(nlist(x = 1:3, y = matrix(1, c(2,3))), 
                               nlist(x = 1:3, y = matrix(1, c(2,3))))),
                   c(x = 1L, y = 2L))
})
