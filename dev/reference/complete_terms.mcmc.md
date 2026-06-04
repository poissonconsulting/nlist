# Complete Terms

Adds any absent elements to an mcmc object.

## Usage

``` r
# S3 method for class 'mcmc'
complete_terms(x, silent = FALSE, ...)
```

## Arguments

- x:

  An mcmc object.

- silent:

  A flag specifying whether to suppress warning messages.

- ...:

  Unused.

## Value

The repaired and complete mcmc object.

## Details

The terms are repaired before being completed. Missing or invalid or
inconsistent terms are dropped with a warning.

## Examples

``` r
mcmc <- as_mcmc(nlist(beta = matrix(1:4, nrow = 2)))
mcmc <- mcmc[, -4, drop = FALSE]
complete_terms(mcmc)
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 1 
#> Thinning interval = 1 
#>      beta[1,1] beta[2,1] beta[1,2] beta[2,2]
#> [1,]         1         2         3        NA
```
