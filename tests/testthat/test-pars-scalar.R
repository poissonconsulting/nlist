test_that("pars_scalar.nlist", {
  expect_identical(pars_scalar(nlist()), character(0))
  expect_identical(pars_scalar(nlist(x = 1, a = 1:10)),"x")
  expect_identical(pars_scalar(nlist(a = 1:10)), character(0))
})

test_that("pars_scalar.nlists", {
  expect_identical(pars_scalar(nlists()), character(0))
  expect_identical(pars_scalar(nlists(nlist())), character(0))
  expect_identical(pars_scalar(nlists(nlist(), nlist())), character(0))
  expect_identical(pars_scalar(nlists(nlist(x = 1, a = 1:10))),"x")
  expect_identical(pars_scalar(nlists(nlist(a = 1:10))), character(0))
  expect_identical(pars_scalar(nlists(nlist(x = 1, a = 1:10), nlist(x = 2, a = 1:10))),"x")
})
