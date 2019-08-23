context("c")

test_that("c.nlist", {
  expect_identical(c(nlist()), nlist())
  expect_identical(c(nlist(x = 1)), nlist(x = 1))
  expect_error(c(nlist(x = 1), list(x = 1)), 
               "^All elements of ... must inherit from class 'nlist'[.]$")
  expect_identical(c(nlist(x = 1), nlist(y = 2)), nlist(x = 1, y = 2))
  expect_identical(c(nlist(), nlist()), nlist())
  expect_identical(c(nlist(), nlist(x = 1)), nlist(x = 1))
  expect_error(c(nlist(x = 1), nlist(x = 1)), 
               "^nlist objects must have distinctly named natomic elements in order to be concatenated[.]$")
})

test_that("c.nlists", {
  expect_identical(c(nlists()), nlists())
  expect_identical(c(nlists(nlist(x = 1))), nlists(nlist(x = 1)))
  expect_identical(c(nlists(nlist(x = 1)),
                     nlists(nlist(x = 1))), 
                   nlists(nlist(x = 1), nlist(x = 1)))
  expect_error(c(nlists(), list()), 
               "^All elements of ... must inherit from class 'nlists'[.]")
  expect_error(c(nlists(nlist(x = 1)),
                     nlists(nlist(y = 1))), 
               "^nlist elements of [.][.][.] must have matching names[.]$")
})
