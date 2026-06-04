# Collapse Chains

Collapses an MCMC object's chains into a single chain.

## Usage

``` r
# S3 method for class 'nlist'
collapse_chains(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Other arguments passed to methods.

## Value

The modified object with one chain.

## Details

As nlist objects can only have 1 chain the object is unchanged.

## See also

Other collapse:
[`collapse_chains.mcmc()`](https://poissonconsulting.github.io/nlist/dev/reference/collapse_chains.mcmc.md),
[`collapse_chains.nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/collapse_chains.nlists.md)

## Examples

``` r
collapse_chains(nlist(x = 2))
#> $x
#> [1] 2
#> 
#> an nlist object with 1 numeric element
```
