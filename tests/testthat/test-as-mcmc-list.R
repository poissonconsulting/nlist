test_that("as_mcmc_list.nlist", {
  expect_identical(
    as_mcmc_list(nlist()),
    structure(list(structure(numeric(0), mcpar = c(1, 0, 1), class = "mcmc")), class = "mcmc.list")
  )
  expect_identical(
    as_mcmc_list(nlist(x = 1)),
    structure(list(structure(1, .Dim = c(1L, 1L), .Dimnames = list(
      NULL, "x"
    ), mcpar = c(1, 1, 1), class = "mcmc")), class = "mcmc.list")
  )
  expect_identical(
    as_mcmc_list(nlist(x = matrix(1:6, 2))),
    structure(list(structure(1:6, .Dim = c(1L, 6L), .Dimnames = list(
      NULL, c(
        "x[1,1]", "x[2,1]", "x[1,2]", "x[2,2]", "x[1,3]",
        "x[2,3]"
      )
    ), mcpar = c(1, 1, 1), class = "mcmc")), class = "mcmc.list")
  )
  expect_identical(
    as_mcmc_list(nlist(x = 1:2, y = 3)),
    structure(list(structure(c(1, 2, 3), .Dim = c(1L, 3L), .Dimnames = list(
      NULL, c("x[1]", "x[2]", "y")
    ), mcpar = c(1, 1, 1), class = "mcmc")), class = "mcmc.list")
  )
  expect_identical(
    as_mcmc_list(nlist(x = NA_real_, y = 1)),
    structure(list(structure(c(NA, 1), .Dim = 1:2, .Dimnames = list(
      NULL, c("x", "y")
    ), mcpar = c(1, 1, 1), class = "mcmc")), class = "mcmc.list")
  )

  expect_identical(
    as_mcmc_list(nlist::nlist(x = 1, y = matrix(1:4, 2))),
    structure(list(structure(c(1, 1, 2, 3, 4), .Dim = c(1L, 5L), .Dimnames = list(
      NULL, c("x", "y[1,1]", "y[2,1]", "y[1,2]", "y[2,2]")
    ), mcpar = c(
      1,
      1, 1
    ), class = "mcmc")), class = "mcmc.list")
  )
})

