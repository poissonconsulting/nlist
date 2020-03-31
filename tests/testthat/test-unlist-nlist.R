test_that("unlist_nlist", {
  expect_identical(
    unlist_nlist(nlist()),
    structure(numeric(0), .Names = character(0))
  )
  expect_identical(
    unlist_nlist(nlist(z = NA)),
    c(z = NA_real_)
  )
  expect_identical(
    unlist_nlist(nlist(y = 2, x = matrix(4:7, ncol = 2))),
    c(y = 2, `x[1,1]` = 4, `x[2,1]` = 5, `x[1,2]` = 6, `x[2,2]` = 7)
  )
})

test_that("unlist.nlists not defined", {
  expect_error(
    unlist(nlists()),
    "^`unlist[(][)]` is not defined for nlists objects[.]$"
  )
})
