
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nlist

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis build
status](https://travis-ci.com/poissonconsulting/nlist.svg?branch=master)](https://travis-ci.com/poissonconsulting/nlist)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/nlist?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/nlist)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/nlist/branch/master/graph/badge.svg)](https://codecov.io/gh/poissonconsulting/nlist?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Tinyverse
status](https://tinyverse.netlify.com/badge/nlist)](https://CRAN.R-project.org/package=nlist)
[![CRAN
status](https://www.r-pkg.org/badges/version/nlist)](https://cran.r-project.org/package=nlist)
![CRAN downloads](http://cranlogs.r-pkg.org/badges/nlist)
<!-- badges: end -->

nlist is an R package to create and manipulate numeric list (nlist)
objects.

An nlist is an S3 class list of uniquely named numeric atomic (natomic)
objects. An natomic object is an integer or double vector, matrix or
array. nlist objects are the raw data inputs for analytic engines such
as JAGS, STAN and TMB.

An nlists object is a S3 class list of nlist objects with the same
names, dimensionalities and typeofs. nlists objects are useful for
storing multiple realizations of simulated datas sets. They can be
converted to and from `coda::mcmc` objects.

## Installation

To install the latest release version from
[CRAN](https://cran.r-project.org)

``` r
install.packages("nlist")
```

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/hmstimer)

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/nlist")
```

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

An nlist is an S3 class list of uniquely named numeric atomic (natomic)
objects.

It is straightforward to create an new nlist object.

``` r
library(nlist)

nlist <- nlist(x = 1, y = matrix(1:9, 3))
nlist
#> $x
#> [1] 1
#> 
#> $y
#>      [,1] [,2] [,3]
#> [1,]    1    4    7
#> [2,]    2    5    8
#> [3,]    3    6    9
#> 
#> an nlist object with 2 natomic elements
```

Or to coerce from a data frame.

``` r
data <- data.frame(lgl = c(TRUE, NA),
                    dte = as.Date(c("2001-01-02", "2001-01-01")),
                    fac = factor(c("b", "a")))

data
#>    lgl        dte fac
#> 1 TRUE 2001-01-02   b
#> 2   NA 2001-01-01   a
as.nlist(data)
#> $lgl
#> [1]  1 NA
#> 
#> $dte
#> [1] 11324 11323
#> 
#> $fac
#> [1] 2 1
#> 
#> an nlist object with 3 natomic elements
```

### `nlists`

An nlists object is a S3 class list of nlist objects with the same
names, dimensionalities and typeofs.

``` r
nlists <- nlists(nlist(x = 1, y = matrix(1:9, 3)), 
                 nlist(x = -2, y = matrix(2:10, 3)),
                 nlist(x = -2, y = matrix(2:10, 3)))

print(nlists)
#> $x
#> [1] -1
#> 
#> $y
#>          [,1]     [,2]     [,3]
#> [1,] 1.666667 4.666667 7.666667
#> [2,] 2.666667 5.666667 8.666667
#> [3,] 3.666667 6.666667 9.666667
#> 
#> an nlists object of 3 nlist objects each with 2 natomic elements
```

Aggregating an nlists object gives an nlist object.

``` r
aggregate(nlists, FUN = median)
#> $x
#> [1] -2
#> 
#> $y
#>      [,1] [,2] [,3]
#> [1,]    2    5    8
#> [2,]    3    6    9
#> [3,]    4    7   10
#> 
#> an nlist object with 2 natomic elements
```

An nlists object can be coerced to an coda::mcmc object.

``` r
coda::as.mcmc(nlists)
#>       x y[1,1] y[2,1] y[3,1] y[1,2] y[2,2] y[3,2] y[1,3] y[2,3] y[3,3]
#> [1,]  1      1      2      3      4      5      6      7      8      9
#> [2,] -2      2      3      4      5      6      7      8      9     10
#> [3,] -2      2      3      4      5      6      7      8      9     10
```

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/nlist/issues).

[Pull requests](https://github.com/poissonconsulting/nlist/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](https://github.com/poissonconsulting/nlist/blob/master/CODE_OF_CONDUCT.md).
By contributing, you agree to abide by its terms
