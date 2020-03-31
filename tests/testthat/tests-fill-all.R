test_that("", {
  expect_identical(
    fill_all(nlist(x = c(2, NA), y = matrix(c(1:3, NA), nrow = 2))),
    structure(list(x = c(0, 0), y = structure(c(0L, 0L, 0L, 0L), .Dim = c(
      2L,
      2L
    ))), class = "nlist")
  )
  expect_identical(fill_all(nlist(x = c(2, NA), y = matrix(c(1:3, NA), nrow = 2)), nas = FALSE), structure(list(x = c(0, NA), y = structure(c(0L, 0L, 0L, NA), .Dim = c(
    2L,
    2L
  ))), class = "nlist"))

  expect_identical(
    fill_all(nlists(nlist(x = c(2, NA)), nlist(x = c(NA_real_, NA)))),
    structure(list(
      structure(list(x = c(0, 0)), class = "nlist"),
      structure(list(x = c(0, 0)), class = "nlist")
    ), class = "nlists")
  )
  expect_identical(fill_all(nlists(nlist(x = c(2, NA)), nlist(x = c(NA_real_, NA))), nas = FALSE), structure(list(
    structure(list(x = c(0, NA)), class = "nlist"),
    structure(list(x = c(NA_real_, NA_real_)), class = "nlist")
  ), class = "nlists"))
})
