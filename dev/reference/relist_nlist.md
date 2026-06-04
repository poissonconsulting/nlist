# Relists an unlist nlist Object

Relists an nlist object that has been unlisted to a named numeric
vector. Ensures absent terms are included and preserves integer class.

## Usage

``` r
relist_nlist(flesh, skeleton)
```

## Arguments

- flesh:

  An atomic vector

- skeleton:

  An nlist object.

## Value

A numeric vector of the values in x.

## See also

[`as_nlist.numeric()`](https://poissonconsulting.github.io/nlist/dev/reference/as_nlist.md)
and
[`unlist_nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/unlist_nlist.md)

## Examples

``` r
relist_nlist(c(`a[2]` = 5), nlist(a = 1:3))
#> $a
#> [1] NA  5 NA
#> 
#> an nlist object with 1 numeric element
```
