test_that("sort.mcmc", {
  mcmc <- as_mcmc(nlist(y = 1, a = 2:3))
  sorted <- sort(mcmc)
  expect_s3_class(sorted, "mcmc")
  expect_identical(colnames(sorted), c("a[1]", "a[2]", "y"))
  expect_identical(sort(sorted), sorted)
})

test_that("sort.mcmc.list", {
  mcmc_list <- as_mcmc_list(nlist(y = 1, a = 2:3))
  sorted <- sort(mcmc_list)
  expect_s3_class(sorted, "mcmc.list")
  expect_identical(colnames(sorted[[1]]), c("a[1]", "a[2]", "y"))
})
