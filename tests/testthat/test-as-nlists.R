context("as-nlists")

test_that("as.nlists.nlists", {
  expect_identical(as.nlists(nlists()), nlists())
})
