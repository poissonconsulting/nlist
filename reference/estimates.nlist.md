# Estimates

Calculates the estimates for an MCMC object.

## Usage

``` r
# S3 method for class 'nlist'
estimates(x, fun = median, ...)
```

## Arguments

- x:

  An object.

- fun:

  A function that given a numeric vector returns a numeric scalar.

- ...:

  Additional arguments passed to fun.

## Value

A list of uniquely named numeric objects.

## See also

Other MCMC manipulations:
[`bind_chains()`](https://poissonconsulting.github.io/universals/reference/bind_chains.html),
[`bind_iterations()`](https://poissonconsulting.github.io/universals/reference/bind_iterations.html),
[`collapse_chains()`](https://poissonconsulting.github.io/universals/reference/collapse_chains.html),
[`split_chains()`](https://poissonconsulting.github.io/universals/reference/split_chains.html)

## Examples

``` r
estimates(nlist(x = 1:9))
#> $x
#> [1] 1 2 3 4 5 6 7 8 9
#> 
#> an nlist object with 1 numeric element
estimates(nlist(y = 3:5, zz = matrix(1:9, 3)))
#> $y
#> [1] 3 4 5
#> 
#> $zz
#>      [,1] [,2] [,3]
#> [1,]    1    4    7
#> [2,]    2    5    8
#> [3,]    3    6    9
#> 
#> an nlist object with 2 numeric elements
```
