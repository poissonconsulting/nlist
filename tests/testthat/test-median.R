context("median")

test_that("median.nlist",{
  expect_identical(median(nlist(x = 1L, y = matrix(1:2))),
                   list(x = 1L, y = 1.5))
  expect_identical(median(nlist(x = c(1L, NA), y = 3)),
                   list(x = NA_integer_, y = 3))
  expect_identical(median(nlist(x = c(1L, NA), y = 3), na.rm = TRUE),
                   list(x = 1L, y = 3))
})
