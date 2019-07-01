context("as")

test_that("as.matrix.nlist", {
  expect_identical(as.matrix(nlist()),
                   structure(numeric(0), .Dim = 0:1, .Dimnames = list(NULL, "1")))
  expect_identical(as.matrix(nlist(x = 1)),
                   structure(1, .Dim = c(1L, 1L), .Dimnames = list("x", "1")))
  expect_identical(as.matrix(nlist(x = matrix(1:6, 2))),
                   structure(1:6, .Dim = c(6L, 1L), .Dimnames = list(c("x[1,1]", 
"x[2,1]", "x[1,2]", "x[2,2]", "x[1,3]", "x[2,3]"), "1")))
})

test_that("as.matrix.nlists", {
  expect_identical(as.matrix(nlists()),
                   structure(numeric(0), .Dim = c(0L, 0L), .Dimnames = list(NULL, 
    NULL)))
  expect_identical(as.matrix(nlists(nlist())),
                   structure(numeric(0), .Dim = 0:1, .Dimnames = list(NULL, "1")))
  expect_identical(as.matrix(nlists(nlist(), nlist())),
                   structure(numeric(0), .Dim = c(0L, 2L), .Dimnames = list(NULL, 
    c("1", "2"))))
  expect_identical(as.matrix(nlists(nlist(x = 1))),
                   structure(1, .Dim = c(1L, 1L), .Dimnames = list("x", "1")))
  expect_identical(as.matrix(nlists(nlist(x = 1), nlist(x = 3))),
                   structure(c(1, 3), .Dim = 1:2, .Dimnames = list("x", c("1", "2"
))))
  expect_identical(as.matrix(nlists(nlist(x = matrix(1:6, 2)))),
                   structure(1:6, .Dim = c(6L, 1L), .Dimnames = list(c("x[1,1]", 
"x[2,1]", "x[1,2]", "x[2,2]", "x[1,3]", "x[2,3]"), "1")))
  expect_identical(as.matrix(nlists(nlist(x = matrix(1:6, 2)), 
                                    nlist(x = matrix(3:8, 2)))),
                   structure(c(1L, 2L, 3L, 4L, 5L, 6L, 3L, 4L, 5L, 6L, 7L, 8L), .Dim = c(6L, 
2L), .Dimnames = list(c("x[1,1]", "x[2,1]", "x[1,2]", "x[2,2]", 
"x[1,3]", "x[2,3]"), c("1", "2"))))
})

