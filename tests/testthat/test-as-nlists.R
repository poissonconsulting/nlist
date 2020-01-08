context("as-nlists")

test_that("as.nlists.nlists", {
  expect_identical(as.nlists(nlists()), nlists())
})

test_that("as.nlists.nlist", {
  expect_identical(
    as.nlists(nlist()),
    structure(list(structure(list(), .Names = character(0), class = "nlist")), class = "nlists")
  )
  expect_identical(
    as.nlists(nlist(x = 1)),
    structure(list(structure(list(x = 1), class = "nlist")), class = "nlists")
  )
})
