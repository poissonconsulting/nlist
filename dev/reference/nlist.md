# Create nlist Object

Creates a `nlist_object()` from one of more uniquely named numeric
arguments.

## Usage

``` r
nlist(...)
```

## Arguments

- ...:

  Uniquely named numeric objects.

## Value

An nlist object.

## Details

An nlist object is an S3 class list of uniquely named numeric elements.

nlist objects are the raw data inputs for analytic engines such as JAGS,
STAN and TMB.

## See also

[`nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/nlists.md)

## Examples

``` r
nlist()
#> an nlist object with 0 numeric elements
nlist(x = 1)
#> $x
#> [1] 1
#> 
#> an nlist object with 1 numeric element
nlist(y = 1:4, zz = matrix(1:9, 3))
#> $y
#> [1] 1 2 3 4
#> 
#> $zz
#>      [,1] [,2] [,3]
#> [1,]    1    4    7
#> [2,]    2    5    8
#> [3,]    3    6    9
#> 
#> an nlist object with 2 numeric elements
```