test_that("as_mcmc_list.nlists", {
  expect_identical(
    as_mcmc_list(nlists()),
    structure(list(structure(numeric(0), mcpar = c(1, 0, 1), class = "mcmc")), class = "mcmc.list")
  )
  expect_identical(
    as_mcmc_list(nlists(nlist())),
    structure(list(structure(numeric(0), .Dim = 1:0, .Dimnames = list(
      NULL, NULL
    ), mcpar = c(1, 1, 1), class = "mcmc")), class = "mcmc.list")
  )
  expect_identical(
    as_mcmc_list(nlists(nlist(), nlist())),
    structure(list(structure(numeric(0), .Dim = c(2L, 0L), .Dimnames = list(
      NULL, NULL
    ), mcpar = c(1, 2, 1), class = "mcmc")), class = "mcmc.list")
  )

  expect_identical(
    as_mcmc_list(nlists(nlist(x = 1))),
    structure(list(structure(1, .Dim = c(1L, 1L), .Dimnames = list(
      NULL, "x"
    ), mcpar = c(1, 1, 1), class = "mcmc")), class = "mcmc.list")
  )
  expect_identical(
    as_mcmc_list(nlists(nlist(x = 1), nlist(x = 3))),
    structure(list(structure(c(1, 3), .Dim = 2:1, .Dimnames = list(
      NULL, "x"
    ), mcpar = c(1, 2, 1), class = "mcmc")), class = "mcmc.list")
  )
  expect_identical(
    as_mcmc_list(nlists(nlist(x = matrix(1:6, 2)))),
    structure(list(structure(1:6, .Dim = c(1L, 6L), .Dimnames = list(
      NULL, c(
        "x[1,1]", "x[2,1]", "x[1,2]", "x[2,2]", "x[1,3]",
        "x[2,3]"
      )
    ), mcpar = c(1, 1, 1), class = "mcmc")), class = "mcmc.list")
  )

  expect_identical(
    as_mcmc_list(nlists(
      nlist(x = matrix(1:6, 2)),
      nlist(x = matrix(3:8, 2))
    )),
    structure(list(structure(c(
      1L, 3L, 2L, 4L, 3L, 5L, 4L, 6L, 5L,
      7L, 6L, 8L
    ), .Dim = c(2L, 6L), .Dimnames = list(NULL, c(
      "x[1,1]",
      "x[2,1]", "x[1,2]", "x[2,2]", "x[1,3]", "x[2,3]"
    )), mcpar = c(
      1,
      2, 1
    ), class = "mcmc")), class = "mcmc.list")
  )

  nlists <- nlists(nlist(x = matrix(1:6, 2)), nlist(x = matrix(3:8, 2)))
  attr(nlists, "nchains") <- 2L
  expect_identical(
    as_mcmc_list(nlists),
    structure(list(`1` = structure(1:6, .Dim = c(1L, 6L), .Dimnames = list(
      NULL, c(
        "x[1,1]", "x[2,1]", "x[1,2]", "x[2,2]", "x[1,3]",
        "x[2,3]"
      )
    ), mcpar = c(1, 1, 1), class = "mcmc"), `2` = structure(3:8, .Dim = c(
      1L,
      6L
    ), .Dimnames = list(NULL, c(
      "x[1,1]", "x[2,1]", "x[1,2]", "x[2,2]",
      "x[1,3]", "x[2,3]"
    )), mcpar = c(1, 1, 1), class = "mcmc")), class = "mcmc.list")
  )
})

test_that("as.mcmc.list.nlist", {
  lifecycle::expect_deprecated(as.mcmc.list(nlist()))
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  expect_identical(
    coda::as.mcmc.list(nlist()),
    structure(list(structure(numeric(0), mcpar = c(1, 0, 1), class = "mcmc")), class = "mcmc.list")
  )
  expect_identical(
    coda::as.mcmc.list(nlist(x = 1)),
    structure(list(structure(1, .Dim = c(1L, 1L), .Dimnames = list(
      NULL, "x"
    ), mcpar = c(1, 1, 1), class = "mcmc")), class = "mcmc.list")
  )
  expect_identical(
    coda::as.mcmc.list(nlist(x = matrix(1:6, 2))),
    structure(list(structure(1:6, .Dim = c(1L, 6L), .Dimnames = list(
      NULL, c(
        "x[1,1]", "x[2,1]", "x[1,2]", "x[2,2]", "x[1,3]",
        "x[2,3]"
      )
    ), mcpar = c(1, 1, 1), class = "mcmc")), class = "mcmc.list")
  )
  expect_identical(
    coda::as.mcmc.list(nlist(x = 1:2, y = 3)),
    structure(list(structure(c(1, 2, 3), .Dim = c(1L, 3L), .Dimnames = list(
      NULL, c("x[1]", "x[2]", "y")
    ), mcpar = c(1, 1, 1), class = "mcmc")), class = "mcmc.list")
  )
  expect_identical(
    coda::as.mcmc.list(nlist(x = NA_real_, y = 1)),
    structure(list(structure(c(NA, 1), .Dim = 1:2, .Dimnames = list(
      NULL, c("x", "y")
    ), mcpar = c(1, 1, 1), class = "mcmc")), class = "mcmc.list")
  )
  
  expect_identical(
    coda::as.mcmc.list(nlist::nlist(x = 1, y = matrix(1:4, 2))),
    structure(list(structure(c(1, 1, 2, 3, 4), .Dim = c(1L, 5L), .Dimnames = list(
      NULL, c("x", "y[1,1]", "y[2,1]", "y[1,2]", "y[2,2]")
    ), mcpar = c(
      1,
      1, 1
    ), class = "mcmc")), class = "mcmc.list")
  )
})

