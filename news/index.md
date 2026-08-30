# Changelog

## nlist 0.5.0

CRAN release: 2026-08-27

### Breaking changes

- [`tidy()`](https://generics.r-lib.org/reference/tidy.html) now
  defaults to `simplify = TRUE` for the `nlists`, `mcmc` and `mcmc.list`
  methods
  ([\#61](https://github.com/poissonconsulting/nlist/issues/61)).

- Functions and arguments that were previously warn-deprecated are now
  defunct and error
  ([\#56](https://github.com/poissonconsulting/nlist/issues/56)):

  - [`is.natomic()`](https://poissonconsulting.github.io/nlist/reference/deprecated.md),
    [`is.nlist()`](https://poissonconsulting.github.io/nlist/reference/deprecated.md)
    and
    [`is.nlists()`](https://poissonconsulting.github.io/nlist/reference/deprecated.md),
    replaced by
    [`is_numeric()`](https://poissonconsulting.github.io/nlist/reference/is_numeric.md),
    [`is_nlist()`](https://poissonconsulting.github.io/nlist/reference/is_numeric.md)
    and
    [`is_nlists()`](https://poissonconsulting.github.io/nlist/reference/is_numeric.md).
  - [`as.nlist()`](https://poissonconsulting.github.io/nlist/reference/as_nlist.md)
    and
    [`as.nlists()`](https://poissonconsulting.github.io/nlist/reference/as_nlist.md),
    replaced by
    [`as_nlist()`](https://poissonconsulting.github.io/nlist/reference/as_nlist.md)
    and
    [`as_nlists()`](https://poissonconsulting.github.io/nlist/reference/as_nlists.md).
  - [`aggregate.nlist()`](https://poissonconsulting.github.io/nlist/reference/aggregate.nlist.md)
    and
    [`aggregate.nlists()`](https://poissonconsulting.github.io/nlist/reference/aggregate.nlists.md),
    replaced by
    [`estimates.nlist()`](https://poissonconsulting.github.io/nlist/reference/estimates.nlist.md)
    and
    [`estimates.nlists()`](https://poissonconsulting.github.io/nlist/reference/estimates.nlists.md).
  - The `terms` argument of
    [`pars()`](https://poissonconsulting.github.io/universals/reference/pars.html),
    replaced by `terms::pars_terms(as_term(x))`.
  - The `iterations` and `parameters` arguments of
    [`subset()`](https://rdrr.io/r/base/subset.html), replaced by
    `iters` and `pars`.

### New features

- [`tidy()`](https://generics.r-lib.org/reference/tidy.html) gains a
  `directional_information` argument specifying whether the `svalue`
  column is calculated with
  [`extras::directional_information()`](https://poissonconsulting.github.io/extras/reference/directional-information.html)
  instead of
  [`extras::svalue()`](https://poissonconsulting.github.io/extras/reference/svalue.html)
  ([\#51](https://github.com/poissonconsulting/nlist/issues/51)).
- The default value of `directional_information` is currently `FALSE`
  but will change to `TRUE` in a future release; leaving it unset is
  soft-deprecated.

### Bug fixes

- [`subset.nlists()`](https://poissonconsulting.github.io/nlist/reference/subset.nlists.md)
  now range-checks the `iters` argument
  ([\#55](https://github.com/poissonconsulting/nlist/issues/55)).

### Documentation

- Documented the [`sort()`](https://rdrr.io/r/base/sort.html) methods
  and added missing examples for the `mcmc` and `mcmc.list` methods
  ([\#60](https://github.com/poissonconsulting/nlist/issues/60)).
- Added return values to the documentation for the
  [`as_term()`](https://poissonconsulting.github.io/term/reference/as_term.html)
  methods.

### Minor improvements

- `extras` (\>= 0.10.0) is now required.
- Replaced the deprecated
  [`structure()`](https://rdrr.io/r/base/structure.html) special names
  `.Names`, `.Dim` and `.Dimnames` with `names`, `dim` and `dimnames`,
  which R-devel now notes.

## nlist 0.4.0

CRAN release: 2025-05-11

- Exported
  [`coda::as.mcmc.list`](https://rdrr.io/pkg/coda/man/mcmc.list.html).
- Added mcmcr as suggested dependency to removal speed bottleneck in
  [`as_nlists.mcmc()`](https://poissonconsulting.github.io/nlist/reference/as_nlists.md)
  ([\#31](https://github.com/poissonconsulting/nlist/issues/31),
  [\#44](https://github.com/poissonconsulting/nlist/issues/44)).
- No longer deprecate `as.mcmc` and `as.mcmc.list`
  ([\#43](https://github.com/poissonconsulting/nlist/issues/43)).
- Warn-deprecated all soft-deprecated functions.

## nlist 0.3.3

CRAN release: 2021-09-02

- Speed up
  [`bind_iterations.mcmc.list()`](https://poissonconsulting.github.io/nlist/reference/bind_iterations.mcmc.list.md)
  by replacing
  [`chk::chkor()`](https://poissonconsulting.github.io/chk/reference/chkor.html)
  with custom test and message.
- Fix
  [`pars.mcmc.list()`](https://poissonconsulting.github.io/nlist/reference/pars.mcmc.list.md)
  so that no longer gives deprecation warning for `terms = FALSE`
  argument if not provided by user.
- Switch to testthat edition 3.

## nlist 0.3.2

CRAN release: 2021-08-05

- Fixed
  [`complete_terms.mcmc()`](https://poissonconsulting.github.io/nlist/reference/complete_terms.mcmc.md)
  so now returns warning when `silent = FALSE` and invalid or
  inconsistent terms are dropped.

## nlist 0.3.1

CRAN release: 2021-02-06

- Added
  [`as_nlists.mcmc.list()`](https://poissonconsulting.github.io/nlist/reference/as_nlists.md).
- Added `simplify = FALSE` argument to
  [`tidy()`](https://generics.r-lib.org/reference/tidy.html) and soft
  deprecated for `simplify = TRUE` so that replace `sd`, `zscore` and
  `pvalue` columns with `svalue`.

## nlist 0.3.0

CRAN release: 2020-09-25

Added -
[`collapse_chains()`](https://poissonconsulting.github.io/universals/reference/collapse_chains.html)
for mcmc and mcmc.list objects. - `pars<-` Soft deprecated -
[`as.mcmc.list()`](https://rdrr.io/pkg/coda/man/mcmc.list.html) for
[`as_mcmc_list()`](https://poissonconsulting.github.io/nlist/reference/as_mcmc_list.md). -
[`as.mcmc()`](https://rdrr.io/pkg/coda/man/mcmc.html) for
[`as_mcmc()`](https://poissonconsulting.github.io/nlist/reference/as_mcmc.md).

## nlist 0.2.0

CRAN release: 2020-06-25

### Breaking changes

- Set Depends to R \>= 3.4
- Replaced `pars_scalar()` and `npars_scalar()` with
  `pars(scalar = TRUE)` and `npars(scalar = TRUE)`.

Soft deprecated

- `pars(terms =)` for `pars_terms(as_term())`.
- [`is.natomic()`](https://poissonconsulting.github.io/nlist/reference/deprecated.md)
  for
  [`is_numeric()`](https://poissonconsulting.github.io/nlist/reference/is_numeric.md).
- [`is.nlist()`](https://poissonconsulting.github.io/nlist/reference/deprecated.md)
  and
  [`is.nlists()`](https://poissonconsulting.github.io/nlist/reference/deprecated.md)
  for
  [`is_nlist()`](https://poissonconsulting.github.io/nlist/reference/is_numeric.md)
  and
  [`is_nlists()`](https://poissonconsulting.github.io/nlist/reference/is_numeric.md).
- [`as.nlist()`](https://poissonconsulting.github.io/nlist/reference/as_nlist.md)
  and
  [`as.nlists()`](https://poissonconsulting.github.io/nlist/reference/as_nlist.md)
  for
  [`as_nlist()`](https://poissonconsulting.github.io/nlist/reference/as_nlist.md)
  and
  [`as.nlists()`](https://poissonconsulting.github.io/nlist/reference/as_nlist.md).
- [`as.term()`](https://poissonconsulting.github.io/term/reference/as_term.html)
  for
  [`as_term()`](https://poissonconsulting.github.io/term/reference/as_term.html).

### Features

Added

- [`thin.default()`](https://poissonconsulting.github.io/nlist/reference/thin.default.md)
  to thin objects.
- [`unlist_nlist()`](https://poissonconsulting.github.io/nlist/reference/unlist_nlist.md)
  (also
  [`unlist.nlist()`](https://poissonconsulting.github.io/nlist/reference/unlist.nlist.md))
  and
  [`relist_nlist()`](https://poissonconsulting.github.io/nlist/reference/relist_nlist.md)
  to flatten and pop `nlist` objects.
- `as_data_term()` and `as_data_term()` for `nlist` and `nlists`
  objects.
- [`fill_all()`](https://poissonconsulting.github.io/extras/reference/fill_all.html)
  and
  [`fill_na()`](https://poissonconsulting.github.io/extras/reference/fill_na.html)
  for `nlist` and `nlists` objects.
- [`set_pars()`](https://poissonconsulting.github.io/universals/reference/set_pars.html)
  for `nlist` and `nlists` objects.
- [`tidy.nlists()`](https://poissonconsulting.github.io/nlist/reference/tidy.nlists.md)
  for `nlists` objects.

## nlist 0.1.1

CRAN release: 2020-06-18

- Fix tests ready for term 0.2.0.

## nlist 0.1.0

CRAN release: 2020-01-24

- Added
  [`fill_na()`](https://poissonconsulting.github.io/extras/reference/fill_na.html)
  for natomic, nlist and nlists objects.
- Added `as.nlist.numeric()` to convert flattened nlist objects back
  into original objects.
- Added
  [`unlist_nlist()`](https://poissonconsulting.github.io/nlist/reference/unlist_nlist.md)
  (also
  [`unlist.nlist()`](https://poissonconsulting.github.io/nlist/reference/unlist.nlist.md))
  and
  [`relist_nlist()`](https://poissonconsulting.github.io/nlist/reference/relist_nlist.md)
  to flatten and pop nlist objects.

## nlist 0.0.1

- Initial release.
