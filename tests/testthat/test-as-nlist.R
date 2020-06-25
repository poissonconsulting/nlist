test_that("as_nlist.numeric", {
  expect_is(as_nlist(c(x = 1)), "nlist")
  expect_error(as_nlist(1), "^`x` must be named[.]$", class = "chk_error")
  expect_error(as_nlist(c(x = 1, x = 2)), "^`names[(]x[)]` must be unique[.]$", class = "chk_error")
  expect_error(as_nlist(c(`x[1]` = 1, `x[1,2]` = 2)), "^All elements of term vector `names[(]x[)]` must be consistent[.]$", class = "chk_error")
  expect_identical(as_nlist(c(`a[2]` = 1, `a[1]` = 2)), structure(list(a = c(2, 1)), class = "nlist"))
  expect_identical(as_nlist(c(`a[2]` = 3L, `a[1]` = 2L)), structure(list(a = c(2L, 3L)), class = "nlist"))
  y <- nlist(g = matrix(1:4, ncol = 2), z = 1:3)
  expect_equal(as_nlist(unlist_nlist(y)), y)
})


test_that("as_nlist.numeric incomplete", {
  expect_identical(as_nlist(c(`a[3]` = 1, `a[1]` = 2)), structure(list(a = c(2, NA, 1)), class = "nlist"))
  expect_identical(as_nlist(c(`a[3]` = 1L, `a[1]` = 2L)), structure(list(a = c(2L, NA, 1L)), class = "nlist"))
})

test_that("as_nlist.list", {
  expect_is(as_nlist(list(x = 1)), "nlist")
  expect_error(as_nlist(list(1)), "^`x` must be named[.]$", class = "chk_error")
})

test_that("as_nlist.nlist", {
  expect_identical(as_nlist(nlist()), nlist())
  expect_identical(as_nlist(as_nlist(list(x = 1))), as_nlist(list(x = 1)))
})

test_that("as_nlist.data.frame", {
  expect_identical(
    as_nlist(data.frame(
      lgl = c(TRUE, NA),
      int = 1:2,
      dbl = c(2.5, 1.5),
      dte = as.Date(c("2001-01-02", "2001-01-01")),
      fac = factor(c("b", "a"))
    )),
    structure(list(
      lgl = c(1L, NA), int = 1:2, dbl = c(2.5, 1.5),
      dte = c(11324, 11323), fac = 2:1
    ), class = "nlist")
  )
})

test_that("as.nlist deprecated", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  lifecycle::expect_deprecated(as.nlist(data.frame(x = 1)))
  expect_identical(
    as.nlist(data.frame(x = 1)),
    as_nlist(data.frame(x = 1))
  )
})
