context("brackets")

test_that("[.nlist", {
  expect_identical(nlist(x = 1)[1], nlist(x = 1))
  expect_identical(nlist(x = 1, y = 2)[1], nlist(x = 1))
  expect_identical(nlist(x = 1, y = 2)["x"], nlist(x = 1))
  expect_identical(nlist(x = 1, y = 2)[2], nlist(y = 2))
  expect_identical(nlist(x = 1, y = 2)["y"], nlist(y = 2))
  expect_error(nlist(x = 1, y = 2)[c(1,1)], "^`x` must be a uniquely named list of numeric [(]integer or double[)] atomic [(]vector, matrix or array[)] objects[.]$")
  expect_error(nlist(x = 1)[1,], "incorrect number of dimensions")
})

test_that("[.nlists", {
  expect_identical(nlists(nlist(x = 1))[1], nlists(nlist(x = 1)))
  expect_identical(nlists(nlist(x = 1), nlist(x = 1))[1], nlists(nlist(x = 1)))
  expect_identical(nlists(nlist(x = 1), nlist(x = 2))[2:1], 
                   nlists(nlist(x = 2), nlist(x = 1)))
  expect_identical(nlists(nlist(x = 1), nlist(x = 3))[c(2,2)], 
                   nlists(nlist(x = 3), nlist(x = 3)))
  expect_identical(nlists(nlist(x = 1))[1,1], nlists(nlist(x = 1)))
  expect_identical(nlists(nlist(x = 1, y = 1), nlist(x = 2, y = 2))[1,1], 
                   nlists(nlist(x = 1)))
  expect_identical(nlists(nlist(x = 1, y = 1), nlist(x = 1, y = 1))[1,], 
                   nlists(nlist(x = 1, y = 1)))
  expect_identical(nlists(nlist(x = 1, y = 1), nlist(x = 1, y = 1))[,], 
                   nlists(nlist(x = 1, y = 1), nlist(x = 1, y = 1)))
  expect_identical(nlists(nlist(x = 1, y = 1), nlist(x = 1, y = 1))[], 
                   nlists(nlist(x = 1, y = 1), nlist(x = 1, y = 1)))
  expect_identical(nlists(nlist(x = 1, y = 1), nlist(x = 3, y = 3))[2,2], 
                   nlists(nlist(y = 3)))})

test_that("[[<-.nlists", {
  nlists <- nlists(nlist(x = 1))
  nlists[[1]] <- nlist(x = 1)
  expect_identical(nlists, nlists(nlist(x = 1)))
  nlists[[2]] <- nlist(x = 3)
  expect_identical(nlists, nlists(nlist(x = 1), nlist(x = 3)))
  nlists[[1]] <- nlist(x = 3)
  expect_identical(nlists, nlists(nlist(x = 3), nlist(x = 3)))
  nlists[[1]] <- list(x = 2)
  expect_identical(nlists, nlists(nlist(x = 2), nlist(x = 3)))
  expect_error(nlists[[1]] <- nlist(y = 3),
               "^nlist elements of `x` and `values` must have matching names[.]$")
  expect_error(nlists[[1]] <- nlist(x = c(3,3)),
               "^nlist elements of `x` and `values` must have matching dimensions[.]$")
  expect_error(nlists[[1]] <- nlist(x = 3L),
               "^nlist elements of `x` and `values` must have matching types[.]$")
})
