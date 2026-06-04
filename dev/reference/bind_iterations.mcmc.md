# Bind Iterations

Combines two MCMC objects (with the same parameters and chains) by
iterations.

## Usage

``` r
# S3 method for class 'mcmc'
bind_iterations(x, x2, ...)
```

## Arguments

- x:

  An object.

- x2:

  A second object.

- ...:

  Other arguments passed to methods.

## Value

The combined object.

## See also

Other MCMC manipulations:
[`bind_chains()`](https://poissonconsulting.github.io/universals/reference/bind_chains.html),
[`collapse_chains()`](https://poissonconsulting.github.io/universals/reference/collapse_chains.html),
[`estimates()`](https://poissonconsulting.github.io/universals/reference/estimates.html),
[`split_chains()`](https://poissonconsulting.github.io/universals/reference/split_chains.html)

## Examples

``` r
bind_iterations(as_mcmc(nlist(x = 1)), as_mcmc(nlist(x = 3)))
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 2 
#> Thinning interval = 1 
#>      x
#> [1,] 1
#> [2,] 3
```
