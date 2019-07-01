context("subset")

test_that("subset.nlist",{
  expect_identical(subset(nlist()), nlist())
  expect_identical(subset(nlist(x = 1)), nlist(x = 1))
  expect_identical(subset(nlist(x = 1, y = 2), pars  = "x"), nlist(x = 1))
  expect_identical(subset(nlist(x = 1, y = 2), pars  = "y"), nlist(y = 2))
  expect_error(subset(nlist(x = 1, y = 2), pars  = "z"), 
  "pars must be NULL OR pars can only include values 'x' or 'y'")
})

test_that("subset.nlists",{
  expect_identical(subset(nlists()), nlists())
  expect_identical(subset(nlists(nlist())), nlists(nlist()))
  expect_identical(subset(nlists(nlist(x = 1))), nlists(nlist(x = 1)))
  expect_identical(subset(nlists(nlist(x = 1, y = 2)), pars  = "x"), nlists(nlist(x = 1)))
  expect_identical(subset(nlists(nlist(x = 1, y = 2)), pars  = "y"), nlists(nlist(y = 2)))
  expect_identical(subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), pars  = "x"), nlists(nlist(x = 1), nlist(x = 3)))
  expect_error(subset(nlist(x = 1, y = 2), pars  = "z"), 
  "pars must be NULL OR pars can only include values 'x' or 'y'")
})
