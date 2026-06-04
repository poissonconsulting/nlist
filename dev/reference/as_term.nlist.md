# Coerce to a Term Vector

Coerce to a Term Vector

## Usage

``` r
# S3 method for class 'nlist'
as_term(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Unused.

## See also

Other coerce term:
[`as_term.mcmc()`](https://poissonconsulting.github.io/nlist/dev/reference/as_term.mcmc.md),
[`as_term.nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/as_term.nlists.md),
[`as_term_frame()`](https://poissonconsulting.github.io/nlist/dev/reference/as_term_frame.md),
[`as_term_frame.nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/as_term_frame.nlist.md),
[`as_term_frame.nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/as_term_frame.nlists.md)

## Examples

``` r
as_term(nlist(x = matrix(1:4, ncol = 2)))
#> <term[4]>
#> [1] x[1,1] x[2,1] x[1,2] x[2,2]
```
