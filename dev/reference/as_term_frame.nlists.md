# Coerce nlists Object to Data Frame

Coerces an nlists object to a data.frame with a term, sample and value
column.

## Usage

``` r
# S3 method for class 'nlists'
as_term_frame(x, ...)
```

## Arguments

- x:

  An nlists object.

- ...:

  Unused.

## Value

A data.frame.

## See also

Other coerce term:
[`as_term.mcmc()`](https://poissonconsulting.github.io/nlist/dev/reference/as_term.mcmc.md),
[`as_term.nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/as_term.nlist.md),
[`as_term.nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/as_term.nlists.md),
[`as_term_frame()`](https://poissonconsulting.github.io/nlist/dev/reference/as_term_frame.md),
[`as_term_frame.nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/as_term_frame.nlist.md)

## Examples

``` r
as_term_frame(nlists(
  nlist(x = 1, y = 4:6),
  nlist(x = 3, y = 1:3)
))
#>   term sample value
#> 1    x      1     1
#> 2 y[1]      1     4
#> 3 y[2]      1     5
#> 4 y[3]      1     6
#> 5    x      2     3
#> 6 y[1]      2     1
#> 7 y[2]      2     2
#> 8 y[3]      2     3
```
