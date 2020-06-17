context("as-term")

test_that("as.term.nlist", {
  expect_identical(
    term::as.term(nlist()),
    as.term(character(0))
  )
  expect_identical(
    term::as.term(nlist(x = 1)),
    as.term("x")
  )
  expect_identical(
    term::as.term(nlist(x = 1:2)),
    as.term(c("x[1]", "x[2]"))
  )
  expect_identical(
    term::as.term(nlist(x = 1, y = 2:3)),
    as.term(c("x", "y[1]", "y[2]"))
  )
  expect_identical(
    term::as.term(nlist(x = 1, y = matrix(1:3, c(1, 3)))),
    as.term(c("x", "y[1,1]", "y[1,2]", "y[1,3]"))
  )
})

test_that("as.term.nlists", {
  expect_identical(
    term::as.term(nlists(nlist())),
    as.term(character(0))
  )
  expect_identical(
    term::as.term(nlists(nlist(x = 1))),
    as.term("x")
  )
  expect_identical(
    term::as.term(nlists(nlist(x = 1:2))),
    as.term(c("x[1]", "x[2]"))
  )
  expect_identical(
    term::as.term(nlists(
      nlist(x = 1, y = matrix(1:3, c(1, 3))),
      nlist(x = 1, y = matrix(1:3, c(1, 3)))
    )),
    as.term(c("x", "y[1,1]", "y[1,2]", "y[1,3]"))
  )
})
