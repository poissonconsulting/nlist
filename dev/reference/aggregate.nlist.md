# Aggregate nlist

Aggregates an
[`nlist_object()`](https://poissonconsulting.github.io/nlist/dev/reference/nlist.md)
into a named list of numeric scalars.

## Usage

``` r
# S3 method for class 'nlist'
aggregate(x, fun = mean, ...)
```

## Arguments

- x:

  An nlist object.

- fun:

  A function that given a numeric vector returns a numeric scalar.

- ...:

  Additional arguments passed to fun.

## Value

An named list of numeric scalars

## See also

Other aggregate:
[`aggregate.nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/aggregate.nlists.md)

## Examples

``` r
aggregate(nlist(x = 1:9))
#> Warning: `aggregate.nlist()` was deprecated in nlist 0.1.1.
#> ℹ Please use `estimates.nlist()` instead.
#> $x
#> [1] 5
#> 
aggregate(nlist(y = 3:5, zz = matrix(1:9, 3)), fun = function(x) x[1])
#> $y
#> [1] 3
#> 
#> $zz
#> [1] 1
#> 
```
