context("as")

test_that("as.nlist.list", {
  expect_is(as.nlist(list(x = 1)), "nlist")
  expect_error(as.nlist(list(1)), "^`x` must be named[.]$", class = "chk_error")
})

test_that("as.nlist.nlist", {
  expect_identical(as.nlist(nlist()), nlist())
  expect_identical(as.nlist(as.nlist(list(x = 1))), as.nlist(list(x = 1)))
})

test_that("as.nlist.data.frame", {
  expect_identical(as.nlist(data.frame(lgl = c(TRUE, NA),
    int = 1:2,
    dbl = c(2.5, 1.5),
    dte = as.Date(c("2001-01-02", "2001-01-01")),
    fac = factor(c("b", "a")))),
  structure(list(lgl = c(1L, NA), int = 1:2, dbl = c(2.5, 1.5),
    dte = 11324:11323, fac = 2:1), class = "nlist"))
})
