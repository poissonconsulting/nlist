# Flatten nlist Object

Flatten nlist Object

## Usage

``` r
# S3 method for class 'nlist'
unlist(x, recursive = TRUE, use.names = TRUE)
```

## Arguments

- x:

  An nlist object.

- recursive:

  Ignored.

- use.names:

  A flag specifying whether to preserve names.

## Value

A named numeric vector of the values in x.

## See also

[`unlist_nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/unlist_nlist.md)

## Examples

``` r
unlist(nlist(y = 2, x = matrix(4:7, ncol = 2)))
#>      y x[1,1] x[2,1] x[1,2] x[2,2] 
#>      2      4      5      6      7 
```
