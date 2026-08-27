# Number of Terms

Gets the number of terms of an MCMC object.

## Usage

``` r
# S3 method for class 'nlists'
nchains(x, ...)
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
nchains(nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7))))
#> [1] 1
nchains(split_chains(nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7)))))
#> [1] 2
```
