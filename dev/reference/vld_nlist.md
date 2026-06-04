# Validate nlist Object or nlists Object

Validate nlist Object or nlists Object

## Usage

``` r
vld_nlist(x)

vld_nlists(x)
```

## Arguments

- x:

  The object to check.

## Value

A flag indicating whether the object was validated.

## Functions

- `vld_nlists()`: Validate nlists Object

## Examples

``` r

# vld_nlist
vld_nlist(nlist(x = 1))
#> [1] TRUE
try(vld_nlist(list(x = 1)))
#> [1] FALSE

# vld_nlists
vld_nlists(nlists(nlist(x = 1)))
#> [1] TRUE
vld_nlists(1)
#> [1] FALSE
```
