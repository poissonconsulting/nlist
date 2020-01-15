context("relist")

test_that("relist_nlist", {
  expect_identical(relist_nlist(
    structure(numeric(0), .Names = character(0)),
    nlist()
  ), nlist())
  expect_identical(
    relist_nlist(c(a = 5), nlist(a = NA_real_)),
    nlist(a = 5)
  )
  expect_identical(
    relist_nlist(c(a = 5), nlist(a = NA_integer_)),
    nlist(a = 5L)
  )
  expect_identical(
    relist_nlist(c(`a[2]` = 5), nlist(a = c(1, 2, 3))),
    nlist(a = c(NA, 5, NA))
  )
  expect_identical(
    relist_nlist(c(`a[2]` = 5), nlist(a = 1:3)),
    nlist(a = c(NA, 5L, NA))
  )
})
