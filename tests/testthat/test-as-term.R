context("as-term")

test_that("as.term.nlist", {
  expect_identical(
    term::as.term(nlist()),
    structure(character(0), class = c("term", "character"))
  )
  expect_identical(
    term::as.term(nlist(x = 1)),
    structure("x", class = c("term", "character"))
  )
  expect_identical(
    term::as.term(nlist(x = 1:2)),
    structure(c("x[1]", "x[2]"), class = c("term", "character"))
  )
  expect_identical(
    term::as.term(nlist(x = 1, y = 2:3)),
    structure(c("x", "y[1]", "y[2]"), class = c("term", "character"))
  )
  expect_identical(
    term::as.term(nlist(x = 1, y = matrix(1:3, c(1, 3)))),
    structure(c("x", "y[1,1]", "y[1,2]", "y[1,3]"), class = c(
      "term",
      "character"
    ))
  )
})

test_that("as.term.nlists", {
  expect_identical(
    term::as.term(nlists(nlist())),
    structure(character(0), class = c("term", "character"))
  )
  expect_identical(
    term::as.term(nlists(nlist(x = 1))),
    structure("x", class = c("term", "character"))
  )
  expect_identical(
    term::as.term(nlists(nlist(x = 1:2))),
    structure(c("x[1]", "x[2]"), class = c("term", "character"))
  )
  expect_identical(
    term::as.term(nlists(
      nlist(x = 1, y = matrix(1:3, c(1, 3))),
      nlist(x = 1, y = matrix(1:3, c(1, 3)))
    )),
    structure(c("x", "y[1,1]", "y[1,2]", "y[1,3]"), class = c(
      "term",
      "character"
    ))
  )
})
