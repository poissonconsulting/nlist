context("dims")

test_that("dims.nlist", {
  expect_identical(dims(nlist()), list())
  expect_identical(dims(nlist(x = 1:3, y = matrix(1, c(2,3)))),
                   list(x = 3L, y = 2:1))
})

test_that("dims.nlists", {
  expect_identical(dims(nlists()), list())
  expect_identical(dims(nlists(nlist())), list())
  expect_identical(dims(nlists(nlist(x = 1:3, y = matrix(1, c(2,3))), 
                               nlist(x = 1:3, y = matrix(1, c(2,3))))),
                   list(x = 3L, y = 2:1))
})
