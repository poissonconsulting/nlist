test_that("as_mcmc.mcmc.list", {
  expect_identical(as_mcmc(as_mcmc_list(nlists(nlist(x = 2), nlist(x = 3)))),
                   as_mcmc(nlists(nlist(x = 2), nlist(x = 3))))
})

test_that("as_mcmc.nlist", {
  expect_identical(
    as_mcmc(nlist()),
    structure(numeric(0), mcpar = c(1, 0, 1), class = "mcmc")
  )
  expect_identical(
    as_mcmc(nlist(x = 1)),
    structure(1, .Dim = c(1L, 1L), .Dimnames = list(NULL, "x"), mcpar = c(
      1,
      1, 1
    ), class = "mcmc")
  )
  expect_identical(
    as_mcmc(nlist(x = matrix(1:6, 2))),
    structure(1:6, .Dim = c(1L, 6L), .Dimnames = list(NULL, c(
      "x[1,1]",
      "x[2,1]", "x[1,2]", "x[2,2]", "x[1,3]", "x[2,3]"
    )), mcpar = c(
      1,
      1, 1
    ), class = "mcmc")
  )
  expect_identical(
    as_mcmc(nlist(x = 1:2, y = 3)),
    structure(c(1, 2, 3), .Dim = c(1L, 3L), .Dimnames = list(
      NULL,
      c("x[1]", "x[2]", "y")
    ), mcpar = c(1, 1, 1), class = "mcmc")
  )
  expect_identical(
    as_mcmc(nlist(x = NA_real_, y = 1)),
    structure(c(NA, 1), .Dim = 1:2, .Dimnames = list(NULL, c(
      "x",
      "y"
    )), mcpar = c(1, 1, 1), class = "mcmc")
  )

  expect_identical(
    as_mcmc(nlist::nlist(x = 1, y = matrix(1:4, 2))),
    structure(c(1, 1, 2, 3, 4), .Dim = c(1L, 5L), .Dimnames = list(
      NULL, c("x", "y[1,1]", "y[2,1]", "y[1,2]", "y[2,2]")
    ), mcpar = c(
      1,
      1, 1
    ), class = "mcmc")
  )
})

test_that("as_mcmc.nlists", {
  expect_identical(
    as_mcmc(nlists()),
    structure(numeric(0), mcpar = c(1, 0, 1), class = "mcmc")
  )
  expect_identical(
    as_mcmc(nlists(nlist())),
    structure(numeric(0), .Dim = 1:0, .Dimnames = list(NULL, NULL), mcpar = c(
      1,
      1, 1
    ), class = "mcmc")
  )
  expect_identical(
    as_mcmc(nlists(nlist(), nlist())),
    structure(numeric(0), .Dim = c(2L, 0L), .Dimnames = list(
      NULL,
      NULL
    ), mcpar = c(1, 2, 1), class = "mcmc")
  )

  expect_identical(
    as_mcmc(nlists(nlist(x = 1))),
    structure(1, .Dim = c(1L, 1L), .Dimnames = list(NULL, "x"), mcpar = c(
      1,
      1, 1
    ), class = "mcmc")
  )
  expect_identical(
    as_mcmc(nlists(nlist(x = 1), nlist(x = 3))),
    structure(c(1, 3), .Dim = 2:1, .Dimnames = list(NULL, "x"), mcpar = c(
      1,
      2, 1
    ), class = "mcmc")
  )
  expect_identical(
    as_mcmc(nlists(nlist(x = matrix(1:6, 2)))),
    structure(1:6, .Dim = c(1L, 6L), .Dimnames = list(NULL, c(
      "x[1,1]",
      "x[2,1]", "x[1,2]", "x[2,2]", "x[1,3]", "x[2,3]"
    )), mcpar = c(
      1,
      1, 1
    ), class = "mcmc")
  )

  expect_identical(
    as_mcmc(nlists(
      nlist(x = matrix(1:6, 2)),
      nlist(x = matrix(3:8, 2))
    )),
    structure(c(1L, 3L, 2L, 4L, 3L, 5L, 4L, 6L, 5L, 7L, 6L, 8L), .Dim = c(
      2L,
      6L
    ), .Dimnames = list(NULL, c(
      "x[1,1]", "x[2,1]", "x[1,2]", "x[2,2]",
      "x[1,3]", "x[2,3]"
    )), mcpar = c(1, 2, 1), class = "mcmc")
  )
})

