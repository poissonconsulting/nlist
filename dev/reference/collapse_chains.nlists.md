# Collapse Chains

Collapses an MCMC object's chains into a single chain.

## Usage

``` r
# S3 method for class 'nlists'
collapse_chains(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Other arguments passed to methods.

## Value

The modified object with one chain.

## See also

Other collapse:
[`collapse_chains.mcmc()`](https://poissonconsulting.github.io/nlist/dev/reference/collapse_chains.mcmc.md),
[`collapse_chains.nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/collapse_chains.nlist.md)

## Examples

``` r
collapse_chains(nlist(x = 2))
#> $x
#> [1] 2
#> 
#> an nlist object with 1 numeric element
```
