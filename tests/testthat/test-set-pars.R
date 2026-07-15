test_that("nlist", {
  expect_identical(
    set_pars(nlist(x = 1), "y"),
    structure(list(y = 1), class = "nlist")
  )
  expect_identical(
    set_pars(nlist(x = 1, y = 2), c("z", "c1")),
    structure(list(z = 1, c1 = 2), class = "nlist")
  )

  x <- nlist()
  expect_identical(set_pars(x, character(0)), x)
  expect_error(
    set_pars(x, "a"),
    "^`value` must be length 0, not 1[.]$",
    class = "chk_error"
  )
  x <- nlist(x = 2)
  expect_error(
    set_pars(x, "."),
    "^`value` must match regular expression",
    class = "chk_error"
  )
})

test_that("mcmc", {
  mcmc <- as_mcmc(nlist(y = 1, a = 2:3))
  renamed <- set_pars(mcmc, c("b", "z"))
  expect_s3_class(renamed, "mcmc")
  expect_identical(colnames(renamed), c("b", "z[1]", "z[2]"))
  expect_identical(pars(renamed), c("b", "z"))
})

test_that("mcmc.list", {
  mcmc_list <- as_mcmc_list(nlist(y = 1, a = 2:3))
  renamed <- set_pars(mcmc_list, c("b", "z"))
  expect_s3_class(renamed, "mcmc.list")
  expect_identical(colnames(renamed[[1]]), c("b", "z[1]", "z[2]"))
  expect_identical(pars(renamed), c("b", "z"))
})

test_that("nlists", {
  x <- nlists()
  expect_identical(set_pars(x, character(0)), x)
  expect_error(
    set_pars(x, "a"),
    "^`value` must be length 0, not 1[.]$",
    class = "chk_error"
  )
  x <- nlists(nlist())
  expect_identical(set_pars(x, character(0)), x)

  x <- nlists(nlist(x = 2))
  expect_identical(
    set_pars(x, "y"),
    structure(list(structure(list(y = 2), class = "nlist")), class = "nlists")
  )
  x <- nlists(nlist(x = 2), nlist(x = 3))
  expect_identical(
    set_pars(x, "y"),
    structure(
      list(
        structure(list(y = 2), class = "nlist"),
        structure(
          list(
            y = 3
          ),
          class = "nlist"
        )
      ),
      class = "nlists"
    )
  )
  expect_error(
    set_pars(x, "."),
    "^`value` must match regular expression",
    class = "chk_error"
  )
})
