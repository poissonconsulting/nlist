test_that("tidy.nlists", {
  expect_identical(tidy(nlists()), structure(list(term = structure(character(0), class = c("term", 
"character")), estimate = numeric(0), sd = numeric(0), zscore = numeric(0), 
    lower = numeric(0), upper = numeric(0), svalue = numeric(0)), row.names = integer(0), class = c("tbl_df", 
"tbl", "data.frame")))
  expect_identical(tidy(nlists(nlist())), structure(list(term = structure(character(0), class = c("term", 
"character")), estimate = numeric(0), sd = numeric(0), zscore = numeric(0), 
    lower = numeric(0), upper = numeric(0), svalue = numeric(0)), row.names = integer(0), class = c("tbl_df", 
"tbl", "data.frame")))
  expect_identical(tidy(nlists(nlist(x = 2))), structure(list(term = structure("x", class = c("term", "character"
)), estimate = 2, sd = NA_real_, zscore = NA_real_, lower = 2, 
    upper = 2, svalue = 1), row.names = c(NA, -1L), class = c("tbl_df", 
"tbl", "data.frame")))
    expect_identical(tidy(nlists(nlist(x = 2:4))), structure(list(term = structure(c("x[1]", "x[2]", "x[3]"), class = c("term", 
"character")), estimate = c(2, 3, 4), sd = c(NA_real_, NA_real_, 
NA_real_), zscore = c(NA_real_, NA_real_, NA_real_), lower = c(2, 
3, 4), upper = c(2, 3, 4), svalue = c(1, 1, 1)), row.names = c(NA, 
-3L), class = c("tbl_df", "tbl", "data.frame")))
        expect_identical(tidy(nlists(nlist(y = 1, s = 1:2))), structure(list(term = structure(c("y", "s[1]", "s[2]"), class = c("term", 
"character")), estimate = c(1, 1, 2), sd = c(NA_real_, NA_real_, 
NA_real_), zscore = c(NA_real_, NA_real_, NA_real_), lower = c(1, 
1, 2), upper = c(1, 1, 2), svalue = c(1, 1, 1)), row.names = c(NA, 
-3L), class = c("tbl_df", "tbl", "data.frame")))
    expect_equal(tidy(nlists(nlist(x = 1, y = 1:2), nlist(x = 1, y = 3:4))), structure(list(term = structure(c("x", "y[1]", "y[2]"), class = c("term", 
"character")), estimate = c(1, 2, 3), sd = c(0, 1.4142135623731, 
1.4142135623731), zscore = c(Inf, 1.41421356237309, 2.12132034355964
), lower = c(1, 1.05, 2.05), upper = c(1, 2.95, 3.95), svalue = c(1.58496250072116, 
1.58496250072116, 1.58496250072116)), row.names = c(NA, -3L), class = c("tbl_df", 
"tbl", "data.frame")))
})
