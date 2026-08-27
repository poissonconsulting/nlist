# Fill Missing Values

Fills all of an object's missing values while preserving the object's
dimensionality and class.

## Usage

``` r
# S3 method for class 'nlists'
fill_na(x, value = 0L, ...)
```

## Arguments

- x:

  An object.

- value:

  A scalar of the value to replace values with.

- ...:

  Other arguments passed to methods.

## Value

The modified object.

## Details

It should only be defined for objects with values of consistent class ie
not standard data.frames.

## Methods (by class)

- `fill_na(logical)`: Fill Missing Values for logical Objects

- `fill_na(integer)`: Fill Missing Values for integer Objects

- `fill_na(numeric)`: Fill Missing Values for numeric Objects

- `fill_na(character)`: Fill Missing Values for character Objects

## See also

Other fill:
[`fill_all()`](https://poissonconsulting.github.io/extras/reference/fill_all.html)

## Examples

``` r
fill_na(nlist(x = c(2, NA), y = matrix(c(1:3, NA), nrow = 2)))
#> $x
#> [1] 2 0
#> 
#> $y
#>      [,1] [,2]
#> [1,]    1    3
#> [2,]    2    0
#> 
#> an nlist object with 2 numeric elements
```
