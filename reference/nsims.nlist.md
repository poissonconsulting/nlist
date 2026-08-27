# Number of Simulations

Gets the number of simulations (iterations \* chains) of an MCMC object.

The default methods returns the product of
[`nchains()`](https://poissonconsulting.github.io/universals/reference/nchains.html)
and
[`niters()`](https://poissonconsulting.github.io/universals/reference/niters.html).

## Usage

``` r
# S3 method for class 'nlist'
nsims(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Other arguments passed to methods.

## Value

An integer scalar of the number of simulations.

## Details

Always 1L.

## See also

Other MCMC dimensions:
[`nchains()`](https://poissonconsulting.github.io/universals/reference/nchains.html),
[`niters()`](https://poissonconsulting.github.io/universals/reference/niters.html),
[`npars()`](https://poissonconsulting.github.io/universals/reference/npars.html),
[`nsams()`](https://poissonconsulting.github.io/universals/reference/nsams.html),
[`nterms()`](https://poissonconsulting.github.io/universals/reference/nterms.html)

## Examples

``` r
nsims(nlist(x = 1:2))
#> [1] 1
```
