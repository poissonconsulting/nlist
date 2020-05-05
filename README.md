---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->


# nlist

<!-- badges: start -->
[![Lifecycle: maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![R build status](https://github.com/poissonconsulting/nlist/workflows/R-CMD-check/badge.svg)](https://github.com/poissonconsulting/nlist/actions)
[![Codecov test coverage](https://codecov.io/gh/poissonconsulting/nlist/branch/master/graph/badge.svg)](https://codecov.io/gh/poissonconsulting/nlist?branch=master)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Tinyverse status](https://tinyverse.netlify.com/badge/nlist)](https://CRAN.R-project.org/package=nlist)
[![CRAN status](https://www.r-pkg.org/badges/version/nlist)](https://cran.r-project.org/package=nlist)
![CRAN downloads](http://cranlogs.r-pkg.org/badges/nlist)
<!-- badges: end -->

nlist is an R package to create and manipulate numeric list (nlist) objects.

An nlist is an S3 class list of uniquely named numeric atomic (natomic) objects.
An natomic object is an integer or double vector, matrix or array.
nlist objects are the raw data inputs for analytic engines such as JAGS, STAN and TMB.

An nlists object is a S3 class list of nlist objects with the same names, dimensionalities and typeofs.
nlists objects are useful for storing multiple realizations of simulated data sets.
They can be converted to `coda::mcmc` and  `coda::mcmc.list` objects.

## Installation

To install the latest release from [CRAN](https://cran.r-project.org)

```r
install.packages("nlist")
```

To install the developmental version from [GitHub](https://github.com/poissonconsulting/nlist)

```r
# install.packages("remotes")
remotes::install_github("poissonconsulting/nlist")
```


## Demonstration

### `natomic`

An natomic object is an integer or double vector, matrix or array.


```r
library(nlist)
#> Warning: package 'nlist' was built under R version 3.6.3
is_natomic(TRUE)
#> Error in is_natomic(TRUE): could not find function "is_natomic"
is_natomic(1L)
#> Error in is_natomic(1L): could not find function "is_natomic"
is_natomic(matrix(1:3))
#> Error in is_natomic(matrix(1:3)): could not find function "is_natomic"
```

### `nlist`

An nlist is an S3 class list of uniquely named numeric atomic (natomic) objects.

It is straightforward to create an new nlist object.

```r
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

### `nlists`

An nlists object is a S3 class list of nlist objects with the same names, dimensionalities and typeofs.

The nchains attribute is used to keep track of the number of chains.


```r
nlists <- nlists(
  nlist(x = 1, y = matrix(1:9, 3)),
  nlist(x = -2, y = matrix(2:10, 3)),
  nlist(x = 10, y = matrix(22:30, 3)),
  nlist(x = -100, y = matrix(-2:-10, 3))
)

print(nlists)
#> $x
#> [1] -22.75
#> 
#> $y
#>      [,1] [,2] [,3]
#> [1,] 5.75 7.25 8.75
#> [2,] 6.25 7.75 9.25
#> [3,] 6.75 8.25 9.75
#> 
#> an nlists object of 4 nlist objects each with 2 natomic elements
```

### Coercion

#### nlist

A data.frame can be coerced to an nlist object

```r
data <- data.frame(
  lgl = c(TRUE, NA),
  dte = as.Date(c("2001-01-02", "2001-01-01")),
  fac = factor(c("b", "a"))
)

as_nlist(data)
#> Error in as_nlist(data): could not find function "as_nlist"
```

And an `nlist` objects can be converted to an `mcmc` or `term_frame` objects (and converted back again)

```r
as.mcmc(nlist)
#> Error in as.mcmc(nlist): could not find function "as.mcmc"
as_term_frame(nlist)
#> Error in as_term_frame(nlist): could not find function "as_term_frame"
```

#### nlists

The `estimates()` function can be used to aggregate an `nlists` object to an `nlist` object.

```r
estimates(nlists, fun = mean)
#> Error in estimates(nlists, fun = mean): could not find function "estimates"
```

while the `tidy()` function treats the values as if they are MCMC samples
and summarises the terms as a tidy tibble.

```r
tidy(nlists)
#> Error in tidy(nlists): could not find function "tidy"
```


An nlists object can be converted to an mcmc.list object and a term_frame.

```r
coda::as.mcmc.list(nlists)
#> [[1]]
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 4 
#> Thinning interval = 1 
#>         x y[1,1] y[2,1] y[3,1] y[1,2] y[2,2] y[3,2] y[1,3] y[2,3] y[3,3]
#> [1,]    1      1      2      3      4      5      6      7      8      9
#> [2,]   -2      2      3      4      5      6      7      8      9     10
#> [3,]   10     22     23     24     25     26     27     28     29     30
#> [4,] -100     -2     -3     -4     -5     -6     -7     -8     -9    -10
#> 
#> attr(,"class")
#> [1] "mcmc.list"
as_term_frame(nlists)
#> Error in as_term_frame(nlists): could not find function "as_term_frame"
```

An nlists object can have its chains split or collapsed.

```r
nlists <- split_chains(nlists)
```

## Contribution

Please report any [issues](https://github.com/poissonconsulting/nlist/issues).

[Pull requests](https://github.com/poissonconsulting/nlist/pulls) are always welcome.

Please note that this project is released with a [Contributor Code of Conduct](https://github.com/poissonconsulting/nlist/blob/master/CODE_OF_CONDUCT.md).
By contributing, you agree to abide by its terms.
