# Number of Iterations

Gets the number of iterations (in a chain) of an MCMC object.

## Usage

``` r
# S3 method for class 'nlists'
niters(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Other arguments passed to methods.

## Value

An integer scalar of the number of iterations.

## See also

Other MCMC dimensions:
[`nchains()`](https://poissonconsulting.github.io/universals/reference/nchains.html),
[`npars()`](https://poissonconsulting.github.io/universals/reference/npars.html),
[`nsams()`](https://poissonconsulting.github.io/universals/reference/nsams.html),
[`nsims()`](https://poissonconsulting.github.io/universals/reference/nsims.html),
[`nterms()`](https://poissonconsulting.github.io/universals/reference/nterms.html)

## Examples

``` r
niters(nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7))))
#> [1] 2
```
