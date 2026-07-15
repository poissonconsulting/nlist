# Aggregate nlists

**\[defunct\]**

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

## Details

Replace by
[`estimates.nlists()`](https://poissonconsulting.github.io/nlist/dev/reference/estimates.nlists.md).

## See also

Other aggregate:
[`aggregate.nlist()`](https://poissonconsulting.github.io/nlist/dev/reference/aggregate.nlist.md)
