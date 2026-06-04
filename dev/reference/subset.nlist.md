# Subset nlist Object

Subsets an nlist object by its parameters.

## Usage

``` r
# S3 method for class 'nlist'
subset(x, pars = NULL, ...)
```

## Arguments

- x:

  An nlist object.

- pars:

  A character vector of parameter names.

- ...:

  Unused.

## Value

An nlist object.

## Details

It can also be used to reorder the parameters.

## Examples

``` r
nlist <- nlist(a = 1, y = 3, x = 1:4)
subset(nlist)
#> $a
#> [1] 1
#> 
#> $y
#> [1] 3
#> 
#> $x
#> [1] 1 2 3 4
#> 
#> an nlist object with 3 numeric elements
subset(nlist, "a")
#> $a
#> [1] 1
#> 
#> an nlist object with 1 numeric element
subset(nlist, c("x", "a"))
#> $x
#> [1] 1 2 3 4
#> 
#> $a
#> [1] 1
#> 
#> an nlist object with 2 numeric elements
```
