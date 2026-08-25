test_that("as_mcmc.mcmc.list", {
  expect_identical(
    as_mcmc(as_mcmc_list(nlists(nlist(x = 2), nlist(x = 3)))),
    as_mcmc(nlists(nlist(x = 2), nlist(x = 3)))
  )
})

test_that("as_mcmc.nlist", {
  expect_identical(
    as_mcmc(nlist()),
    structure(numeric(0), mcpar = c(1, 0, 1), class = "mcmc")
  )
  expect_identical(
    as_mcmc(nlist(x = 1)),
    structure(
      1,
      dim = c(1L, 1L),
      dimnames = list(NULL, "x"),
      mcpar = c(
        1,
        1,
        1
      ),
      class = "mcmc"
    )
  )
  expect_identical(
    as_mcmc(nlist(x = matrix(1:6, 2))),
    structure(
      1:6,
      dim = c(1L, 6L),
      dimnames = list(
        NULL,
        c(
          "x[1,1]",
          "x[2,1]",
          "x[1,2]",
          "x[2,2]",
          "x[1,3]",
          "x[2,3]"
        )
      ),
      mcpar = c(
        1,
        1,
        1
      ),
      class = "mcmc"
    )
  )
  expect_identical(
    as_mcmc(nlist(x = 1:2, y = 3)),
    structure(
      c(1, 2, 3),
      dim = c(1L, 3L),
      dimnames = list(
        NULL,
        c("x[1]", "x[2]", "y")
      ),
      mcpar = c(1, 1, 1),
      class = "mcmc"
    )
  )
  expect_identical(
    as_mcmc(nlist(x = NA_real_, y = 1)),
    structure(
      c(NA, 1),
      dim = 1:2,
      dimnames = list(
        NULL,
        c(
          "x",
          "y"
        )
      ),
      mcpar = c(1, 1, 1),
      class = "mcmc"
    )
  )

  expect_identical(
    as_mcmc(nlist::nlist(x = 1, y = matrix(1:4, 2))),
    structure(
      c(1, 1, 2, 3, 4),
      dim = c(1L, 5L),
      dimnames = list(
        NULL,
        c("x", "y[1,1]", "y[2,1]", "y[1,2]", "y[2,2]")
      ),
      mcpar = c(
        1,
        1,
        1
      ),
      class = "mcmc"
    )
  )
})

test_that("as_mcmc.nlists", {
  expect_identical(
    as_mcmc(nlists()),
    structure(numeric(0), mcpar = c(1, 0, 1), class = "mcmc")
  )
  expect_identical(
    as_mcmc(nlists(nlist())),
    structure(
      numeric(0),
      dim = 1:0,
      dimnames = list(NULL, NULL),
      mcpar = c(
        1,
        1,
        1
      ),
      class = "mcmc"
    )
  )
  expect_identical(
    as_mcmc(nlists(nlist(), nlist())),
    structure(
      numeric(0),
      dim = c(2L, 0L),
      dimnames = list(
        NULL,
        NULL
      ),
      mcpar = c(1, 2, 1),
      class = "mcmc"
    )
  )

  expect_identical(
    as_mcmc(nlists(nlist(x = 1))),
    structure(
      1,
      dim = c(1L, 1L),
      dimnames = list(NULL, "x"),
      mcpar = c(
        1,
        1,
        1
      ),
      class = "mcmc"
    )
  )
  expect_identical(
    as_mcmc(nlists(nlist(x = 1), nlist(x = 3))),
    structure(
      c(1, 3),
      dim = 2:1,
      dimnames = list(NULL, "x"),
      mcpar = c(
        1,
        2,
        1
      ),
      class = "mcmc"
    )
  )
  expect_identical(
    as_mcmc(nlists(nlist(x = matrix(1:6, 2)))),
    structure(
      1:6,
      dim = c(1L, 6L),
      dimnames = list(
        NULL,
        c(
          "x[1,1]",
          "x[2,1]",
          "x[1,2]",
          "x[2,2]",
          "x[1,3]",
          "x[2,3]"
        )
      ),
      mcpar = c(
        1,
        1,
        1
      ),
      class = "mcmc"
    )
  )

  expect_identical(
    as_mcmc(nlists(
      nlist(x = matrix(1:6, 2)),
      nlist(x = matrix(3:8, 2))
    )),
    structure(
      c(1L, 3L, 2L, 4L, 3L, 5L, 4L, 6L, 5L, 7L, 6L, 8L),
      dim = c(
        2L,
        6L
      ),
      dimnames = list(
        NULL,
        c(
          "x[1,1]",
          "x[2,1]",
          "x[1,2]",
          "x[2,2]",
          "x[1,3]",
          "x[2,3]"
        )
      ),
      mcpar = c(1, 2, 1),
      class = "mcmc"
    )
  )
})

