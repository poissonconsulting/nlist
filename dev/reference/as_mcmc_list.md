# Coerce to an mcmc.list Object

Coerce an R object to an mcmc.list object.

## Usage

``` r
as_mcmc_list(x, ...)

# S3 method for class 'mcmc'
as_mcmc_list(x, ...)

# S3 method for class 'nlist'
as_mcmc_list(x, ...)

# S3 method for class 'nlists'
as_mcmc_list(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Unused.

## Value

An mcmc.list object.

## Methods (by class)

- `as_mcmc_list(mcmc)`: Coerce an mcmc object to an mcmc.list object.

- `as_mcmc_list(nlist)`: Coerce an nlist object to an mcmc.list object.

- `as_mcmc_list(nlists)`: Coerce an nlists object to an mcmc.list
  object.

## See also

Other mcmc:
[`as_mcmc()`](https://poissonconsulting.github.io/nlist/dev/reference/as_mcmc.md)

## Examples

``` r
as_mcmc_list(nlist(x = matrix(1:6, 2)))
#> [[1]]
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 1 
#> Thinning interval = 1 
#>      x[1,1] x[2,1] x[1,2] x[2,2] x[1,3] x[2,3]
#> [1,]      1      2      3      4      5      6
#> 
#> attr(,"class")
#> [1] "mcmc.list"
as_mcmc_list(nlists(
  nlist(x = matrix(1:6, 2)),
  nlist(x = matrix(3:8, 2))
))
#> [[1]]
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 2 
#> Thinning interval = 1 
#>      x[1,1] x[2,1] x[1,2] x[2,2] x[1,3] x[2,3]
#> [1,]      1      2      3      4      5      6
#> [2,]      3      4      5      6      7      8
#> 
#> attr(,"class")
#> [1] "mcmc.list"
```
