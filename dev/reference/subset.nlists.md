# Subset nlists Object

Subsets an nlists object by its parameters, chains and iterations.

## Usage

``` r
# S3 method for class 'nlists'
subset(x, chains = NULL, iters = NULL, pars = NULL, ...)
```

## Arguments

- x:

  An nlists object.

- chains:

  An integer vector of chains.

- iters:

  An integer vector of iterations.

- pars:

  A character vector of parameter names.

- ...:

  Unused.

## Value

An nlists object.

## Details

It can also be used to reorder the parameters as well as duplicate
chains and iterations.

## Examples

``` r
nlists <- nlists(
  nlist(a = 1, y = 3, x = 1:4),
  nlist(a = 2, y = 4, x = 4:1),
  nlist(a = 3, y = 6, x = 5:2)
)
subset(nlists)
#> $a
#> [1] 2
#> 
#> $y
#> [1] 4
#> 
#> $x
#> [1] 4 3 3 2
#> 
#> an nlists object of 3 nlist objects each with 3 numeric elements
subset(nlists, pars = "a")
#> $a
#> [1] 2
#> 
#> an nlists object of 3 nlist objects each with 1 numeric element
subset(nlists, pars = c("x", "a"))
#> $x
#> [1] 4 3 3 2
#> 
#> $a
#> [1] 2
#> 
#> an nlists object of 3 nlist objects each with 2 numeric elements
subset(nlists, iters = 1L)
#> $a
#> [1] 1
#> 
#> $y
#> [1] 3
#> 
#> $x
#> [1] 1 2 3 4
#> 
#> an nlists object of an nlist object with 3 numeric elements
subset(nlists, iters = c(2L, 2L))
#> $a
#> [1] 2
#> 
#> $y
#> [1] 4
#> 
#> $x
#> [1] 4 3 2 1
#> 
#> an nlists object of 2 nlist objects each with 3 numeric elements
```
