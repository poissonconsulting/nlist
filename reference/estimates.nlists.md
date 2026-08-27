# Estimates

Calculates the estimates for an MCMC object.

## Usage

``` r
# S3 method for class 'nlists'
estimates(x, fun = median, ...)
```

## Arguments

- x:

  An object.

- fun:

  A function that given a numeric vector returns a numeric scalar.

- ...:

  Additional arguments passed to fun.

## Value

A list of uniquely named numeric objects.

## See also

Other MCMC manipulations:
[`bind_chains()`](https://poissonconsulting.github.io/universals/reference/bind_chains.html),
[`bind_iterations()`](https://poissonconsulting.github.io/universals/reference/bind_iterations.html),
[`collapse_chains()`](https://poissonconsulting.github.io/universals/reference/collapse_chains.html),
[`split_chains()`](https://poissonconsulting.github.io/universals/reference/split_chains.html)

## Examples

``` r
estimates(nlists(nlist(x = 1:3), nlist(x = 2:4)), fun = mean)
#> $x
#> [1] 1.5 2.5 3.5
#> 
#> an nlist object with 1 numeric element
```
