test_that("estimates.nlist", {
  expect_identical(estimates(nlist()), structure(list(), .Names = character(0), class = "nlist"))
  expect_identical(estimates(nlist(x = 1)), nlist(x = 1))
  expect_identical(estimates(nlist(x = 1:2)), nlist(x = 1:2))
  expect_identical(estimates(nlist(z = 1:2), fun = median), nlist(z = 1:2))
  expect_identical(estimates(nlist(z = 1:2), fun = function(x) 1L), nlist(z = c(1L, 1L)))
  expect_identical(estimates(nlist(z = 1:2), fun = function(x, value) {
    value
  }, value = 2.5), nlist(z = c(2.5, 2.5)))

  expect_error(
    estimates(nlist(x = 1:2), fun = function(x) 1:2),
    "^`fun` must return a scalar[.]$",
    class = "chk_error"
  )
})

test_that("estimates.nlists", {
  expect_identical(
    estimates(nlists()),
    structure(list(), .Names = character(0), class = "nlist")
  )
  expect_identical(
    estimates(nlists(nlist())),
    structure(list(), .Names = character(0), class = "nlist")
  )
  expect_identical(estimates(nlists(nlist(x = 1), nlist(x = 2))), nlist(x = 1.5))
  expect_identical(
    estimates(nlists(
      nlist(x = matrix(1:9, 3)),
      nlist(x = matrix(2:10, 3))
    )),
    structure(list(x = structure(c(
      1.5, 2.5, 3.5, 4.5, 5.5, 6.5,
      7.5, 8.5, 9.5
    ), .Dim = c(3L, 3L))), class = "nlist")
  )
  expect_identical(estimates(nlists(nlist(x = 1), nlist(x = 2)), fun = function(x) x[1]), nlist(x = 1))

  expect_identical(estimates(nlists(nlist(x = 1), nlist(x = 2)), fun = function(x, value) value, value = 3), nlist(x = 3))

  expect_error(
    estimates(nlists(
      nlist(x = matrix(1:9, 3)),
      nlist(x = matrix(2:10, 3))
    ), fun = identity),
    "^`fun` must return a scalar[.]$",
    class = "chk_error"
  )
})
