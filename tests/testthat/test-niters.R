test_that("niters nlist", {
  expect_identical(niters(nlist()), 1L)
  expect_identical(niters(nlist(x = 1)), 1L)
})

test_that("niters nlists", {
  expect_identical(niters(nlists()), 0L)
  expect_identical(nsims(nlists(nlist())), 1L)
  expect_identical(nsims(nlists(nlist(), nlist())), 2L)
})

test_that("niters mcmc and mcmc.list", {
  expect_identical(niters(as_mcmc(nlist(x = 1))), 1L)
  expect_identical(niters(as_mcmc(nlists(nlist(x = 1), nlist(x = 2)))), 2L)
  expect_identical(niters(as_mcmc_list(nlist(x = 1))), 1L)
})
