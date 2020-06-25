# nlist 0.1.0.9005

- Switch depends to R >= 3.3
- Replaced natomic with just numeric (as all numeric objects are atomic!)
- Replaced pars_scalar() and npars_scalar() with pars(scalar = TRUE) and npars(scalar = TRUE).

- Added `unlist_nlist()` (also `unlist.nlist()`) and `relist_nlist()` to flatten and pop nlist objects.
- Added `as_data_term.nlist()` and `as_data_term.nlists()`
- Added `fill_all()` and `fill_na()`.
- Added `tidy.nlists()`
- Added `set_pars()`.
- Added `thin()`.

- Soft deprecated `as.nlist()` and `as.nlists()` for `as_nlist()` and `as.nlists()`.
- Soft deprecated `is.natomic()` for `is_numeric()`.
- Soft deprecated `pars(terms =)` for `pars_terms(as_term())`.
- Soft deprecated `is.nlists()` for `is_nlists()`.
- Soft deprecated `is.nlist()` for `is_nlist()`.
- Soft deprecated `is.natomic()` for `is_natomic()`.

# nlist 0.1.0

- Added `fill_na()` for natomic, nlist and nlists objects.
- Added `as.nlist.numeric()` to convert flattened nlist objects back into original objects.
- Added `unlist_nlist()` (also `unlist.nlist()`) and `relist_nlist()` to flatten and pop nlist objects.

# nlist 0.0.1

- Initial release.
