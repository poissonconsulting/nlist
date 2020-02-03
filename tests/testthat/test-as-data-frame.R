test_that("as.data.frame.nlist", {
  expect_identical(as.data.frame(nlist()), structure(list(term = structure(character(0), class = c("term", 
"character")), value = numeric(0)), row.names = integer(0), class = "data.frame"))
  expect_identical(as.data.frame(nlist(x = 2)), structure(list(term = structure("x", class = c("term", "character"
)), value = 2), row.names = c(NA, -1L), class = "data.frame"))
    expect_identical(as.data.frame(nlist(x = 2:4)), structure(list(term = structure(c("x[1]", "x[2]", "x[3]"), class = c("term", 
"character")), value = c(2, 3, 4)), row.names = c(NA, -3L), class = "data.frame"))
        expect_identical(as.data.frame(nlist(x = 1, y = 1:2)), structure(list(term = structure(c("x", "y[1]", "y[2]"), class = c("term", 
"character")), value = c(1, 1, 2)), row.names = c(NA, -3L), class = "data.frame"))
})

test_that("as.data.frame.nlists", {
  expect_identical(as.data.frame(nlists()), structure(list(term = structure(character(0), class = c("term", 
"character")), sample = integer(0), value = numeric(0)), row.names = integer(0), class = "data.frame"))
  expect_identical(as.data.frame(nlists(nlist())), structure(list(term = structure(character(0), class = c("term", 
"character")), sample = integer(0), value = numeric(0)), row.names = integer(0), class = "data.frame"))
  expect_identical(as.data.frame(nlists(nlist(x = 2))), structure(list(term = structure("x", class = c("term", "character"
)), sample = 1L, value = 2), row.names = c(NA, -1L), class = "data.frame"))
    expect_identical(as.data.frame(nlists(nlist(x = 2:4))), structure(list(term = structure(c("x[1]", "x[2]", "x[3]"), class = c("term", 
"character")), sample = c(1L, 1L, 1L), value = c(2, 3, 4)), row.names = c(NA, 
-3L), class = "data.frame"))
        expect_identical(as.data.frame(nlists(nlist(y = 1, s = 1:2))), structure(list(term = structure(c("y", "s[1]", "s[2]"), class = c("term", 
"character")), sample = c(1L, 1L, 1L), value = c(1, 1, 2)), row.names = c(NA, 
-3L), class = "data.frame"))
    expect_equal(as.data.frame(nlists(nlist(x = 1, y = 1:2), nlist(x = 1, y = 3:4))), structure(list(term = structure(c("x", "y[1]", "y[2]", "x", "y[1]", 
"y[2]"), class = c("term", "character")), sample = c(1L, 1L, 
1L, 2L, 2L, 2L), value = c(1, 1, 2, 1, 3, 4)), row.names = c(NA, 
-6L), class = "data.frame"))
})
