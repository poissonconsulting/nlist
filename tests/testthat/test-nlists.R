test_that("nlists", {
  expect_identical(
    nlists(),
    structure(list(), class = "nlists")
  )

  expect_identical(
    nlists(nlist()),
    structure(list(structure(list(),
      .Names = character(0),
      class = "nlist"
    )), class = "nlists")
  )
  expect_identical(
    nlists(nlist(x = 1)),
    structure(list(structure(list(x = 1), class = "nlist")),
      class = "nlists"
    )
  )

  expect_identical(
    nlists(nlist(x = 1), nlist(x = 2)),
    structure(list(
      structure(list(x = 1), class = "nlist"),
      structure(list(
        x = 2
      ), class = "nlist")
    ), class = "nlists")
  )

  expect_error(nlists(nlist(x = 1), nlist(y = 2)),
    "^nlist elements of `x` must have matching names[.]$",
    class = "chk_error"
  )
})