test_that("as.mcmc.list.nlists", {
  lifecycle::expect_deprecated(as.mcmc.list(nlists()))
  rlang::scoped_options(lifecycle_verbosity = "quiet")
  expect_identical(
    coda::as.mcmc.list(nlists()),
    structure(list(structure(numeric(0), mcpar = c(1, 0, 1), class = "mcmc")), class = "mcmc.list")
  )
  expect_identical(
    coda::as.mcmc.list(nlists(nlist())),
    structure(list(structure(numeric(0), .Dim = 1:0, .Dimnames = list(
      NULL, NULL
    ), mcpar = c(1, 1, 1), class = "mcmc")), class = "mcmc.list")
  )
  expect_identical(
    coda::as.mcmc.list(nlists(nlist(), nlist())),
    structure(list(structure(numeric(0), .Dim = c(2L, 0L), .Dimnames = list(
      NULL, NULL
    ), mcpar = c(1, 2, 1), class = "mcmc")), class = "mcmc.list")
  )
  
  expect_identical(
    coda::as.mcmc.list(nlists(nlist(x = 1))),
    structure(list(structure(1, .Dim = c(1L, 1L), .Dimnames = list(
      NULL, "x"
    ), mcpar = c(1, 1, 1), class = "mcmc")), class = "mcmc.list")
  )
  expect_identical(
    coda::as.mcmc.list(nlists(nlist(x = 1), nlist(x = 3))),
    structure(list(structure(c(1, 3), .Dim = 2:1, .Dimnames = list(
      NULL, "x"
    ), mcpar = c(1, 2, 1), class = "mcmc")), class = "mcmc.list")
  )
  expect_identical(
    coda::as.mcmc.list(nlists(nlist(x = matrix(1:6, 2)))),
    structure(list(structure(1:6, .Dim = c(1L, 6L), .Dimnames = list(
      NULL, c(
        "x[1,1]", "x[2,1]", "x[1,2]", "x[2,2]", "x[1,3]",
        "x[2,3]"
      )
    ), mcpar = c(1, 1, 1), class = "mcmc")), class = "mcmc.list")
  )
  
  expect_identical(
    coda::as.mcmc.list(nlists(
      nlist(x = matrix(1:6, 2)),
      nlist(x = matrix(3:8, 2))
    )),
    structure(list(structure(c(
      1L, 3L, 2L, 4L, 3L, 5L, 4L, 6L, 5L,
      7L, 6L, 8L
    ), .Dim = c(2L, 6L), .Dimnames = list(NULL, c(
      "x[1,1]",
      "x[2,1]", "x[1,2]", "x[2,2]", "x[1,3]", "x[2,3]"
    )), mcpar = c(
      1,
      2, 1
    ), class = "mcmc")), class = "mcmc.list")
  )
  
  nlists <- nlists(nlist(x = matrix(1:6, 2)), nlist(x = matrix(3:8, 2)))
  attr(nlists, "nchains") <- 2L
  expect_identical(
    coda::as.mcmc.list(nlists),
    structure(list(`1` = structure(1:6, .Dim = c(1L, 6L), .Dimnames = list(
      NULL, c(
        "x[1,1]", "x[2,1]", "x[1,2]", "x[2,2]", "x[1,3]",
        "x[2,3]"
      )
    ), mcpar = c(1, 1, 1), class = "mcmc"), `2` = structure(3:8, .Dim = c(
      1L,
      6L
    ), .Dimnames = list(NULL, c(
      "x[1,1]", "x[2,1]", "x[1,2]", "x[2,2]",
      "x[1,3]", "x[2,3]"
    )), mcpar = c(1, 1, 1), class = "mcmc")), class = "mcmc.list")
  )
})

