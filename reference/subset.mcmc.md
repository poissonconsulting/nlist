# Subset mcmc Object

Subsets an mcmc object by its parameters and/or iterations.

## Usage

``` r
# S3 method for class 'mcmc'
subset(x, iters = NULL, pars = NULL, iterations = NULL, parameters = NULL, ...)
```

## Arguments

- x:

  An mcmc object.

- iters:

  An integer vector of iterations.

- pars:

  A character vector of parameter names.

- iterations:

  An integer vector (or NULL) of the iterations to subset by.

- parameters:

  A character vector (or NULL) of the parameters to subset by.

- ...:

  Unused.

## Value

An mcmc object.

## Details

Future versions should allow it to be reordered by its parameters.

## Examples

``` r
mcmc <- as_mcmc(nlist(beta = 1:2, theta = 1))
subset(mcmc, pars = "beta")
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 1 
#> Thinning interval = 1 
#>      beta[1] beta[2]
#> [1,]       1       2
subset(mcmc, iters = c(1L, 1L))
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 
#> End = 
#> Thinning interval = 
#>      beta[1] beta[2] theta
#> [1,]       1       2     1
#> [2,]       1       2     1
```
