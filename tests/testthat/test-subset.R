context("subset")

test_that("subset.nlist",{
  expect_identical(subset(nlist()), nlist())
  expect_identical(subset(nlist(x = 1)), nlist(x = 1))
  expect_identical(subset(nlist(x = 1, y = 2), select ="x"), nlist(x = 1))
  expect_identical(subset(nlist(x = 1, y = 2), select ="y"), nlist(y = 2))
  expect_identical(subset(nlist(x = 1, y = 2), select =c("y", "x")), nlist(y = 2, x = 1))
  expect_identical(subset(nlist(x = 1, y = 2), select =c("x", "y")), nlist(x = 1, y = 2))
  expect_error(subset(nlist(x = 1, y = 2), select ="z"), 
               "^`select` must match 'x' or 'y', not 'z'[.]$")
})

test_that("subset.nlists",{
  expect_identical(subset(nlists()), nlists())
  expect_identical(subset(nlists(nlist())), nlists(nlist()))
  expect_identical(subset(nlists(nlist(x = 1))), nlists(nlist(x = 1)))
  expect_identical(subset(nlists(nlist(x = 1, y = 2)), select ="x"), nlists(nlist(x = 1)))
  expect_identical(subset(nlists(nlist(x = 1, y = 2)), select ="y"), nlists(nlist(y = 2)))
  expect_identical(subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), select ="x"), nlists(nlist(x = 1), nlist(x = 3)))
  expect_identical(subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), select = c("y", "x")), 
                   subset(nlists(nlist(y = 2, x = 1), nlist(y = 2, x = 3))))
  expect_identical(subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), 1L), 
                   subset(nlists(nlist(x = 1, y = 2))))
  expect_identical(subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), c(1L, 1L)), 
                   subset(nlists(nlist(x = 1, y = 2), nlist(x = 1, y = 2))))
  expect_identical(subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), c(2L, 1L)), 
                   subset(nlists(nlist(x = 3, y = 2), nlist(x = 1, y = 2))))
  expect_identical(subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), c(2L, 1L), "x"), 
                   subset(nlists(nlist(x = 3), nlist(x = 1))))
  expect_identical(subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), integer(0)), 
                   subset(nlists()))
  expect_identical(subset(nlists(nlist(x = 1, y = 2), nlist(x = 3, y = 2)), integer(0), "x"), 
                   subset(nlists()))
  expect_error(subset(nlist(x = 1, y = 2), select ="z"), 
               "`select` must match 'x' or 'y', not 'z'.")
})
