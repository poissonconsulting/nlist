context("npdims")

test_that("npdims.nlist", {
  expect_identical(npdims(nlist()), integer(0))
  expect_identical(
    npdims(nlist(x = 1:3, y = matrix(1, c(2, 3)))),
    c(x = 1L, y = 2L)
  )
})

test_that("npdims.nlists", {
  expect_identical(npdims(nlists()), integer(0))
  expect_identical(npdims(nlists(nlist())), integer(0))
  expect_identical(
    npdims(nlists(
      nlist(x = 1:3, y = matrix(1, c(2, 3))),
      nlist(x = 1:3, y = matrix(1, c(2, 3)))
    )),
    c(x = 1L, y = 2L)
  )
})
