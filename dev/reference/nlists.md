# Create nlists Object

Creates an `nlists_object()` from one of more
[`nlist_object()`](https://poissonconsulting.github.io/nlist/dev/reference/nlist.md)s.

## Usage

``` r
nlists(...)
```

## Arguments

- ...:

  nlist objects.

## Value

An nlists object.

## Details

An nlists object is a S3 class list of
[`nlist_object()`](https://poissonconsulting.github.io/nlist/dev/reference/nlist.md)
elements with the same names, dimensionalities and typeofs.

nlists objects are useful for storing individual realizations of a
simulated data set.

## See also

[`nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/nlist.md)

## Examples

``` r
nlists()
#> an nlists object with 0 nlist objects
nlists(nlist())
#> an nlists object of an nlist object with 0 numeric elements
nlists(nlist(x = 1))
#> $x
#> [1] 1
#> 
#> an nlists object of an nlist object with 1 numeric element
nlists(nlist(x = 1), nlist(x = -3))
#> $x
#> [1] -1
#> 
#> an nlists object of 2 nlist objects each with 1 numeric element
```
