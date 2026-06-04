# Thin MCMC Object

Thins an MCMC object's iterations.

## Usage

``` r
# Default S3 method
thin(x, nthin = 1L, ...)
```

## Arguments

- x:

  An object.

- nthin:

  A positive integer of the thinning rate.

- ...:

  Unused.

## Value

The thinned MCMC object.

## Examples

``` r
thin(nlists(nlist(x = 1), nlist(x = 2), nlist(x = 3), nlist(x = 4)), nthin = 2)
#> $x
#> [1] 2
#> 
#> an nlists object of 2 nlist objects each with 1 numeric element
```
