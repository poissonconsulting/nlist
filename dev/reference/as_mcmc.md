# Coerce to mcmc Object

Coerce an R object to an mcmc object.

## Usage

``` r
as_mcmc(x, ...)

# S3 method for class 'mcmc.list'
as_mcmc(x, ...)

# S3 method for class 'nlist'
as_mcmc(x, ...)

# S3 method for class 'nlists'
as_mcmc(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Unused.

## Value

An mcmc object.

## Methods (by class)

- `as_mcmc(mcmc.list)`: Coerce an mcmc.list object to an mcmc object.

- `as_mcmc(nlist)`: Coerce an nlist object to an mcmc object.

- `as_mcmc(nlists)`: Coerce an nlists object to an mcmc object.

## See also

[`coda::as.mcmc()`](https://rdrr.io/pkg/coda/man/mcmc.html)

Other mcmc:
[`as_mcmc_list()`](https://poissonconsulting.github.io/nlist/dev/reference/as_mcmc_list.md)

## Examples

``` r
as_mcmc(as_mcmc_list(nlists(nlist(x = 2), nlist(x = 3))))
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 2 
#> Thinning interval = 1 
#>      x
#> [1,] 2
#> [2,] 3
as_mcmc(nlist(x = matrix(1:6, 2)))
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 1 
#> Thinning interval = 1 
#>      x[1,1] x[2,1] x[1,2] x[2,2] x[1,3] x[2,3]
#> [1,]      1      2      3      4      5      6
as_mcmc(nlists(
  nlist(x = matrix(1:6, 2)),
  nlist(x = matrix(3:8, 2))
))
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 2 
#> Thinning interval = 1 
#>      x[1,1] x[2,1] x[1,2] x[2,2] x[1,3] x[2,3]
#> [1,]      1      2      3      4      5      6
#> [2,]      3      4      5      6      7      8
```
