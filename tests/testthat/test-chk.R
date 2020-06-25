test_that("chk_nlist", {
  expect_error(chk_nlist(NULL),
    "^`NULL` must inherit from S3 class 'nlist'[.]$",
    class = "chk_error"
  )
  expect_false(vld_nlist(list()))
  expect_false(vld_nlist(list(x = 1, x = 2)))
  expect_error(chk_nlist(list(x = 1, x = 2)), "^`list[(]x = 1, x = 2[)]` must inherit from S3 class 'nlist'[.]$", class = "chk_error")
  expect_true(vld_nlist(nlist(x = 1, y = 2)))
  expect_true(vld_nlist(nlist(x = 1)[-1]))
  expect_true(vld_nlist(nlist()))
  expect_true(vld_nlist(nlist(x = 1)))
  expect_false(vld_nlist(list(x = TRUE)))
  expect_error(chk_nlist(list(x = TRUE)),
    "`list[(]x = TRUE[)]` must inherit from S3 class 'nlist'[.]",
    class = "chk_error"
  )
  x <- list(x = "x")
  class(x) <- "nlist"
  expect_false(vld_nlist(x))
})

test_that("chk_nlists", {
  expect_error(chk_nlists(list()), "^`list[(][)]` must inherit from S3 class 'nlists'[.]$", class = "chk_error")
  expect_true(vld_nlists(nlists()))
  expect_error(chk_nlists(list(nlist(x = 1))), "^`[^`]+` must inherit from S3 class 'nlists'[.]$", class = "chk_error")
  expect_true(vld_nlists(nlists(nlist())))
  expect_true(vld_nlists(nlists(nlist(x = 1), nlist(x = 2))))
  expect_true(vld_nlists(nlists(nlist(x = 1), nlist(x = 2))))
  expect_error(nlists(nlist(x = 1), nlist(y = 2)),
    "^nlist elements of `x` must have matching names[.]",
    class = "chk_error"
  )
  expect_error(nlists(nlist(x = 1), nlist(x = 1L)),
    "^nlist elements of `x` must have matching types[.]",
    class = "chk_error"
  )
  expect_error(nlists(nlist(x = 1L), nlist(x = 1:2)),
    "^nlist elements of `x` must have matching dimensions[.]",
    class = "chk_error"
  )
  x <- list(x = "x")
  class(x) <- "nlist"
  expect_error(chk_nlist(x), "All elements of `x` must be numeric.",
    class = "chk_error"
  )
  x <- list("x")
  class(x) <- "nlist"
  expect_error(chk_nlist(x), "`x` must be named.", class = "chk_error")
})
