# Coerce to nlists

Coerce an R object to an
[`nlists_object()`](https://poissonconsulting.github.io/nlist/dev/reference/nlists.md).

## Usage

``` r
as_nlists(x, ...)

# S3 method for class 'list'
as_nlists(x, ...)

# S3 method for class 'mcmc'
as_nlists(x, ...)

# S3 method for class 'mcmc.list'
as_nlists(x, ...)

# S3 method for class 'nlist'
as_nlists(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Unused.

## Value

An nlists object.

## Methods (by class)

- `as_nlists(list)`: Coerce list to nlists

- `as_nlists(mcmc)`: Coerce mcmc to nlists

- `as_nlists(mcmc.list)`: Coerce mcmc.list to nlists

- `as_nlists(nlist)`: Coerce nlist to nlists

## See also

Other coerce:
[`as_nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/as_nlist.md)

## Examples

``` r
as_nlists(list(nlist(x = c(1, 5)), nlist(x = c(2, 3)), nlist(x = c(3, 2))))
#> $x
#> [1] 2 3
#> 
#> an nlists object of 3 nlist objects each with 1 numeric element
```
