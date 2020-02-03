test_that("nsams.nlist", {
  expect_identical(nsams(nlist()), 0L)
  expect_identical(nsams(nlist(x = 1)), 1L)
  expect_identical(nsams(nlist(x = 2:3)), 2L)
  expect_identical(nsams(nlist(x = 2:3, y = 1)), 3L)
  expect_identical(nsams(nlist(x = 2:3, y = matrix(1:9))), 11L)
})

test_that("nsams.nlists", {
  expect_identical(nsams(nlists()), 0L)
  expect_identical(nsams(nlists(nlist())), 0L)

  expect_identical(nsams(nlists(nlist(x = 1))), 1L)
  expect_identical(nsams(nlists(nlist(x = 2:3))), 2L)
  expect_identical(nsams(nlists(nlist(x = 2:3, y = 1))), 3L)
  expect_identical(nsams(nlists(nlist(x = 2:3, y = matrix(1:9)))), 11L)
  expect_identical(nsams(nlists(
    nlist(x = 2:3, y = matrix(1:9)),
    nlist(x = 2:3, y = matrix(1:9))
  )), 22L)
})
