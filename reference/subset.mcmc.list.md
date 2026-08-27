# Subset mcmc.list Object

Subsets an mcmc.list object by its chains, parameters and/or iterations.

## Usage

``` r
# S3 method for class 'mcmc.list'
subset(
  x,
  chains = NULL,
  iters = NULL,
  pars = NULL,
  iterations = NULL,
  parameters = NULL,
  ...
)
```

## Arguments

- x:

  An mcmc.list object.

- chains:

  An integer vector of chains.

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

An mcmc.list object.

## Details

Future versions should allow it to be reordered by its parameters.

## Examples

``` r
mcmc.list <- as_mcmc_list(nlists(
  nlist(beta = 1:2, theta = 1),
  nlist(beta = 3:4, theta = -1)
))
subset(mcmc.list, pars = "beta")
#> [[1]]
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 2 
#> Thinning interval = 1 
#>      beta[1] beta[2]
#> [1,]       1       2
#> [2,]       3       4
#> 
#> attr(,"class")
#> [1] "mcmc.list"
subset(mcmc.list, iters = c(1L, 1L))
#> [[1]]
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 
#> End = 
#> Thinning interval = 
#>      beta[1] beta[2] theta
#> [1,]       1       2     1
#> [2,]       1       2     1
#> 
#> attr(,"class")
#> [1] "mcmc.list"
```
