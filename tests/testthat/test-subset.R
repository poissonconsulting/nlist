test_that("subset.nlist", {
  expect_identical(subset(nlist()), nlist())
  expect_identical(subset(nlist(x = 1)), nlist(x = 1))
  expect_identical(subset(nlist(x = 1, y = 2), pars = "x"), nlist(x = 1))
  expect_identical(subset(nlist(x = 1, y = 2), pars = "y"), nlist(y = 2))
  expect_identical(subset(nlist(x = 1, y = 2), pars = c("y", "x")), nlist(y = 2, x = 1))
  expect_identical(subset(nlist(x = 1, y = 2), pars = c("x", "y")), nlist(x = 1, y = 2))
  expect_error(subset(nlist(x = 1, y = 2), pars = "z"),
    "^`pars` must match 'x' or 'y', not 'z'[.]$",
    class = "chk_error"
  )
})

test_that("subset.nlists pars and iters", {
  expect_identical(subset(nlists()), nlists())
  expect_identical(subset(nlists(nlist())), nlists(nlist()))
  expect_identical(subset(nlists(nlist(x = 1))), nlists(nlist(x = 1)))
  expect_identical(subset(nlists(nlist(x = 1, y = 2)), pars = "x"), nlists(nlist(x = 1)))
  expect_identical(subset(nlists(nlist(x = 1, y = 2)), pars = "y"), nlists(nlist(y = 2)))
  expect_identical(subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), pars = "x"), nlists(nlist(x = 1), nlist(x = 3)))
  expect_identical(
    subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), pars = c("y", "x")),
    subset(nlists(nlist(y = 2, x = 1), nlist(y = 2, x = 3)))
  )
  expect_identical(
    subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), iters = 1L),
    subset(nlists(nlist(x = 1, y = 2)))
  )
  expect_identical(
    subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), iters = c(1L, 1L)),
    subset(nlists(nlist(x = 1, y = 2), nlist(x = 1, y = 2)))
  )
  expect_identical(
    subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), iters = c(2L, 1L)),
    subset(nlists(nlist(x = 3, y = 2), nlist(x = 1, y = 2)))
  )
  expect_identical(
    subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), iters = c(2L, 1L), pars = "x"),
    subset(nlists(nlist(x = 3), nlist(x = 1)))
  )
  expect_identical(
    subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), iters = integer(0)),
    subset(nlists())
  )
  expect_identical(
    subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), iters = integer(0), pars = "x"),
    subset(nlists())
  )
  expect_error(subset(nlists(nlist(x = 1, y = 2)), pars = "z"),
    "^`pars` must match 'x' or 'y', not 'z'[.]$",
    class = "chk_error"
  )
})


test_that("subset with chains", {
  nlists <- nlists(nlist(x = 1, y = 2), nlist(x = 2, y = 3), nlist(x = 3, y = 4), nlist(x = 4, y = 5))
  attr(nlists, "nchains") <- 2L
  expect_identical(subset(nlists), nlists)
  expect_identical(
    subset(nlists, pars = c("y", "x")),
    structure(list(
      structure(list(y = 2, x = 1), class = "nlist"),
      structure(list(y = 3, x = 2), class = "nlist"), structure(list(
        y = 4, x = 3
      ), class = "nlist"), structure(list(
        y = 5,
        x = 4
      ), class = "nlist")
    ), class = "nlists", nchains = 2L)
  )
  expect_identical(
    subset(nlists, chains = c(1, 1, 1)),
    structure(list(
      structure(list(x = 1, y = 2), class = "nlist"),
      structure(list(x = 2, y = 3), class = "nlist"), structure(list(
        x = 1, y = 2
      ), class = "nlist"), structure(list(
        x = 2,
        y = 3
      ), class = "nlist"), structure(list(x = 1, y = 2), class = "nlist"),
      structure(list(x = 2, y = 3), class = "nlist")
    ), class = "nlists", nchains = 3L)
  )
  expect_identical(
    subset(nlists, pars = "x", iters = c(2, 2)),
    structure(list(
      structure(list(x = 2), class = "nlist"), structure(list(
        x = 2
      ), class = "nlist"), structure(list(x = 4), class = "nlist"),
      structure(list(x = 4), class = "nlist")
    ), class = "nlists", nchains = 2L)
  )
})
