context("aggregate")

test_that("aggregate.nlist", {
  expect_identical(aggregate(nlist()), structure(list(), .Names = character(0)))
  expect_identical(aggregate(nlist(x = 1)), list(x = 1))
  expect_identical(aggregate(nlist(x = 1:2)), list(x = 1.5))
  expect_identical(aggregate(nlist(x = 1:2), fun = function(x) x[1]), list(x = 1L))
  expect_identical(aggregate(nlist(x = matrix(1:9, 3)), fun = function(x) x[1]), list(x = 1L))
  expect_identical(aggregate(nlist(x = 1:3, y = matrix(1:9, 3))), list(x = 2, y = 5))

  expect_error(
    aggregate(nlist(x = 1:2), fun = identity),
    "^`fun` must return a scalar[.]$"
  )
})

test_that("aggregate.nlists", {
  expect_identical(
    aggregate(nlists()),
    structure(list(), .Names = character(0), class = "nlist")
  )
  expect_identical(
    aggregate(nlists(nlist())),
    structure(list(), .Names = character(0), class = "nlist")
  )
  expect_identical(aggregate(nlists(nlist(x = 1), nlist(x = 2))), nlist(x = 1.5))
  expect_identical(
    aggregate(nlists(
      nlist(x = matrix(1:9, 3)),
      nlist(x = matrix(2:10, 3))
    )),
    structure(list(x = structure(c(
      1.5, 2.5, 3.5, 4.5, 5.5, 6.5,
      7.5, 8.5, 9.5
    ), .Dim = c(3L, 3L))), class = "nlist")
  )
})

test_that("aggregate.nlists", {
  expect_error(
    aggregate(nlists(
      nlist(x = matrix(1:9, 3)),
      nlist(x = matrix(2:10, 3))
    ), fun = identity),
    "^`fun` must return a scalar[.]$"
  )
})

test_that("aggregate.nlists by_chain = TRUE", {
  expect_identical(
    aggregate(nlists(), by_chain = TRUE),
    structure(list(), class = "nlists")
  )
  expect_identical(
    aggregate(nlists(nlist()), by_chain = TRUE),
    structure(list(structure(list(), .Names = character(0), class = "nlist")), class = "nlists")
  )
  expect_identical(
    aggregate(nlists(nlist(x = 1), nlist(x = 2)), by_chain = TRUE),
    structure(list(structure(list(x = 1.5), class = "nlist")), class = "nlists")
  )
  expect_identical(
    aggregate(nlists(
      nlist(x = matrix(1:9, 3)),
      nlist(x = matrix(2:10, 3))
    ), by_chain = TRUE),
    structure(list(structure(list(x = structure(c(
      1.5, 2.5,
      3.5, 4.5, 5.5, 6.5, 7.5, 8.5, 9.5
    ), .Dim = c(3L, 3L))), class = "nlist")), class = "nlists")
  )
  nlists <- nlists(nlist(x = matrix(1:9, 3)), nlist(x = matrix(2:10, 3)))
  attr(nlists, "nchains") <- 2L
  expect_equal(aggregate(nlists, by_chain = TRUE), nlists)
})
