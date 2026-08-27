# nlist Objects and Coercions

``` r

library(nlist)
```

## nlist

The central object is the `nlist` object which is a list of uniquely
named numeric objects (which can be integer or double vectors, matrices
or arrays) of class nlist. `nlist` objects are the raw data inputs for
analytic engines such as JAGS, STAN and TMB.

``` r

nlist <- nlist(
  x = 1:2,
  y = matrix(c(4:1), nrow = 2),
  z = 5.1
)
print(nlist)
#> $x
#> [1] 1 2
#> 
#> $y
#>      [,1] [,2]
#> [1,]    4    2
#> [2,]    3    1
#> 
#> $z
#> [1] 5.1
#> 
#> an nlist object with 3 numeric elements
str(nlist)
#> List of 3
#>  $ x: int [1:2] 1 2
#>  $ y: int [1:2, 1:2] 4 3 2 1
#>  $ z: num 5.1
#>  - attr(*, "class")= chr "nlist"
```

## nlists

`nlist` objects with the same names, dimensionalities and typeofs can be
combined to create an `nlists` object. An `nlists` object is a list of
`nlist` objects of S3 class `nlists`. `nlists` objects are useful for
storing multiple realizations of simulated data sets (as in the `sims`
package) or iterations of MCMC samples of parameter terms output by
Bayesian analytic engines such as JAGS and STAN\>

``` r

nlists <- nlists(
  nlist,
  nlist,
  nlist(
    x = 2:3,
    y = matrix(c(5:8), nrow = 2),
    z = 8
  )
)
print(nlists)
#> $x
#> [1] 1 2
#> 
#> $y
#>      [,1] [,2]
#> [1,]    4    2
#> [2,]    3    1
#> 
#> $z
#> [1] 5.1
#> 
#> an nlists object of 3 nlist objects each with 3 numeric elements
str(nlists)
#> List of 3
#>  $ :List of 3
#>   ..$ x: int [1:2] 1 2
#>   ..$ y: int [1:2, 1:2] 4 3 2 1
#>   ..$ z: num 5.1
#>   ..- attr(*, "class")= chr "nlist"
#>  $ :List of 3
#>   ..$ x: int [1:2] 1 2
#>   ..$ y: int [1:2, 1:2] 4 3 2 1
#>   ..$ z: num 5.1
#>   ..- attr(*, "class")= chr "nlist"
#>  $ :List of 3
#>   ..$ x: int [1:2] 2 3
#>   ..$ y: int [1:2, 1:2] 5 6 7 8
#>   ..$ z: num 8
#>   ..- attr(*, "class")= chr "nlist"
#>  - attr(*, "class")= chr "nlists"
```

## mcmc

`nlists` (and `nlist`) objects can be converted to `mcmc` objects which
are matrices with the parameter terms as the columns and the iterations
are the rows. `mcmc` objects are defined by the `coda` package.

``` r

as_mcmc(nlist)
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 1 
#> Thinning interval = 1 
#>      x[1] x[2] y[1,1] y[2,1] y[1,2] y[2,2]   z
#> [1,]    1    2      4      3      2      1 5.1
as_mcmc(nlists)
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 3 
#> Thinning interval = 1 
#>      x[1] x[2] y[1,1] y[2,1] y[1,2] y[2,2]   z
#> [1,]    1    2      4      3      2      1 5.1
#> [2,]    1    2      4      3      2      1 5.1
#> [3,]    2    3      5      6      7      8 8.0
str(as_mcmc(nlists))
#>  'mcmc' num [1:3, 1:7] 1 1 2 2 2 3 4 4 5 3 ...
#>  - attr(*, "dimnames")=List of 2
#>   ..$ : NULL
#>   ..$ : chr [1:7] "x[1]" "x[2]" "y[1,1]" "y[2,1]" ...
#>  - attr(*, "mcpar")= num [1:3] 1 3 1
```

`mcmc` objects can be coerced back to `nlist` and `nlists` objects.

``` r

as_nlist(as_mcmc(nlist))
#> $x
#> [1] 1 2
#> 
#> $y
#>      [,1] [,2]
#> [1,]    4    2
#> [2,]    3    1
#> 
#> $z
#> [1] 5.1
#> 
#> an nlist object with 3 numeric elements
```

Coercing an `mcmc` object with multiple iterations back to an `nlists`
object requires the `mcmcr` package.

``` r

as_nlists(as_mcmc(nlists))
#> $x
#> [1] 1 2
#> 
#> $y
#>      [,1] [,2]
#> [1,]    4    2
#> [2,]    3    1
#> 
#> $z
#> [1] 5.1
#> 
#> an nlists object of 3 nlist objects each with 3 numeric elements
```

## list

Unlisting an `nlist` object produces a named vector with the parameter
terms as names.

``` r

unlist(nlist)
#>   x[1]   x[2] y[1,1] y[2,1] y[1,2] y[2,2]      z 
#>    1.0    2.0    4.0    3.0    2.0    1.0    5.1
```

A vector can be coerced back to an nlist object if an nlist object is
available to act as a skeleton.

``` r

list <- unlist(nlist)
list[1] <- 100
list["z"] <- -999
relist_nlist(list, nlist)
#> $x
#> [1] 100   2
#> 
#> $y
#> [1] 4 3 2 1
#> 
#> $z
#> [1] -999
#> 
#> an nlist object with 3 numeric elements
```

## data frame

A `data.frame` of numeric vectors can be coerced to an `nlist` object.

``` r

as_nlist(data.frame(x = 1:2, y = c(3, 5)))
#> $x
#> [1] 1 2
#> 
#> $y
#> [1] 3 5
#> 
#> an nlist object with 2 numeric elements
```

## term frame

And `nlist` and `nlists` object can be converted to a `term_frame`. A
`term_frame` is a data.frame with the parameter terms as one column and
the values as another. In the case of an `nlists` object a sample column
is also created specifies the iteration number.

``` r

as_term_frame(nlist)
#>     term value
#> 1   x[1]   1.0
#> 2   x[2]   2.0
#> 3 y[1,1]   4.0
#> 4 y[2,1]   3.0
#> 5 y[1,2]   2.0
#> 6 y[2,2]   1.0
#> 7      z   5.1
as_term_frame(nlists)
#>      term sample value
#> 1    x[1]      1   1.0
#> 2    x[2]      1   2.0
#> 3  y[1,1]      1   4.0
#> 4  y[2,1]      1   3.0
#> 5  y[1,2]      1   2.0
#> 6  y[2,2]      1   1.0
#> 7       z      1   5.1
#> 8    x[1]      2   1.0
#> 9    x[2]      2   2.0
#> 10 y[1,1]      2   4.0
#> 11 y[2,1]      2   3.0
#> 12 y[1,2]      2   2.0
#> 13 y[2,2]      2   1.0
#> 14      z      2   5.1
#> 15   x[1]      3   2.0
#> 16   x[2]      3   3.0
#> 17 y[1,1]      3   5.0
#> 18 y[2,1]      3   6.0
#> 19 y[1,2]      3   7.0
#> 20 y[2,2]      3   8.0
#> 21      z      3   8.0
```

A `term_frame` object is data.frame.

``` r

str(as_term_frame(nlists))
#> 'data.frame':    21 obs. of  3 variables:
#>  $ term  : term [1:21] x[1], x[2], y[1,1], y[2,1], y[1,2], y[2,2], z, x[1], x[2],...
#>  $ sample: int  1 1 1 1 1 1 1 2 2 2 ...
#>  $ value : num  1 2 4 3 2 1 5.1 1 2 4 ...
```
