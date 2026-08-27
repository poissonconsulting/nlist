# Number of Parameter Dimensions

Gets the number of the dimensions of each parameter of an object.

The default methods returns the length of each element of
[`pdims()`](https://poissonconsulting.github.io/universals/reference/pdims.html)
as an integer vector.

## Usage

``` r
# S3 method for class 'nlist'
npdims(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Other arguments passed to methods.

## Value

A named integer vector of the number of dimensions of each parameter.

## See also

Other dimensions:
[`dims()`](https://poissonconsulting.github.io/universals/reference/dims.html),
[`ndims()`](https://poissonconsulting.github.io/universals/reference/ndims.html),
[`pdims()`](https://poissonconsulting.github.io/universals/reference/pdims.html)

## Examples

``` r
npdims(nlist(x = 1:3))
#> x 
#> 1 
npdims(nlist(y = 3, zz = matrix(2:5, 2)))
#>  y zz 
#>  1  2 
```
