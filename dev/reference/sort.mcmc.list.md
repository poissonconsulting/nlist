# Sort mcmc.list Object

Sorts an mcmc.list object by its parameter names.

## Usage

``` r
# S3 method for class 'mcmc.list'
sort(x, ...)
```

## Arguments

- x:

  An mcmc.list object.

- ...:

  Unused.

## Value

An mcmc.list object with the parameters sorted by name.

## Examples

``` r
sort(as_mcmc_list(nlist(y = 1, a = 2:3)))
#> [[1]]
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 1 
#> Thinning interval = 1 
#>      a[1] a[2] y
#> [1,]    2    3 1
#> 
#> attr(,"class")
#> [1] "mcmc.list"
```
