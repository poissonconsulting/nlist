# Coerce to nlist

Coerce an R object to an
[`nlist_object()`](https://poissonconsulting.github.io/nlist/dev/reference/nlist.md).

## Usage

``` r
as_nlist(x, ...)

as.nlist(x, ...)

# S3 method for class 'numeric'
as_nlist(x, ...)

# S3 method for class 'list'
as_nlist(x, ...)

# S3 method for class 'data.frame'
as_nlist(x, ...)

# S3 method for class 'mcmc'
as_nlist(x, ...)

# S3 method for class 'mcmc.list'
as_nlist(x, ...)

as.nlists(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Unused.

## Value

An nlist object.

## Methods (by class)

- `as_nlist(numeric)`: Coerce named numeric vector to nlist

- `as_nlist(list)`: Coerce list to nlist

- `as_nlist(data.frame)`: Coerce data.frame to nlist

- `as_nlist(mcmc)`: Coerce mcmc (with one iteration) to nlist

- `as_nlist(mcmc.list)`: Coerce mcmc.list (with one iteration) to nlist

## See also

Other coerce:
[`as_nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/as_nlists.md)

## Examples

``` r
as_nlist(list(x = 1:4))
#> $x
#> [1] 1 2 3 4
#> 
#> an nlist object with 1 numeric element
as_nlist(c(`a[2]` = 3, `a[1]` = 2))
#> $a
#> [1] 2 3
#> 
#> an nlist object with 1 numeric element
```
