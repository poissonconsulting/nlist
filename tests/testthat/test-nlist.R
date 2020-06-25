test_that("nlist", {
  expect_identical(
    nlist(),
    structure(list(), .Names = character(0), class = "nlist")
  )
  expect_identical(
    nlist(x = 1),
    as_nlist(list(x = 1))
  )
  expect_identical(
    nlist(x = 1, y = 2),
    as_nlist(list(x = 1, y = 2))
  )
  expect_error(
    nlist(x = "x"),
    "no applicable method for 'numericise' applied to an object of class \"character\""
  )
})
