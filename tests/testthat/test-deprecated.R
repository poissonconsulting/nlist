test_that("is.natomic deprecated", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  lifecycle::expect_deprecated(is.natomic(data.frame()))

  expect_true(is.natomic(1))
})


test_that("is.nlist deprecated", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  lifecycle::expect_deprecated(is.nlist(1))

  expect_false(is.nlist(1))
  expect_true(is.nlist(nlist()))
})

test_that("is.nlists deprecated", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  lifecycle::expect_deprecated(is.nlists(1))

  expect_false(is.nlists(1))
  expect_true(is.nlists(nlists()))
})
