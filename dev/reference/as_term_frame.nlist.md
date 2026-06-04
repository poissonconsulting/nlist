# Coerce nlist Object to Data Frame

Coerces an nlist object to a data.frame with an term column and a value
column.

## Usage

``` r
# S3 method for class 'nlist'
as_term_frame(x, ...)
```

## Arguments

- x:

  An nlist object.

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
[`as_term_frame.nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/as_term_frame.nlists.md)

## Examples

``` r
as_term_frame(nlist(x = 1, y = 4:6))
#>   term value
#> 1    x     1
#> 2 y[1]     4
#> 3 y[2]     5
#> 4 y[3]     6
```
