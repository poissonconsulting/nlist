context("nlist")

test_that("nlist", {
  expect_identical(
    nlist(),
    structure(list(), .Names = character(0), class = "nlist")
  )
  expect_identical(
    nlist(x = 1),
    as.nlist(list(x = 1))
  )
  expect_identical(
    nlist(x = 1, y = 2),
    as.nlist(list(x = 1, y = 2))
  )
})
