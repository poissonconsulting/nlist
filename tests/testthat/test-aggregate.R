test_that("aggregate.nlist is defunct", {
  lifecycle::expect_defunct(aggregate(nlist(x = 1)))
})

test_that("aggregate.nlists is defunct", {
  lifecycle::expect_defunct(aggregate(nlists(nlist(x = 1), nlist(x = 2))))
})
