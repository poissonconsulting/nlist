# Changelog

## nlist 0.4.0.9003

- Same as previous version.

## nlist 0.4.0.9002

- Same as previous version.

## nlist 0.4.0.9001

- Add fledge-bump workflow
- Add fledge-tag-on-merge workflow

## nlist 0.4.0.9000

- Switching to development version.

## nlist 0.4.0

CRAN release: 2025-05-11

- Exported
  [`coda::as.mcmc.list`](https://rdrr.io/pkg/coda/man/mcmc.list.html).
- Added mcmcr as suggested dependency to removal speed bottleneck in
  [`as_nlists.mcmc()`](https://poissonconsulting.github.io/nlist/dev/reference/as_nlists.md)
  ([\#31](https://github.com/poissonconsulting/nlist/issues/31),
  [\#44](https://github.com/poissonconsulting/nlist/issues/44)).
- No longer deprecate `as.mcmc` and `as.mcmc.list`
  ([\#43](https://github.com/poissonconsulting/nlist/issues/43)).
- Warn-deprecated all soft-deprecated functions.

## nlist 0.3.3

CRAN release: 2021-09-02

- Speed up
  [`bind_iterations.mcmc.list()`](https://poissonconsulting.github.io/nlist/dev/reference/bind_iterations.mcmc.list.md)
  by replacing
  [`chk::chkor()`](https://poissonconsulting.github.io/chk/reference/chkor.html)
  with custom test and message.
- Fix
  [`pars.mcmc.list()`](https://poissonconsulting.github.io/nlist/dev/reference/pars.mcmc.list.md)
  so that no longer gives deprecation warning for `terms = FALSE`
  argument if not provided by user.
- Switch to testthat edition 3.

## nlist 0.3.2

CRAN release: 2021-08-05

- Fixed
  [`complete_terms.mcmc()`](https://poissonconsulting.github.io/nlist/dev/reference/complete_terms.mcmc.md)
  so now returns warning when `silent = FALSE` and invalid or
  inconsistent terms are dropped.

## nlist 0.3.1

CRAN release: 2021-02-06

- Added
  [`as_nlists.mcmc.list()`](https://poissonconsulting.github.io/nlist/dev/reference/as_nlists.md).
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
[`as_mcmc_list()`](https://poissonconsulting.github.io/nlist/dev/reference/as_mcmc_list.md). -
[`as.mcmc()`](https://rdrr.io/pkg/coda/man/mcmc.html) for
[`as_mcmc()`](https://poissonconsulting.github.io/nlist/dev/reference/as_mcmc.md).

## nlist 0.2.0

CRAN release: 2020-06-25

### Breaking changes

- Set Depends to R \>= 3.4
- Replaced `pars_scalar()` and `npars_scalar()` with
  `pars(scalar = TRUE)` and `npars(scalar = TRUE)`.

Soft deprecated

- `pars(terms =)` for `pars_terms(as_term())`.
- [`is.natomic()`](https://poissonconsulting.github.io/nlist/dev/reference/deprecated.md)
  for
  [`is_numeric()`](https://poissonconsulting.github.io/nlist/dev/reference/is_numeric.md).
- [`is.nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/deprecated.md)
  and
  [`is.nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/deprecated.md)
  for
  [`is_nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/is_numeric.md)
  and
  [`is_nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/is_numeric.md).
- [`as.nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/as_nlist.md)
  and
  [`as.nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/as_nlist.md)
  for
  [`as_nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/as_nlist.md)
  and
  [`as.nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/as_nlist.md).
- [`as.term()`](https://poissonconsulting.github.io/term/reference/as_term.html)
  for
  [`as_term()`](https://poissonconsulting.github.io/term/reference/as_term.html).

### Features

Added

- [`thin.default()`](https://poissonconsulting.github.io/nlist/dev/reference/thin.default.md)
  to thin objects.
- [`unlist_nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/unlist_nlist.md)
  (also
  [`unlist.nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/unlist.nlist.md))
  and
  [`relist_nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/relist_nlist.md)
  to flatten and pop `nlist` objects.
- `as_data_term()` and `as_data_term()` for `nlist` and `nlists`
  objects.
- [`fill_all()`](https://poissonconsulting.github.io/extras/reference/fill_all.html)
  and
  [`fill_na()`](https://poissonconsulting.github.io/extras/reference/fill_na.html)
  for `nlist` and `nlists` objects.
- [`set_pars()`](https://poissonconsulting.github.io/universals/reference/set_pars.html)
  for `nlist` and `nlists` objects.
- [`tidy.nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/tidy.nlists.md)
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
  [`unlist_nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/unlist_nlist.md)
  (also
  [`unlist.nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/unlist.nlist.md))
  and
  [`relist_nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/relist_nlist.md)
  to flatten and pop nlist objects.

## nlist 0.0.1

- Initial release.
