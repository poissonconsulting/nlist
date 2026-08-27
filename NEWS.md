<!-- NEWS.md is maintained by https://cynkra.github.io/fledge, do not edit -->

# nlist 0.5.0

## Breaking changes

- `tidy()` now defaults to `simplify = TRUE` for the `nlists`, `mcmc` and `mcmc.list` methods (#61).

- Functions and arguments that were previously warn-deprecated are now defunct and error (#56):

  - `is.natomic()`, `is.nlist()` and `is.nlists()`, replaced by `is_numeric()`, `is_nlist()` and `is_nlists()`.
  - `as.nlist()` and `as.nlists()`, replaced by `as_nlist()` and `as_nlists()`.
  - `aggregate.nlist()` and `aggregate.nlists()`, replaced by `estimates.nlist()` and `estimates.nlists()`.
  - The `terms` argument of `pars()`, replaced by `terms::pars_terms(as_term(x))`.
  - The `iterations` and `parameters` arguments of `subset()`, replaced by `iters` and `pars`.

## New features

- `tidy()` gains a `directional_information` argument specifying whether the `svalue` column is calculated with `extras::directional_information()` instead of `extras::svalue()` (#51).
- The default value of `directional_information` is currently `FALSE` but will change to `TRUE` in a future release; leaving it unset is soft-deprecated.

## Bug fixes

- `subset.nlists()` now range-checks the `iters` argument (#55).

## Documentation

- Documented the `sort()` methods and added missing examples for the `mcmc` and `mcmc.list` methods (#60).
- Added return values to the documentation for the `as_term()` methods.

## Minor improvements

- `extras` (>= 0.10.0) is now required.
- Replaced the deprecated `structure()` special names `.Names`, `.Dim` and `.Dimnames` with `names`, `dim` and `dimnames`, which R-devel now notes.


# nlist 0.4.0

- Exported `coda::as.mcmc.list`.
- Added mcmcr as suggested dependency to removal speed bottleneck in `as_nlists.mcmc()` (#31, #44).
- No longer deprecate `as.mcmc` and `as.mcmc.list` (#43).
- Warn-deprecated all soft-deprecated functions.

# nlist 0.3.3

- Speed up `bind_iterations.mcmc.list()` by replacing `chk::chkor()` with custom test and message.
- Fix `pars.mcmc.list()` so that no longer gives deprecation warning for `terms = FALSE` argument if not provided by user.
- Switch to testthat edition 3.

# nlist 0.3.2

- Fixed `complete_terms.mcmc()` so now returns warning when `silent = FALSE` and invalid or inconsistent terms are dropped.

# nlist 0.3.1

- Added `as_nlists.mcmc.list()`.
- Added `simplify = FALSE` argument to `tidy()` and soft deprecated for `simplify = TRUE` so that replace `sd`, `zscore` and `pvalue` columns with `svalue`.

# nlist 0.3.0

Added 
  - `collapse_chains()` for mcmc and mcmc.list objects.
  - `pars<-`
Soft deprecated
  - `as.mcmc.list()` for `as_mcmc_list()`.
  - `as.mcmc()` for `as_mcmc()`.

# nlist 0.2.0

## Breaking changes

- Set Depends to R >= 3.4
- Replaced `pars_scalar()` and `npars_scalar()` with `pars(scalar = TRUE)` and `npars(scalar = TRUE)`.

Soft deprecated 

  - `pars(terms =)` for `pars_terms(as_term())`.
  - `is.natomic()` for `is_numeric()`.
  - `is.nlist()` and `is.nlists()` for `is_nlist()` and `is_nlists()`.
  - `as.nlist()` and `as.nlists()` for `as_nlist()` and `as.nlists()`.
  - `as.term()` for `as_term()`.

## Features

Added 

  - `thin.default()` to thin objects.
  - `unlist_nlist()` (also `unlist.nlist()`) and `relist_nlist()` to flatten and pop `nlist` objects.
  - `as_data_term()` and `as_data_term()` for `nlist` and `nlists` objects.
  - `fill_all()` and `fill_na()` for `nlist` and `nlists` objects.
  - `set_pars()` for `nlist` and `nlists` objects.
  - `tidy.nlists()` for `nlists` objects.

# nlist 0.1.1

- Fix tests ready for term 0.2.0.

# nlist 0.1.0

- Added `fill_na()` for natomic, nlist and nlists objects.
- Added `as.nlist.numeric()` to convert flattened nlist objects back into original objects.
- Added `unlist_nlist()` (also `unlist.nlist()`) and `relist_nlist()` to flatten and pop nlist objects.

# nlist 0.0.1

- Initial release.
