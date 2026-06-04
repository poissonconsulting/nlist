# Aggregate nlists

Aggregates an
[`nlists_object()`](https://poissonconsulting.github.io/nlist/dev/reference/nlists.md)
into a
[`nlist_object()`](https://poissonconsulting.github.io/nlist/dev/reference/nlist.md)
or by_chain = TRUE an
[`nlists_object()`](https://poissonconsulting.github.io/nlist/dev/reference/nlists.md)
with `nchains`
[`nlist_object()`](https://poissonconsulting.github.io/nlist/dev/reference/nlist.md)s.

## Usage

``` r
# S3 method for class 'nlists'
aggregate(x, fun = mean, ..., by_chain = FALSE)
```

## Arguments

- x:

  An object.

- fun:

  A function that given a numeric vector returns a numeric scalar.

- ...:

  Unused.

- by_chain:

  A flag specifying whether to aggregate by chains.

## Value

An nlist object if `by_chain = FALSE` otherwise an nlists object.

## See also

Other aggregate:
[`aggregate.nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/aggregate.nlist.md)

## Examples

``` r
aggregate(nlists(nlist(x = 1:3), nlist(x = 2:4)))
#> Warning: `aggregate.nlists()` was deprecated in nlist 0.1.1.
#> ℹ Please use `estimates.nlists()` instead.
#> $x
#> [1] 1.5 2.5 3.5
#> 
#> an nlist object with 1 numeric element
```
