# Check nlist Object or nlists Object

`chk_nlist` checks if an
[`nlist-object()`](https://poissonconsulting.github.io/nlist/dev/reference/nlist.md).

## Usage

``` r
chk_nlist(x, x_name = NULL)

chk_nlists(x, x_name = NULL)
```

## Arguments

- x:

  The object to check.

- x_name:

  A string of the name of object x or NULL.

## Value

`NULL`, invisibly. Called for the side effect of throwing an error if
the condition is not met.

## Functions

- `chk_nlists()`: Check nlists Object

  `chk_nlists` checks if an
  [`nlists-object()`](https://poissonconsulting.github.io/nlist/dev/reference/nlists.md).

## Examples

``` r

# chk_nlist
chk_nlist(nlist(x = 1))
try(chk_nlist(list(x = 1)))
#> Error in chk_nlist(list(x = 1)) : 
#>   `list(x = 1)` must inherit from S3 class 'nlist'.

# chk_nlists
chk_nlists(nlists(nlist(x = 1)))
```
