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
