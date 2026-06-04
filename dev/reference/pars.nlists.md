# Parameter Names

Gets the parameter names.

## Usage

``` r
# S3 method for class 'nlists'
pars(x, scalar = NULL, terms = FALSE, ...)
```

## Arguments

- x:

  An object.

- scalar:

  A logical scalar specifying whether to include all parameters (NULL),
  only scalars (TRUE) or all parameters except scalars (FALSE).

- terms:

  A flag specifying whether to return the parameter name for each term
  element.

- ...:

  Other arguments passed to methods.

## Value

A character vector of the names of the parameters.

## See also

Other parameters:
[`npars()`](https://poissonconsulting.github.io/universals/reference/npars.html),
[`set_pars()`](https://poissonconsulting.github.io/universals/reference/set_pars.html)

## Examples

``` r
pars(nlists(nlist(zz = 1, y = 3:6), nlist(zz = 4, y = 13:16)))
#> [1] "zz" "y" 
```
