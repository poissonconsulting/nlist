# Fill All Values

Fills all of an object's (missing and non-missing) values while
preserving the object's dimensionality and class.

## Usage

``` r
# S3 method for class 'nlists'
fill_all(x, value = 0L, nas = TRUE, ...)
```

## Arguments

- x:

  An object.

- value:

  A scalar of the value to replace values with.

- nas:

  A flag specifying whether to also fill missing values.

- ...:

  Other arguments passed to methods.

## Value

The modified object.

## Details

It should only be defined for objects with values of consistent class ie
not standard data.frames.

## Methods (by class)

- `fill_all(logical)`: Fill All for logical Objects

- `fill_all(integer)`: Fill All for integer Objects

- `fill_all(numeric)`: Fill All for numeric Objects

- `fill_all(character)`: Fill All for character Objects

## See also

Other fill:
[`fill_na()`](https://poissonconsulting.github.io/extras/reference/fill_na.html)

## Examples

``` r
fill_all(nlists(nlist(x = c(2, NA)), nlist(x = c(NA_real_, NA))))
#> $x
#> [1] 0 0
#> 
#> an nlists object of 2 nlist objects each with 1 numeric element
fill_all(nlists(nlist(x = c(2, NA)), nlist(x = c(NA_real_, NA))), nas = FALSE)
#> $x
#> [1] NA NA
#> 
#> an nlists object of 2 nlist objects each with 1 numeric element
```
