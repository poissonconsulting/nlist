test_that("c.nlist", {
  expect_identical(c(nlist()), nlist())
  expect_identical(c(nlist(x = 1)), nlist(x = 1))
  expect_error(c(nlist(x = 1), list(x = 1)),
    "^All elements of ... must inherit from S3 class 'nlist'[.]$",
    class = "chk_error"
  )
  expect_identical(c(nlist(x = 1), nlist(y = 2)), nlist(x = 1, y = 2))
  expect_identical(c(nlist(), nlist()), nlist())
  expect_identical(c(nlist(), nlist(x = 1)), nlist(x = 1))
  expect_error(
    c(nlist(x = 1), nlist(x = 1)),
    "^nlist objects must have distinctly named numeric elements in order to be concatenated[.]$"
  )
})

test_that("c.nlists", {
  expect_identical(c(nlists()), nlists())
  expect_identical(c(nlists(nlist(x = 1))), nlists(nlist(x = 1)))
  expect_identical(
    c(
      nlists(nlist(x = 1)),
      nlists(nlist(x = 1))
    ),
    nlists(nlist(x = 1), nlist(x = 1))
  )
  expect_error(c(nlists(), list()),
    "^All elements of ... must inherit from S3 class 'nlists'[.]",
    class = "chk_error"
  )
  expect_error(c(
    nlists(nlist(x = 1)),
    nlists(nlist(y = 1))
  ),
  "^nlist elements of [.][.][.] must have matching names[.]$",
  class = "chk_error"
  )
})

test_that("c.nlists with different nchains", {
  nlists <- nlists(nlist(x = 1), nlist(x = 2))
  nlists2 <- nlists
  attr(nlists2, "nchains") <- 2L
  expect_error(
    c(nlists, nlists2),
    "^All elements of ... must have the same number of chains[.]"
  )
})

test_that("c.nlists with same nchains", {
  nlists <- nlists(nlist(x = 1), nlist(x = 2))
  nlists2 <- nlists(nlist(x = 3), nlist(x = 4))
  attr(nlists, "nchains") <- 2L
  attr(nlists2, "nchains") <- 2L
  expect_identical(
    c(nlists, nlists2),
    structure(list(
      structure(list(x = 1), class = "nlist"), structure(list(
        x = 3
      ), class = "nlist"), structure(list(x = 2), class = "nlist"),
      structure(list(x = 4), class = "nlist")
    ), class = "nlists", nchains = 2L)
  )
})

test_that("c.nlists with same nchains", {
  nlists <- nlists(nlist(x = 1), nlist(x = 2), nlist(x = 3), nlist(x = 4))
  nlists2 <- nlists(nlist(x = 5), nlist(x = 6), nlist(x = 7), nlist(x = 8))
  attr(nlists, "nchains") <- 2L
  attr(nlists2, "nchains") <- 2L
  expect_identical(
    c(nlists, nlists2),
    structure(list(
      structure(list(x = 1), class = "nlist"), structure(list(
        x = 2
      ), class = "nlist"), structure(list(x = 5), class = "nlist"),
      structure(list(x = 6), class = "nlist"), structure(list(x = 3), class = "nlist"),
      structure(list(x = 4), class = "nlist"), structure(list(x = 7), class = "nlist"),
      structure(list(x = 8), class = "nlist")
    ), class = "nlists", nchains = 2L)
  )
})
