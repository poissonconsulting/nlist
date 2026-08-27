# Sort mcmc Object

Sorts an mcmc object by its parameter names.

## Usage

``` r
# S3 method for class 'mcmc'
sort(x, ...)
```

## Arguments

- x:

  An mcmc object.

- ...:

  Unused.

## Value

An mcmc object with the parameters sorted by name.

## Examples

``` r
sort(as_mcmc(nlist(y = 1, a = 2:3)))
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 1 
#> Thinning interval = 1 
#>      a[1] a[2] y
#> [1,]    2    3 1
```
