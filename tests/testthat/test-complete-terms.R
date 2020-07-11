test_that("complete_terms 1 iteration", {
  mcmc <- as_mcmc(nlist(beta = matrix(1:4, nrow = 2)))
  expect_identical(complete_terms(mcmc), mcmc)
  mcmc[, "beta[2,2]"] <- NA
  expect_identical(complete_terms(mcmc), mcmc)
  mcmc2 <- mcmc
  mcmc2 <- mcmc2[, -4,drop = FALSE]
  expect_identical(complete_terms(mcmc2), mcmc)
})

test_that("complete_terms 2 iterations", {
  mcmc <- as_mcmc(nlists(nlist(beta = matrix(1:4, nrow = 2)), 
                          nlist(beta = matrix(1:4, nrow = 2))))
  expect_identical(complete_terms(mcmc), mcmc)
  mcmc[, "beta[2,2]"] <- NA
  expect_identical(complete_terms(mcmc), mcmc)
  mcmc2 <- mcmc
  mcmc2 <- mcmc2[, -4]
  expect_identical(complete_terms(mcmc2), mcmc)
})
