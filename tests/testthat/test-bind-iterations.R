test_that("bind_iterations.mcmc", {
  expect_equal(
    bind_iterations(as_mcmc(nlist(x = 1)), as_mcmc(nlist(x = 3))),
    as_mcmc(nlists(nlist(x = 1), nlist(x = 3))),
    ignore_attr = TRUE
  )
  expect_identical(
    niters(bind_iterations(as_mcmc(nlist(x = 1)), as_mcmc(nlist(x = 3)))),
    2L
  )
  expect_error(
    bind_iterations(as_mcmc(nlist(x = 1)), 1),
    "^`x2` must inherit from S3 class 'mcmc'",
    class = "chk_error"
  )
  expect_error(
    bind_iterations(as_mcmc(nlist(x = 1)), as_mcmc(nlist(y = 1))),
    "^`x` and `x2` must have the same parameters[.]$",
    class = "chk_error"
  )
  expect_error(
    bind_iterations(as_mcmc(nlist(x = 1)), as_mcmc(nlist(x = 1:2))),
    "^`x` and `x2` must have the same parameter dimensions[.]$",
    class = "chk_error"
  )
})

test_that("bind_iterations.mcmc.list", {
  expect_equal(
    bind_iterations(as_mcmc_list(nlist(x = 1)), as_mcmc_list(nlist(x = 3))),
    as_mcmc_list(nlists(nlist(x = 1), nlist(x = 3))),
    ignore_attr = TRUE
  )

  mcmc_list <- as_mcmc_list(split_chains(nlists(nlist(x = 1), nlist(x = 2))))
  mcmc_list2 <- as_mcmc_list(split_chains(nlists(nlist(x = 5), nlist(x = 6))))
  bound <- bind_iterations(mcmc_list, mcmc_list2)
  expect_identical(nchains(bound), 2L)
  expect_identical(niters(bound), 2L)
  expect_equal(
    bound,
    as_mcmc_list(split_chains(nlists(
      nlist(x = 1),
      nlist(x = 5),
      nlist(x = 2),
      nlist(x = 6)
    ))),
    ignore_attr = TRUE
  )

  expect_error(
    bind_iterations(mcmc_list, as_mcmc_list(nlist(x = 3))),
    "^`x` and `x2` must have the same number of chains[.]$",
    class = "chk_error"
  )
  expect_error(
    bind_iterations(as_mcmc_list(nlist(x = 1)), as_mcmc_list(nlist(y = 1))),
    "^`x` and `x2` must have the same parameters[.]$",
    class = "chk_error"
  )
  expect_error(
    bind_iterations(as_mcmc_list(nlist(x = 1)), as_mcmc_list(nlist(x = 1:2))),
    "^`x` and `x2` must have the same parameter dimensions[.]$",
    class = "chk_error"
  )
})
