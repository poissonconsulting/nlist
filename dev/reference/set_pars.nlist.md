# Set Parameter Names

Sets an object's parameter names.

The assignment version `pars<-()` forwards to
[`set_pars()`](https://poissonconsulting.github.io/universals/reference/set_pars.html).

## Usage

``` r
# S3 method for class 'nlist'
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
nlist <- nlist(x = 1, y = 3:4)
pars(nlist) <- c("a", "b")
nlist
#> $a
#> [1] 1
#> 
#> $b
#> [1] 3 4
#> 
#> an nlist object with 2 numeric elements
set_pars(nlist, c("z", "c1"))
#> $z
#> [1] 1
#> 
#> $c1
#> [1] 3 4
#> 
#> an nlist object with 2 numeric elements
```