test_that("as.mcmc.nlist", {
  lifecycle::expect_deprecated(as.mcmc(nlist()))
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  
  expect_identical(
    as.mcmc(nlist()),
    structure(numeric(0), mcpar = c(1, 0, 1), class = "mcmc")
  )
  expect_identical(
    as.mcmc(nlist(x = 1)),
    structure(1, .Dim = c(1L, 1L), .Dimnames = list(NULL, "x"), mcpar = c(
      1,
      1, 1
    ), class = "mcmc")
  )
  expect_identical(
    as.mcmc(nlist(x = matrix(1:6, 2))),
    structure(1:6, .Dim = c(1L, 6L), .Dimnames = list(NULL, c(
      "x[1,1]",
      "x[2,1]", "x[1,2]", "x[2,2]", "x[1,3]", "x[2,3]"
    )), mcpar = c(
      1,
      1, 1
    ), class = "mcmc")
  )
  expect_identical(
    as.mcmc(nlist(x = 1:2, y = 3)),
    structure(c(1, 2, 3), .Dim = c(1L, 3L), .Dimnames = list(
      NULL,
      c("x[1]", "x[2]", "y")
    ), mcpar = c(1, 1, 1), class = "mcmc")
  )
  expect_identical(
    as.mcmc(nlist(x = NA_real_, y = 1)),
    structure(c(NA, 1), .Dim = 1:2, .Dimnames = list(NULL, c(
      "x",
      "y"
    )), mcpar = c(1, 1, 1), class = "mcmc")
  )
  
  expect_identical(
    as.mcmc(nlist::nlist(x = 1, y = matrix(1:4, 2))),
    structure(c(1, 1, 2, 3, 4), .Dim = c(1L, 5L), .Dimnames = list(
      NULL, c("x", "y[1,1]", "y[2,1]", "y[1,2]", "y[2,2]")
    ), mcpar = c(
      1,
      1, 1
    ), class = "mcmc")
  )
})

test_that("as.mcmc.nlists", {
  lifecycle::expect_deprecated(as.mcmc(nlists()))
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  expect_identical(
    as.mcmc(nlists()),
    structure(numeric(0), mcpar = c(1, 0, 1), class = "mcmc")
  )
  expect_identical(
    as.mcmc(nlists(nlist())),
    structure(numeric(0), .Dim = 1:0, .Dimnames = list(NULL, NULL), mcpar = c(
      1,
      1, 1
    ), class = "mcmc")
  )
  expect_identical(
    as.mcmc(nlists(nlist(), nlist())),
    structure(numeric(0), .Dim = c(2L, 0L), .Dimnames = list(
      NULL,
      NULL
    ), mcpar = c(1, 2, 1), class = "mcmc")
  )
  
  expect_identical(
    as.mcmc(nlists(nlist(x = 1))),
    structure(1, .Dim = c(1L, 1L), .Dimnames = list(NULL, "x"), mcpar = c(
      1,
      1, 1
    ), class = "mcmc")
  )
  expect_identical(
    as.mcmc(nlists(nlist(x = 1), nlist(x = 3))),
    structure(c(1, 3), .Dim = 2:1, .Dimnames = list(NULL, "x"), mcpar = c(
      1,
      2, 1
    ), class = "mcmc")
  )
  expect_identical(
    as.mcmc(nlists(nlist(x = matrix(1:6, 2)))),
    structure(1:6, .Dim = c(1L, 6L), .Dimnames = list(NULL, c(
      "x[1,1]",
      "x[2,1]", "x[1,2]", "x[2,2]", "x[1,3]", "x[2,3]"
    )), mcpar = c(
      1,
      1, 1
    ), class = "mcmc")
  )
  
  expect_identical(
    as.mcmc(nlists(
      nlist(x = matrix(1:6, 2)),
      nlist(x = matrix(3:8, 2))
    )),
    structure(c(1L, 3L, 2L, 4L, 3L, 5L, 4L, 6L, 5L, 7L, 6L, 8L), .Dim = c(
      2L,
      6L
    ), .Dimnames = list(NULL, c(
      "x[1,1]", "x[2,1]", "x[1,2]", "x[2,2]",
      "x[1,3]", "x[2,3]"
    )), mcpar = c(1, 2, 1), class = "mcmc")
  )
})
