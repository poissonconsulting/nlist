test_that("split_chains nlists", {
  nlists <- nlists(nlist(x = matrix(1:6, 2)), nlist(x = matrix(3:8, 2)))
  nlists2 <- nlists
  attr(nlists2, "nchains") <- 2L

  expect_identical(split_chains(nlists), nlists2)
})

test_that("split_chains nlists error", {
  nlists <- nlists(nlist(x = matrix(1:6, 2)))
  expect_error(split_chains(nlists), "^`x` must have at least two iterations[.]$",
    class = "chk_error"
  )
})

test_that("split_chains nlists extra iters", {
  nlists <- nlists(
    nlist(x = matrix(1:6, 2)), nlist(x = matrix(3:8, 2)),
    nlist(x = matrix(2:7, 2))
  )
  expect_identical(
    split_chains(nlists),
    structure(list(
      structure(list(x = structure(1:6, .Dim = 2:3)), class = "nlist"),
      structure(list(x = structure(3:8, .Dim = 2:3)), class = "nlist")
    ), class = "nlists", nchains = 2L)
  )
})
