# Collapse Chains

Collapses an MCMC object's chains into a single chain.

## Usage

``` r
# S3 method for class 'mcmc'
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

As mcmc objects can only have 1 chain the object is unchanged.

## See also

Other collapse:
[`collapse_chains.nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/collapse_chains.nlist.md),
[`collapse_chains.nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/collapse_chains.nlists.md)

## Examples

``` r
collapse_chains(as_mcmc(nlist(x = 2)))
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 1 
#> Thinning interval = 1 
#>      x
#> [1,] 2
```
