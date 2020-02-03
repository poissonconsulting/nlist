test_that("nterms.nlist", {
  expect_identical(nterms(nlist()), 0L)
  expect_identical(nterms(nlist(x = 1)), 1L)
  expect_identical(nterms(nlist(x = 2:3)), 2L)
  expect_identical(nterms(nlist(x = 2:3, y = 1)), 3L)
  expect_identical(nterms(nlist(x = 2:3, y = matrix(1:9))), 11L)
})

test_that("nterms.nlists", {
  expect_identical(nterms(nlists()), 0L)
  expect_identical(nterms(nlists(nlist())), 0L)

  expect_identical(nterms(nlists(nlist(x = 1))), 1L)
  expect_identical(nterms(nlists(nlist(x = 2:3))), 2L)
  expect_identical(nterms(nlists(nlist(x = 2:3, y = 1))), 3L)
  expect_identical(nterms(nlists(nlist(x = 2:3, y = matrix(1:9)))), 11L)
  expect_identical(nterms(nlists(
    nlist(x = 2:3, y = matrix(1:9)),
    nlist(x = 2:3, y = matrix(1:9))
  )), 11L)
})
