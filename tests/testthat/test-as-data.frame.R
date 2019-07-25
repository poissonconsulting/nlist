context("as.data.frame")

test_that("as.data.frame.nlist", {
  expect_identical(as.data.frame(nlist()),
                   structure(list(term = structure(character(0), class = c("term", 
"character")), n1 = numeric(0)), class = c("tbl_df", "tbl", "data.frame"
), row.names = integer(0)))
  expect_identical(as.data.frame(nlist(x = 1)),
                   structure(list(term = structure("x", class = c("term", "character"
)), n1 = 1), class = c("tbl_df", "tbl", "data.frame"), row.names = c(NA, 
-1L)))
  expect_identical(as.data.frame(nlist(x = matrix(1:6, 2))),
                   structure(list(term = structure(c("x[1,1]", "x[2,1]", "x[1,2]", 
"x[2,2]", "x[1,3]", "x[2,3]"), class = c("term", "character")), 
    n1 = c(1:6)), class = c("tbl_df", "tbl", 
"data.frame"), row.names = c(NA, -6L)))
})

test_that("as.data.frame.nlists", {
      expect_identical(as.data.frame(nlists()),
                   structure(list(term = structure(character(0), class = c("term", 
"character"))), class = c("tbl_df", "tbl", "data.frame"), row.names = integer(0)))
      expect_identical(as.data.frame(nlists(nlist())),
                   structure(list(term = structure(character(0), class = c("term", 
"character"))), class = c("tbl_df", "tbl", "data.frame"), row.names = integer(0)))
  expect_identical(as.data.frame(nlists(nlist(x = 1))),
                   structure(list(term = structure("x", class = c("term", "character"
)), n1 = 1), class = c("tbl_df", "tbl", "data.frame"), row.names = c(NA, 
-1L)))
  expect_identical(as.data.frame(nlists(nlist(x = 1), nlist(x = 3))),
                   structure(list(term = structure("x", class = c("term", "character"
)), n1 = 1, n2 = 3), class = c("tbl_df", "tbl", "data.frame"), row.names = c(NA, 
-1L)))
  
  expect_identical(as.data.frame(nlists(nlist(x = 1, y = matrix(1:9, 3)), 
                 nlist(x = -2, y = matrix(2:10, 3)),
                 nlist(x = -2, y = matrix(2:10, 3)))),
                 structure(list(term = structure(c("x", "y[1,1]", "y[2,1]", "y[3,1]", 
"y[1,2]", "y[2,2]", "y[3,2]", "y[1,3]", "y[2,3]", "y[3,3]"), class = c("term", 
"character")), n1 = c(1, 1, 2, 3, 4, 5, 6, 7, 8, 9), n2 = c(-2, 
2, 3, 4, 5, 6, 7, 8, 9, 10), n3 = c(-2, 2, 3, 4, 5, 6, 7, 8, 
9, 10)), class = c("tbl_df", "tbl", "data.frame"), row.names = c(NA, 
-10L)))
})