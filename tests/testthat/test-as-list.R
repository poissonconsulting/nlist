test_that("as_list.nlist", {
  expect_identical(as_list(nlist()), structure(list(), .Names = character(0)))
  expect_identical(as_list(nlist(x = 1)), list(x = 1))
  expect_identical(as_list(nlist(x = matrix(1:4))), list(x = matrix(1:4)))
  expect_identical(as_list(nlist(x = 1, a = 3)), list(x = 1, a = 3))
})

test_that("as_list.nlists", {
  expect_identical(as_list(nlists(nlist())), list())
  expect_identical(as_list(nlists(nlist(x = 1))), list(x = 1))
  expect_identical(as_list(nlists(nlist(x = matrix(1:4)))), list(x = matrix(1:4)))
  expect_identical(as_list(nlists(nlist(x = 1, a = 3))), list(x = 1, a = 3))
  expect_identical(as_list(nlists(nlist(x = 1), nlist(x = 3))), list(x = 1, x = 3))
  expect_identical(as_list(nlists(nlist(x = 1L), nlist(x = 3L))), list(x = 1L, x = 3L))
})
