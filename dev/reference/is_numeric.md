# Is numeric, nlist or nlists

Ask whether x is a numeric object,
[`nlist_object()`](https://poissonconsulting.github.io/nlist/dev/reference/nlist.md)
or
[`nlists_object()`](https://poissonconsulting.github.io/nlist/dev/reference/nlists.md).

## Usage

``` r
is_numeric(x)

is_nlist(x)

is_nlists(x)
```

## Arguments

- x:

  An object.

## Value

A flag indicating whether x is a numeric object or inherits from S3
class nlist or nlists.

## Functions

- `is_nlist()`: Is nlist

- `is_nlists()`: Is nlists

## Examples

``` r
# is_numeric
is_numeric(list(x = 1))
#> [1] FALSE
is_numeric(1)
#> [1] TRUE

# is_nlist
is_nlist(1)
#> [1] FALSE
is_nlist(list(x = 1))
#> [1] FALSE
is_nlist(nlist(x = 1))
#> [1] TRUE

# is_nlists
is_nlists(nlist(x = 1))
#> [1] FALSE
is_nlists(nlists(nlist(x = 2), nlist(x = 3.5)))
#> [1] TRUE
```
