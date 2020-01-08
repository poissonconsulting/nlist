context("brackets")

test_that("[.nlist", {
  expect_identical(nlist(x = 1)[1], nlist(x = 1))
  expect_identical(nlist(x = 1, y = 2)[1], nlist(x = 1))
  expect_identical(nlist(x = 1, y = 2)["x"], nlist(x = 1))
  expect_identical(nlist(x = 1, y = 2)[2], nlist(y = 2))
  expect_identical(nlist(x = 1, y = 2)["y"], nlist(y = 2))
  expect_error(nlist(x = 1, y = 2)[c(1, 1)], "^names[(]`x`[)] must be unique[.]$",
    class = "chk_error"
  )
  expect_error(nlist(x = 1)[1, ], "incorrect number of dimensions")
})

test_that("[.nlists", {
  expect_identical(nlists(nlist(x = 1))[1], nlists(nlist(x = 1)))
  expect_identical(nlists(nlist(x = 1), nlist(x = 1))[1], nlists(nlist(x = 1)))
  expect_identical(
    nlists(nlist(x = 1), nlist(x = 2))[2:1],
    nlists(nlist(x = 2), nlist(x = 1))
  )
  expect_identical(
    nlists(nlist(x = 1), nlist(x = 3))[c(2, 2)],
    nlists(nlist(x = 3), nlist(x = 3))
  )
  expect_identical(nlists(nlist(x = 1))[1, 1], nlists(nlist(x = 1)))
  expect_identical(
    nlists(nlist(x = 1, y = 1), nlist(x = 2, y = 2))[1, 1],
    structure(list(structure(list(x = 1, y = 1), class = "nlist")), class = "nlists")
  )
  expect_identical(
    nlists(nlist(x = 1, y = 1), nlist(x = 1, y = 1))[, 1],
    nlists(nlist(x = 1, y = 1))
  )
  expect_identical(
    nlists(nlist(x = 1, y = 1), nlist(x = 1, y = 1))[, ],
    nlists(nlist(x = 1, y = 1), nlist(x = 1, y = 1))
  )
  expect_identical(
    nlists(nlist(x = 1, y = 1), nlist(x = 1, y = 1))[],
    nlists(nlist(x = 1, y = 1), nlist(x = 1, y = 1))
  )
})

test_that("brackets with chains", {
  nlists <- nlists(nlist(x = 1, y = 2), nlist(x = 2, y = 3), nlist(x = 3, y = 4), nlist(x = 4, y = 5))
  attr(nlists, "nchains") <- 2L
  expect_identical(nlists[1:2, 1:2], nlists)
  expect_identical(nlists[, 1:2], nlists)
  expect_identical(nlists[1:2, ], nlists)
  expect_identical(nlists[, ], nlists)
  expect_identical(nlists[], structure(list(
    structure(list(x = 1, y = 2), class = "nlist"),
    structure(list(x = 2, y = 3), class = "nlist"), structure(list(
      x = 3, y = 4
    ), class = "nlist"), structure(list(
      x = 4,
      y = 5
    ), class = "nlist")
  ), class = "nlists"))
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
