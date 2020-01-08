context("print")

test_that("print.nlist", {
  skip_on_covr()
  expect_identical(
    capture.output(print(nlist())),
    "an nlist object with 0 natomic elements"
  )
  expect_identical(
    capture.output(print(nlist(x = 1))),
    c("$x", "[1] 1", "", "an nlist object with 1 natomic element")
  )
  expect_identical(
    capture.output(print(nlist(x = 1, y = matrix(1:4, 2)))),
    c(
      "$x", "[1] 1", "", "$y", "     [,1] [,2]", "[1,]    1    3",
      "[2,]    2    4", "", "an nlist object with 2 natomic elements"
    )
  )
})

test_that("print.nlists", {
  skip_on_covr()
  expect_identical(
    capture.output(print(nlists())),
    "an nlists object with 0 nlist objects"
  )

  expect_identical(
    capture.output(print(nlists(nlist()))),
    "an nlists object of an nlist object with 0 natomic elements"
  )

  nlist <- nlist(x = 1, y = matrix(1:4, 2))
  nlists <- nlists(nlist, nlist)

  expect_identical(
    capture.output(print(nlists)),
    c(
      "$x", "[1] 1", "", "$y", "     [,1] [,2]", "[1,]    1    3",
      "[2,]    2    4", "", "an nlists object of 2 nlist objects each with 2 natomic elements"
    )
  )
})

test_that("print.nlists multiple chains", {
  skip_on_covr()

  nlist <- nlist(x = 1, y = matrix(1:4, 2))
  nlists <- nlists(nlist, nlist)
  attr(nlists, "nchains") <- 2L

  expect_identical(
    capture.output(print(nlists)),
    c(
      "$x", "[1] 1", "", "$y", "     [,1] [,2]", "[1,]    1    3",
      "[2,]    2    4", "", "an nlists object with 2 chains of an nlist object with 2 natomic elements"
    )
  )
})
