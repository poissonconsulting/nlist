# Turn an object into a tidy tibble

Turn an object into a tidy tibble

## Usage

``` r
# S3 method for class 'mcmc'
tidy(x, simplify = FALSE, ...)
```

## Arguments

- x:

  An object.

- simplify:

  A flag specifying whether to drop sd and zscore columns.

- ...:

  Unused.

## Value

A
[`tibble::tibble()`](https://tibble.tidyverse.org/reference/tibble.html)
with information about model components.

## Methods

See the following help topics for more details about individual
methods:`nlist`

- [`tidy.mcmc.list`](https://poissonconsulting.github.io/nlist/dev/reference/tidy.mcmc.list.md):
  `mcmc.list`

- `tidy.mcmc`: `mcmc`

- [`tidy.nlists`](https://poissonconsulting.github.io/nlist/dev/reference/tidy.nlists.md):
  `nlists`
