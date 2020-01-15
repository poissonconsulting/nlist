context("fill-na")

test_that("fill_na atomic objects", {
  expect_identical(fill_na(numeric(0)), numeric(0))
  expect_identical(fill_na(integer(0)), integer(0))
  expect_identical(fill_na(NA), FALSE)
  expect_identical(fill_na(c(10L, NA)), c(10L, 0L))
  expect_identical(
    fill_na(matrix(c(1L, 3L, 7L, NA), nrow = 2)),
    matrix(c(1L, 3L, 7L, 0L), nrow = 2)
  )
  expect_identical(fill_na(c(10L, NA), value = 11L), c(10L, 11L))
  expect_identical(fill_na(c(10L, NA), value = 11), c(10L, 11L))
  expect_identical(
    fill_na(matrix(c(TRUE, NA, FALSE, NA), nrow = 2),
      value = "TRUE"
    ),
    matrix(c(TRUE, TRUE, FALSE, TRUE), nrow = 2)
  )
})

test_that("fill_na.nlist", {
  expect_identical(
    fill_na(nlist()),
    nlist()
  )
  expect_identical(
    fill_na(nlist(x = c(2, NA), y = matrix(c(1:3, NA), nrow = 2))),
    nlist(x = c(2, 0), y = matrix(c(1:3, 0L), nrow = 2))
  )
  expect_identical(
    fill_na(nlist(x = c(2, NA), y = matrix(c(1:3, NA), nrow = 2)),
      value = 5
    ),
    nlist(x = c(2, 5), y = matrix(c(1:3, 5L), nrow = 2))
  )
})

test_that("fill_na.nlists", {
  expect_identical(
    fill_na(nlists()),
    nlists()
  )
  expect_identical(
    fill_na(nlists(nlist(x = c(2, NA)), nlist(x = c(NA_real_, NA)))),
    nlists(nlist(x = c(2, 0)), nlist(x = c(0, 0)))
  )
})
