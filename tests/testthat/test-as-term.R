test_that("as.term.nlist", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  expect_identical(
    as.term(nlist()),
    term()
  )
  expect_identical(
    as.term(nlist(x = 1)),
    term("x")
  )
  expect_identical(
    as.term(nlist(x = 1:2)),
    term("x[1]", "x[2]")
  )
  expect_identical(
    as.term(nlist(x = 1, y = 2:3)),
    term(c("x", "y[1]", "y[2]"))
  )
  expect_identical(
    as.term(nlist(x = 1, y = matrix(1:3, c(1, 3)))),
    term(c("x", "y[1,1]", "y[1,2]", "y[1,3]"))
  )
})

test_that("as.term.nlists", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  expect_identical(
    as.term(nlists()),
    term(x = 0)
  )
  expect_identical(
    as.term(nlists(nlist())),
    term(x = 0)
  )
  expect_identical(
    as.term(nlists(nlist(x = 1))),
    term("x")
  )
  expect_identical(
    as.term(nlists(nlist(x = 1:2))),
    term(x = 2)
  )
  expect_identical(
    as.term(nlists(
      nlist(x = 1, y = matrix(1:3, c(1, 3))),
      nlist(x = 1, y = matrix(1:3, c(1, 3)))
    )),
    term("x", y = c(1, 3))
  )
})

test_that("as_term.nlist", {
  expect_identical(
    as_term(nlist()),
    term()
  )
  expect_identical(
    as_term(nlist(x = 1)),
    term("x")
  )
  expect_identical(
    as_term(nlist(x = 1:2)),
    term("x[1]", "x[2]")
  )
  expect_identical(
    as_term(nlist(x = 1, y = 2:3)),
    term(c("x", "y[1]", "y[2]"))
  )
  expect_identical(
    as_term(nlist(x = 1, y = matrix(1:3, c(1, 3)))),
    term(c("x", "y[1,1]", "y[1,2]", "y[1,3]"))
  )
})

test_that("as_term.nlists", {
  expect_identical(
    as_term(nlists()),
    term(x = 0)
  )
  expect_identical(
    as_term(nlists(nlist())),
    term(x = 0)
  )
  expect_identical(
    as_term(nlists(nlist(x = 1))),
    term("x")
  )
  expect_identical(
    as_term(nlists(nlist(x = 1:2))),
    term(x = 2)
  )
  expect_identical(
    as_term(nlists(
      nlist(x = 1, y = matrix(1:3, c(1, 3))),
      nlist(x = 1, y = matrix(1:3, c(1, 3)))
    )),
    term("x", y = c(1, 3))
  )
})
