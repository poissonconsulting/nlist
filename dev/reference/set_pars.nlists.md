# Set Parameter Names

Sets an object's parameter names.

The assignment version `pars<-()` forwards to
[`set_pars()`](https://poissonconsulting.github.io/universals/reference/set_pars.html).

## Usage

``` r
# S3 method for class 'nlists'
set_pars(x, value, ...)
```

## Arguments

- x:

  An object.

- value:

  A character vector of the new parameter names.

- ...:

  Other arguments passed to methods.

## Value

The modified object.

## Details

`value` must be a unique character vector of the same length as the
object's parameters.

## See also

Other parameters:
[`npars()`](https://poissonconsulting.github.io/universals/reference/npars.html),
[`pars()`](https://poissonconsulting.github.io/universals/reference/pars.html)

## Examples

``` r
nlists <- nlists(nlist(x = 2), nlist(x = 3))
pars(nlists) <- "a"
nlists
#> $a
#> [1] 2.5
#> 
#> an nlists object of 2 nlist objects each with 1 numeric element
set_pars(nlists, "zz")
#> $zz
#> [1] 2.5
#> 
#> an nlists object of 2 nlist objects each with 1 numeric element
```
