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
