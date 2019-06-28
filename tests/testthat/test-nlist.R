context("nlist")

test_that("nlist",{
  expect_identical(nlist(), 
                   structure(list(), .Names = character(0), class = "nlist"))
})