test_that("thin", {
  expect_identical(
    thin(nlists(nlist(x = 1L), nlist(x = 2L), nlist(x = 3L), nlist(x = 4L)), nthin = 2),
    structure(list(structure(list(x = 1L), class = "nlist"), structure(list(
      x = 3L
    ), class = "nlist")), class = "nlists")
  )
})
