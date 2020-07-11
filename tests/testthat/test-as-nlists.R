test_that("as_nlists.mcmc", {
  expect_identical(
    as_nlists(as_mcmc(nlist(x = 1))),
    nlists(nlist(x = 1))
  )

  expect_identical(
    as_nlists(as_mcmc(nlists(nlist(x = 1), nlist(x = 2)))),
    nlists(nlist(x = 1), nlist(x = 2))
  )
  expect_identical(
    as_nlists(as_mcmc(nlists(nlist(x = 1:2), nlist(x = 2:3)))),
    nlists(nlist(x = 1:2), nlist(x = 2:3))
  )
})

test_that("as_nlists.nlists", {
  expect_identical(as_nlists(nlists()), nlists())
})

test_that("as_nlists.nlist", {
  expect_identical(
    as_nlists(nlist()),
    structure(list(structure(list(), .Names = character(0), class = "nlist")), class = "nlists")
  )
  expect_identical(
    as_nlists(nlist(x = 1)),
    structure(list(structure(list(x = 1), class = "nlist")), class = "nlists")
  )
})

test_that("as.nlists deprecated", {
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  lifecycle::expect_deprecated(as.nlists(nlist(x = 1)))

  expect_identical(
    as.nlists(nlist(x = 1)),
    as_nlists(nlist(x = 1))
  )
})
