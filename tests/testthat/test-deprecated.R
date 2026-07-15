test_that("is.natomic is defunct", {
  lifecycle::expect_defunct(is.natomic(1))
})

test_that("is.nlist is defunct", {
  lifecycle::expect_defunct(is.nlist(nlist()))
})

test_that("is.nlists is defunct", {
  lifecycle::expect_defunct(is.nlists(nlists()))
})
