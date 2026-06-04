# Parameter Dimensions

Gets the dimensions of each parameter of an object.

## Usage

``` r
# S3 method for class 'nlists'
pdims(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Other arguments passed to methods.

## Value

A named list of integer vectors of the dimensions of each parameter.

## See also

Other dimensions:
[`dims()`](https://poissonconsulting.github.io/universals/reference/dims.html),
[`ndims()`](https://poissonconsulting.github.io/universals/reference/ndims.html),
[`npdims()`](https://poissonconsulting.github.io/universals/reference/npdims.html)

## Examples

``` r
pdims(nlists(nlist(x = 1:3)))
#> $x
#> [1] 3
#> 
pdims(nlists(
  nlist(y = 3, zz = matrix(2:5, 2)),
  nlist(y = 5, zz = matrix(1:4, 2))
))
#> $y
#> [1] 1
#> 
#> $zz
#> [1] 2 2
#> 
```
