context("deprecated")

test_that("is.natomic deprecated", {
  rlang::with_options(lifecycle_verbosity = "error", {
    expect_error(is.natomic(data.frame()), class = "defunctError")
  })
  
  rlang::with_options(lifecycle_verbosity = "quiet", {
    expect_true(is.natomic(1))
  })
})


test_that("is.nlist deprecated", {
  rlang::with_options(lifecycle_verbosity = "error", {
    expect_error(is.nlist(1), class = "defunctError")
  })
  
  rlang::with_options(lifecycle_verbosity = "quiet", {
    expect_false(is.nlist(1))
    expect_true(is.nlist(nlist()))
  })
})

test_that("is.nlists deprecated", {
  rlang::with_options(lifecycle_verbosity = "error", {
    expect_error(is.nlists(1), class = "defunctError")
  })
  
  rlang::with_options(lifecycle_verbosity = "quiet", {
    expect_false(is.nlists(1))
    expect_true(is.nlists(nlists()))
  })
})
