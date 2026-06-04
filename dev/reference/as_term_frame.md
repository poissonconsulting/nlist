# Coerce to a Term Frame

A term frame is a tibble with the first column a term vector called and
a numeric column called value and in the case of an nlists object an
integer vector called samples. It includes the original nlist or nlists
object.

## Usage

``` r
as_term_frame(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Unused.

## Value

An term_frame object.

## See also

Other coerce term:
[`as_term.mcmc()`](https://poissonconsulting.github.io/nlist/dev/reference/as_term.mcmc.md),
[`as_term.nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/as_term.nlist.md),
[`as_term.nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/as_term.nlists.md),
[`as_term_frame.nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/as_term_frame.nlist.md),
[`as_term_frame.nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/as_term_frame.nlists.md)
