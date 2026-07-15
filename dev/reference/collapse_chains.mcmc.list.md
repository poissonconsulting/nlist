# Collapse Chains

Collapses an MCMC object's chains into a single chain.

## Usage

``` r
# S3 method for class 'mcmc.list'
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
[`collapse_chains.nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/collapse_chains.nlist.md),
[`collapse_chains.nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/collapse_chains.nlists.md)

## Examples

``` r
mcmc_list <- as_mcmc_list(split_chains(nlists(nlist(x = 1), nlist(x = 2))))
collapse_chains(mcmc_list)
#> [[1]]
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 2 
#> Thinning interval = 1 
#>      x
#> [1,] 1
#> [2,] 2
#> 
#> attr(,"class")
#> [1] "mcmc.list"
```
