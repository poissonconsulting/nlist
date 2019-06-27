context("new")

test_that("new_nlist",{
  expect_identical(new_nlist(), 
                   structure(list(), .Names = character(0), class = "nlist"))
})