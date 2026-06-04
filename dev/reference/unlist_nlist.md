# Flatten nlist Object

Simplifies an nlist object to an named numeric vector where the names
are the terms.

## Usage

``` r
unlist_nlist(x)
```

## Arguments

- x:

  An nlist object.

## Value

A named numeric vector of the values in x.

## See also

[`as_nlist.numeric()`](https://poissonconsulting.github.io/nlist/dev/reference/as_nlist.md)
and
[`relist_nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/relist_nlist.md)

## Examples

``` r
unlist_nlist(nlist(y = 2, x = matrix(4:7, ncol = 2)))
#>      y x[1,1] x[2,1] x[1,2] x[2,2] 
#>      2      4      5      6      7 
```
