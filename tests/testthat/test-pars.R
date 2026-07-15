test_that("pars.nlist", {
  expect_identical(pars(nlist()), character(0))
  expect_identical(pars(nlist(x = 1)), "x")
  expect_identical(pars(nlist(x = 1, a = 1:10)), c("x", "a"))

  expect_identical(pars(nlist(x = 1, a = 1:10), scalar = TRUE), "x")
  expect_identical(pars(nlist(x = 1, a = 1:10), scalar = TRUE), "x")
  lifecycle::expect_defunct(pars(nlist(x = 1, a = 1:10), terms = TRUE))
})

test_that("pars.nlists", {
  expect_identical(pars(nlists()), character(0))
  expect_identical(pars(nlists(nlist())), character(0))
  expect_identical(pars(nlists(nlist(x = 1))), "x")
  expect_identical(pars(nlists(nlist(x = 1), nlist(x = 1))), "x")
  expect_identical(pars(nlists(nlist(x = 1, a = 1:10))), c("x", "a"))
  expect_identical(
    pars(nlists(
      nlist(x = 1, a = 1:10),
      nlist(x = 1, a = 1:10)
    )),
    c("x", "a")
  )
})

test_that("pars.nlist scalar", {
  expect_identical(pars(nlist(), scalar = TRUE), character(0))
  expect_identical(pars(nlist(x = 1, a = 1:10), scalar = TRUE), "x")
  expect_identical(pars(nlist(x = 1, a = 1:10), scalar = FALSE), "a")
  expect_identical(pars(nlist(a = 1:10), scalar = TRUE), character(0))
})

test_that("pars.nlists scalar", {
  expect_identical(pars(nlists(), scalar = TRUE), character(0))
  expect_identical(pars(nlists(nlist()), scalar = TRUE), character(0))
  expect_identical(pars(nlists(nlist(), nlist()), scalar = TRUE), character(0))
  expect_identical(pars(nlists(nlist(x = 1, a = 1:10)), scalar = TRUE), "x")
  expect_identical(pars(nlists(nlist(a = 1:10)), scalar = TRUE), character(0))
  expect_identical(
    pars(nlists(nlist(x = 1, a = 1:10), nlist(x = 2, a = 1:10)), scalar = TRUE),
    "x"
  )
})

test_that("pars.mcmc", {
  mcmc <- as_mcmc(nlist(y = 1, a = 2:3))
  expect_identical(pars(mcmc), c("y", "a"))
  expect_identical(pars(mcmc, scalar = TRUE), "y")
  expect_identical(pars(mcmc, scalar = FALSE), "a")
  lifecycle::expect_defunct(pars(mcmc, terms = TRUE))
})

test_that("pars.mcmc.list", {
  mcmc_list <- as_mcmc_list(nlist(y = 1, a = 2:3))
  expect_identical(pars(mcmc_list), c("y", "a"))
  expect_identical(pars(mcmc_list, scalar = TRUE), "y")
  expect_identical(pars(mcmc_list, scalar = FALSE), "a")
  lifecycle::expect_defunct(pars(mcmc_list, terms = TRUE))
})

test_that("pars.nlists term", {
  lifecycle::expect_defunct(pars(
    nlists(nlist(x = 1, a = 1:2)),
    terms = TRUE
  ))
})
