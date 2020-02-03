test_that("fill_na.nlists", {
  expect_identical(
    fill_na(nlists()),
    nlists()
  )
  expect_identical(
    fill_na(nlists(nlist(x = c(2, NA)), nlist(x = c(NA_real_, NA)))),
    nlists(nlist(x = c(2, 0)), nlist(x = c(0, 0)))
  )
})
