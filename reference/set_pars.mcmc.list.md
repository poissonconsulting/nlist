# Set Parameters

Sets an object's parameter names.

The assignment version `pars<-()` forwards to
[`set_pars()`](https://poissonconsulting.github.io/universals/reference/set_pars.html).

## Usage

``` r
# S3 method for class 'mcmc.list'
set_pars(x, value, ...)
```

## Arguments

- x:

  An object.

- value:

  A character vector of the new parameter names.

- ...:

  Other arguments passed to methods.

## Value

The modified object.

## Details

`value` must be a unique character vector of the same length as the
object's parameters.

## See also

Other parameters:
[`npars()`](https://poissonconsulting.github.io/universals/reference/npars.html),
[`pars()`](https://poissonconsulting.github.io/universals/reference/pars.html)

## Examples

``` r
set_pars(as_mcmc_list(nlist(x = 1, y = 3:4)), c("a", "b"))
#> [[1]]
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 1 
#> Thinning interval = 1 
#>      a b[1] b[2]
#> [1,] 1    3    4
#> 
#> attr(,"class")
#> [1] "mcmc.list"
```
