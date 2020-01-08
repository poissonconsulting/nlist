context("chk")

test_that("chk_natomic", {
  expect_error(chk_natomic(list()),
    "^`list[(][)]` must be a numeric [(]integer or double[)] atomic [(]vector, matrix or array[)] object[.]",
    class = "chk_error"
  )
  expect_error(chk_natomic(NULL),
    "^`NULL` must be a numeric [(]integer or double[)] atomic [(]vector, matrix or array[)] object[.]",
    class = "chk_error"
  )
  expect_error(chk_natomic(NULL, x_name = "nine"),
    "^Nine must be a numeric [(]integer or double[)] atomic [(]vector, matrix or array[)] object[.]",
    class = "chk_error"
  )
  expect_false(vld_natomic(NULL))
  expect_null(chk_natomic(1))
  expect_invisible(chk_natomic(1))
  expect_true(vld_natomic(1))
  expect_true(vld_natomic(matrix(1)))
  expect_true(vld_natomic(array(1)))
})

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
})
