# Turn an object into a tidy tibble

Turn an object into a tidy tibble

## Usage

``` r
# S3 method for class 'mcmc.list'
tidy(x, simplify = TRUE, directional_information = FALSE, ...)
```

## Arguments

- x:

  An object.

- simplify:

  A flag specifying whether to drop the sd and zscore columns.
  `simplify = FALSE` is deprecated.

- directional_information:

  A flag specifying whether the svalue column should be calculated using
  [`extras::directional_information()`](https://poissonconsulting.github.io/extras/reference/directional-information.html)
  instead of
  [`extras::svalue()`](https://poissonconsulting.github.io/extras/reference/svalue.html).
  The default value will change from `FALSE` to `TRUE` in a future
  release; set the argument explicitly to avoid the deprecation warning.

- ...:

  Unused.

## Value

A
[`tibble::tibble()`](https://tibble.tidyverse.org/reference/tibble.html)
with information about model components.

## Methods

See the following help topics for more details about individual
methods:`nlist`

- `tidy.mcmc.list`: `mcmc.list`

- [`tidy.mcmc`](https://poissonconsulting.github.io/nlist/dev/reference/tidy.mcmc.md):
  `mcmc`

- [`tidy.nlists`](https://poissonconsulting.github.io/nlist/dev/reference/tidy.nlists.md):
  `nlists`
