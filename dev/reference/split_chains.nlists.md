# Split Chains

Splits each of an MCMC object's chains in half to double the number of
chains and halve the number of iterations.

## Usage

``` r
# S3 method for class 'nlists'
split_chains(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Other arguments passed to methods.

## Value

The modified object.

## See also

Other MCMC manipulations:
[`bind_chains()`](https://poissonconsulting.github.io/universals/reference/bind_chains.html),
[`bind_iterations()`](https://poissonconsulting.github.io/universals/reference/bind_iterations.html),
[`collapse_chains()`](https://poissonconsulting.github.io/universals/reference/collapse_chains.html),
[`estimates()`](https://poissonconsulting.github.io/universals/reference/estimates.html)

## Examples

``` r
nlists <- nlists(nlist(x = c(2, 9)), nlist(x = c(1, 7)))
nchains(nlists)
#> [1] 1
nchains(split_chains(nlists))
#> [1] 2
```
