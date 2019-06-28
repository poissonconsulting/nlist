
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nlist

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.com/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.com/poissonconsulting/nlist.svg?branch=master)](https://travis-ci.com/poissonconsulting/nlist)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/nlist?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/nlist)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/nlist/branch/master/graph/badge.svg)](https://codecov.io/gh/poissonconsulting/nlist?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

nlist is an R package to create and manipulate numeric list (nlist)
objects. An nlist is an S3 class list of uniquely named numeric atomic
(natomic) objects. An natomic object is an integer or double vector,
matrix or array.

Numeric list objects are of interest because they are the raw data
inputs for analytic engines such as JAGS, STAN and TMB.

## Demonstration

### `natomic`

An natomic object is an integer or double vector, matrix or array.

``` r
library(nlist)
is.natomic(TRUE)
#> [1] FALSE
is.natomic(1L)
#> [1] TRUE
is.natomic(matrix(1:3))
#> [1] TRUE
```

### `nlist`

It is straightforward to create an new nlist object.

``` r
library(nlist)

nlist(x = 1, y = matrix(1:9, 3))
#> $x
#> [1] 1
#> 
#> $y
#>      [,1] [,2] [,3]
#> [1,]    1    4    7
#> [2,]    2    5    8
#> [3,]    3    6    9
#> 
#> attr(,"class")
#> [1] "nlist"
```

Or to coerce an existing object to an nlist.

``` r
as.nlist(data.frame(lgl = c(TRUE, NA),
                    dte = as.Date(c("2001-01-02", "2001-01-01")),
                    fac = factor(c("b", "a"))))
#> $lgl
#> [1]  1 NA
#> 
#> $dte
#> [1] 11324 11323
#> 
#> $fac
#> [1] 2 1
#> 
#> attr(,"class")
#> [1] "nlist"
```

### `nlists`

An nlists object is a S3 class list of nlist objects with the same
names, dimensionalities and typeofs. nlists objects are useful for
storing individual realizations of a simulated data set.

``` r
nlists <- nlists(nlist(x = 1, y = matrix(1:9, 3)), 
                 nlist(x = -2, y = matrix(2:10, 3)))

print(nlists)
#> [[1]]
#> $x
#> [1] 1
#> 
#> $y
#>      [,1] [,2] [,3]
#> [1,]    1    4    7
#> [2,]    2    5    8
#> [3,]    3    6    9
#> 
#> attr(,"class")
#> [1] "nlist"
#> 
#> [[2]]
#> $x
#> [1] -2
#> 
#> $y
#>      [,1] [,2] [,3]
#> [1,]    2    5    8
#> [2,]    3    6    9
#> [3,]    4    7   10
#> 
#> attr(,"class")
#> [1] "nlist"
#> 
#> attr(,"class")
#> [1] "nlists"
```

Aggregating an nlists object gives an nlist object.

``` r
aggregate(nlists)
#> $x
#> [1] -0.5
#> 
#> $y
#>      [,1] [,2] [,3]
#> [1,]  1.5  4.5  7.5
#> [2,]  2.5  5.5  8.5
#> [3,]  3.5  6.5  9.5
#> 
#> attr(,"class")
#> [1] "nlist"
```

## Installation

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/nlist)

    remotes::install_github("poissonconsulting/nlist")

To install the latest development version from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

    drat::addRepo("poissonconsulting")
    install.packages("nlist")

## Contribution

Please note that the ‘nlist’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). Please note that this project is
released with a [Contributor Code of
Conduct](https://poissonconsulting.github.io/mcmcr/CONDUCT.html). By
participating in this project you agree to abide by its terms.
