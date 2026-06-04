# Number of Terms

Gets the number of terms of an MCMC object.

## Usage

``` r
# S3 method for class 'nlist'
nterms(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Other arguments passed to methods.

## Value

A integer scalar of the number of terms.

## See also

Other MCMC dimensions:
[`nchains()`](https://poissonconsulting.github.io/universals/reference/nchains.html),
[`niters()`](https://poissonconsulting.github.io/universals/reference/niters.html),
[`npars()`](https://poissonconsulting.github.io/universals/reference/npars.html),
[`nsams()`](https://poissonconsulting.github.io/universals/reference/nsams.html),
[`nsims()`](https://poissonconsulting.github.io/universals/reference/nsims.html)

## Examples

``` r
nterms(nlist(x = 2))
#> [1] 1
nterms(nlist(x = NA_real_))
#> [1] 1
nterms(nlist(x = 3, zz = matrix(2:5, 2)))
#> [1] 5
```
