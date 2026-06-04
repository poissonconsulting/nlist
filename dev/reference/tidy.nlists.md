# Turn an object into a tidy tibble

Turn an object into a tidy tibble

## Usage

``` r
# S3 method for class 'nlists'
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

- [`tidy.mcmc`](https://poissonconsulting.github.io/nlist/dev/reference/tidy.mcmc.md):
  `mcmc`

- `tidy.nlists`: `nlists`

## Examples

``` r
tidy(nlists(
  nlist(x = 1, y = 4:6),
  nlist(x = 3, y = 7:9)
), simplify = TRUE)
#> # A tibble: 4 × 5
#>   term   estimate lower upper svalue
#>   <term>    <dbl> <dbl> <dbl>  <dbl>
#> 1 x           2    1.05  2.95   1.58
#> 2 y[1]        5.5  4.07  6.93   1.58
#> 3 y[2]        6.5  5.07  7.93   1.58
#> 4 y[3]        7.5  6.07  8.93   1.58
```
