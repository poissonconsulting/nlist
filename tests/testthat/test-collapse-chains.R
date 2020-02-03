test_that("collapse_chains nlist", {
  nlist <- nlist(x = matrix(1:6, 2))
  expect_identical(collapse_chains(nlist), nlist)
})

test_that("collapse_chains nlists", {
  nlists <- nlists(nlist(x = matrix(1:6, 2)), nlist(x = matrix(3:8, 2)))
  nlists2 <- nlists
  attr(nlists2, "nchains") <- 2L

  expect_identical(collapse_chains(nlists2), nlists)
})