test_that("as.mcmc.nlist", {
  expect_identical(
    as.mcmc(nlist()),
    structure(numeric(0), mcpar = c(1, 0, 1), class = "mcmc")
  )
  expect_identical(
    as.mcmc(nlist(x = 1)),
    structure(
      1,
      dim = c(1L, 1L),
      dimnames = list(NULL, "x"),
      mcpar = c(
        1,
        1,
        1
      ),
      class = "mcmc"
    )
  )
  expect_identical(
    as.mcmc(nlist(x = matrix(1:6, 2))),
    structure(
      1:6,
      dim = c(1L, 6L),
      dimnames = list(
        NULL,
        c(
          "x[1,1]",
          "x[2,1]",
          "x[1,2]",
          "x[2,2]",
          "x[1,3]",
          "x[2,3]"
        )
      ),
      mcpar = c(
        1,
        1,
        1
      ),
      class = "mcmc"
    )
  )
  expect_identical(
    as.mcmc(nlist(x = 1:2, y = 3)),
    structure(
      c(1, 2, 3),
      dim = c(1L, 3L),
      dimnames = list(
        NULL,
        c("x[1]", "x[2]", "y")
      ),
      mcpar = c(1, 1, 1),
      class = "mcmc"
    )
  )
  expect_identical(
    as.mcmc(nlist(x = NA_real_, y = 1)),
    structure(
      c(NA, 1),
      dim = 1:2,
      dimnames = list(
        NULL,
        c(
          "x",
          "y"
        )
      ),
      mcpar = c(1, 1, 1),
      class = "mcmc"
    )
  )

  expect_identical(
    as.mcmc(nlist::nlist(x = 1, y = matrix(1:4, 2))),
    structure(
      c(1, 1, 2, 3, 4),
      dim = c(1L, 5L),
      dimnames = list(
        NULL,
        c("x", "y[1,1]", "y[2,1]", "y[1,2]", "y[2,2]")
      ),
      mcpar = c(
        1,
        1,
        1
      ),
      class = "mcmc"
    )
  )
})

test_that("as.mcmc.nlists", {
  expect_identical(
    as.mcmc(nlists()),
    structure(numeric(0), mcpar = c(1, 0, 1), class = "mcmc")
  )
  expect_identical(
    as.mcmc(nlists(nlist())),
    structure(
      numeric(0),
      dim = 1:0,
      dimnames = list(NULL, NULL),
      mcpar = c(
        1,
        1,
        1
      ),
      class = "mcmc"
    )
  )
  expect_identical(
    as.mcmc(nlists(nlist(), nlist())),
    structure(
      numeric(0),
      dim = c(2L, 0L),
      dimnames = list(
        NULL,
        NULL
      ),
      mcpar = c(1, 2, 1),
      class = "mcmc"
    )
  )

  expect_identical(
    as.mcmc(nlists(nlist(x = 1))),
    structure(
      1,
      dim = c(1L, 1L),
      dimnames = list(NULL, "x"),
      mcpar = c(
        1,
        1,
        1
      ),
      class = "mcmc"
    )
  )
  expect_identical(
    as.mcmc(nlists(nlist(x = 1), nlist(x = 3))),
    structure(
      c(1, 3),
      dim = 2:1,
      dimnames = list(NULL, "x"),
      mcpar = c(
        1,
        2,
        1
      ),
      class = "mcmc"
    )
  )
  expect_identical(
    as.mcmc(nlists(nlist(x = matrix(1:6, 2)))),
    structure(
      1:6,
      dim = c(1L, 6L),
      dimnames = list(
        NULL,
        c(
          "x[1,1]",
          "x[2,1]",
          "x[1,2]",
          "x[2,2]",
          "x[1,3]",
          "x[2,3]"
        )
      ),
      mcpar = c(
        1,
        1,
        1
      ),
      class = "mcmc"
    )
  )

  expect_identical(
    as.mcmc(nlists(
      nlist(x = matrix(1:6, 2)),
      nlist(x = matrix(3:8, 2))
    )),
    structure(
      c(1L, 3L, 2L, 4L, 3L, 5L, 4L, 6L, 5L, 7L, 6L, 8L),
      dim = c(
        2L,
        6L
      ),
      dimnames = list(
        NULL,
        c(
          "x[1,1]",
          "x[2,1]",
          "x[1,2]",
          "x[2,2]",
          "x[1,3]",
          "x[2,3]"
        )
      ),
      mcpar = c(1, 2, 1),
      class = "mcmc"
    )
  )
})
