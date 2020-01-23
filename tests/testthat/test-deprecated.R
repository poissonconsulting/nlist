context("deprecated")

test_that("is.natomic deprecated", {
  rlang::with_options(lifecycle_verbosity = "error", {
    expect_error(is.natomic(data.frame()), class = "defunctError")
  })
  
  rlang::with_options(lifecycle_verbosity = "quiet", {
    expect_true(is.natomic(1))
  })
})
