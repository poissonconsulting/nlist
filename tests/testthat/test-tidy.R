context("tidy")

test_that("tidy.nlist", {
  expect_identical(tidy(nlist()), structure(list(term = structure(character(0), class = c("term", 
"character"))), row.names = integer(0), class = c("tbl_df", "tbl", 
"data.frame")))
  expect_identical(tidy(nlist(x = 2)), structure(list(term = structure("x", class = c("term", "character"
)), value1 = 2), row.names = c(NA, -1L), class = c("tbl_df", 
"tbl", "data.frame")))
    expect_identical(tidy(nlist(x = 2:4)), structure(list(term = structure(c("x[1]", "x[2]", "x[3]"), class = c("term", 
"character")), value1 = as.numeric(2:4)), row.names = c(NA, -3L), class = c("tbl_df", 
"tbl", "data.frame")))
        expect_identical(tidy(nlist(x = 1, y = 1:2)), structure(list(term = structure(c("x", "y[1]", "y[2]"), class = c("term", 
"character")), value1 = c(1, 1, 2)), row.names = c(NA, -3L), class = c("tbl_df", 
"tbl", "data.frame")))
})

test_that("tidy.nlists", {
  expect_identical(tidy(nlists()), structure(list(term = structure(character(0), class = c("term", 
"character"))), row.names = integer(0), class = c("tbl_df", "tbl", 
"data.frame")))
  expect_identical(tidy(nlists(nlist())), structure(list(term = structure(character(0), class = c("term", 
"character"))), row.names = integer(0), class = c("tbl_df", "tbl", 
"data.frame")))
  expect_identical(tidy(nlists(nlist(x = 2))), structure(list(term = structure("x", class = c("term", "character"
)), value1 = 2), row.names = c(NA, -1L), class = c("tbl_df", 
"tbl", "data.frame")))
    expect_identical(tidy(nlists(nlist(x = 2:4))), structure(list(term = structure(c("x[1]", "x[2]", "x[3]"), class = c("term", 
"character")), value1 = as.numeric(2:4)), row.names = c(NA, -3L), class = c("tbl_df", 
"tbl", "data.frame")))
        expect_identical(tidy(nlists(nlist(x = 1, y = 1:2))), structure(list(term = structure(c("x", "y[1]", "y[2]"), class = c("term", 
"character")), value1 = c(1, 1, 2)), row.names = c(NA, -3L), class = c("tbl_df", 
"tbl", "data.frame")))
    expect_identical(tidy(nlists(nlist(x = 1, y = 1:2), nlist(x = 1, y = 3:4))), structure(list(term = structure(c("x", "y[1]", "y[2]"), class = c("term", 
"character")), value1 = c(1, 1, 2), value2 = c(1, 3, 4)), row.names = c(NA, 
-3L), class = c("tbl_df", "tbl", "data.frame")))
})
