
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nlist <img src="man/figures/logo.png" align="right" alt="nlist logo"/>

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![R-CMD-check](https://github.com/poissonconsulting/nlist/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/poissonconsulting/nlist/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/nlist/graph/badge.svg)](https://app.codecov.io/gh/poissonconsulting/nlist)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/license/mit)
[![CRAN
status](https://www.r-pkg.org/badges/version/nlist)](https://cran.r-project.org/package=nlist)
![CRAN downloads](https://cranlogs.r-pkg.org/badges/nlist)
<!-- badges: end -->

`nlist` is an R package to create and manipulate numeric list (`nlist`)
objects.

An `nlist` is an S3 class list of uniquely named numeric objects. An
numeric object is an integer or double vector, matrix or array. `nlist`
objects are the raw data inputs for analytic engines such as JAGS, STAN
and TMB.

An `nlists` object is a S3 class list of `nlist` objects with the same
names, dimensionalities and typeofs. `nlists` objects are useful for
storing multiple realizations of simulated data sets. They can be
converted to `coda::mcmc` and `coda::mcmc.list` objects.

## Demonstration

### `numeric`

An numeric object is an integer or double vector, matrix or array.

``` r
library(nlist)
is.numeric(1L)
#> [1] TRUE
is.numeric(matrix(1:3))
#> [1] TRUE
```

### `nlist`

An `nlist` is an S3 class list of uniquely named numeric objects.

It is straightforward to create an new `nlist` object.

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
#> an nlist object with 2 numeric elements
```

### `nlists`

An `nlists` object is a S3 class list of `nlist` objects with the same
names, dimensionalities and typeofs.

The nchains attribute is used to keep track of the number of chains.

``` r
nlists <- nlists(
  nlist(x = 1, y = matrix(1:9, 3)),
  nlist(x = -2, y = matrix(2:10, 3)),
  nlist(x = 10, y = matrix(22:30, 3)),
  nlist(x = -100, y = matrix(-2:-10, 3))
)

print(nlists)
#> $x
#> [1] -0.5
#> 
#> $y
#>      [,1] [,2] [,3]
#> [1,]  1.5  4.5  7.5
#> [2,]  2.5  5.5  8.5
#> [3,]  3.5  6.5  9.5
#> 
#> an nlists object of 4 nlist objects each with 2 numeric elements
```

### Coercion

#### nlist

A data.frame can be coerced to an `nlist` object

``` r
data <- data.frame(
  lgl = c(TRUE, NA),
  dte = as.Date(c("2001-01-02", "2001-01-01")),
  fac = factor(c("b", "a"))
)

as_nlist(data)
#> $lgl
#> [1]  1 NA
#> 
#> $dte
#> [1] 11324 11323
#> 
#> $fac
#> [1] 2 1
#> 
#> an nlist object with 3 numeric elements
```

And an `nlist` objects can be converted to an `mcmc` or `term_frame`
objects (and converted back again)

``` r
as_mcmc(nlist)
#> Markov Chain Monte Carlo (MCMC) output:
#> Start = 1 
#> End = 1 
#> Thinning interval = 1 
#>      x y[1,1] y[2,1] y[3,1] y[1,2] y[2,2] y[3,2] y[1,3] y[2,3] y[3,3]
#> [1,] 1      1      2      3      4      5      6      7      8      9
as_term_frame(nlist)
#>      term value
#> 1       x     1
#> 2  y[1,1]     1
#> 3  y[2,1]     2
#> 4  y[3,1]     3
#> 5  y[1,2]     4
#> 6  y[2,2]     5
#> 7  y[3,2]     6
#> 8  y[1,3]     7
#> 9  y[2,3]     8
#> 10 y[3,3]     9
```

#### nlists

The `estimates()` function can be used to aggregate an `nlists` object
to an `nlist` object.

``` r
estimates(nlists, fun = mean)
#> $x
#> [1] -22.75
#> 
#> $y
#>      [,1] [,2] [,3]
#> [1,] 5.75 7.25 8.75
#> [2,] 6.25 7.75 9.25
#> [3,] 6.75 8.25 9.75
#> 
#> an nlist object with 2 numeric elements
```

while the `tidy()` function treats the values as if they are MCMC
samples and summarises the terms as a tidy tibble.

``` r
tidy(nlists, simplify = TRUE)
#> # A tibble: 10 × 5
#>    term   estimate  lower upper svalue
#>    <term>    <dbl>  <dbl> <dbl>  <dbl>
#>  1 x          -0.5 -92.6   9.32  0    
#>  2 y[1,1]      1.5  -1.77 20.5   0.737
#>  3 y[2,1]      2.5  -2.62 21.5   0.737
#>  4 y[3,1]      3.5  -3.47 22.5   0.737
#>  5 y[1,2]      4.5  -4.32 23.5   0.737
#>  6 y[2,2]      5.5  -5.17 24.5   0.737
#>  7 y[3,2]      6.5  -6.02 25.5   0.737
#>  8 y[1,3]      7.5  -6.87 26.5   0.737
#>  9 y[2,3]      8.5  -7.72 27.5   0.737
#> 10 y[3,3]      9.5  -8.57 28.5   0.737
```

An `nlists` object can be converted to an `mcmc.list` object and a
`term_frame`.

``` r
as_mcmc_list(nlists)
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
#>      term sample value
#> 1       x      1     1
#> 2  y[1,1]      1     1
#> 3  y[2,1]      1     2
#> 4  y[3,1]      1     3
#> 5  y[1,2]      1     4
#> 6  y[2,2]      1     5
#> 7  y[3,2]      1     6
#> 8  y[1,3]      1     7
#> 9  y[2,3]      1     8
#> 10 y[3,3]      1     9
#> 11      x      2    -2
#> 12 y[1,1]      2     2
#> 13 y[2,1]      2     3
#> 14 y[3,1]      2     4
#> 15 y[1,2]      2     5
#> 16 y[2,2]      2     6
#> 17 y[3,2]      2     7
#> 18 y[1,3]      2     8
#> 19 y[2,3]      2     9
#> 20 y[3,3]      2    10
#> 21      x      3    10
#> 22 y[1,1]      3    22
#> 23 y[2,1]      3    23
#> 24 y[3,1]      3    24
#> 25 y[1,2]      3    25
#> 26 y[2,2]      3    26
#> 27 y[3,2]      3    27
#> 28 y[1,3]      3    28
#> 29 y[2,3]      3    29
#> 30 y[3,3]      3    30
#> 31      x      4  -100
#> 32 y[1,1]      4    -2
#> 33 y[2,1]      4    -3
#> 34 y[3,1]      4    -4
#> 35 y[1,2]      4    -5
#> 36 y[2,2]      4    -6
#> 37 y[3,2]      4    -7
#> 38 y[1,3]      4    -8
#> 39 y[2,3]      4    -9
#> 40 y[3,3]      4   -10
```

An `nlists` object can have its chains split or collapsed.

``` r
split_chains(nlists)
#> $x
#> [1] -0.5
#> 
#> $y
#>      [,1] [,2] [,3]
#> [1,]  1.5  4.5  7.5
#> [2,]  2.5  5.5  8.5
#> [3,]  3.5  6.5  9.5
#> 
#> an nlists object with 2 chains of 2 nlist objects each with 2 numeric elements
```

## Installation

### Release

To install the release version from
[CRAN](https://CRAN.R-project.org/package=nlist).

``` r
install.packages("nlist")
```

The website for the release version is at
<https://poissonconsulting.github.io/nlist/>.

### Development

To install the development version from
[GitHub](https://github.com/poissonconsulting/nlist)

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/nlist")
```

or from [r-universe](https://poissonconsulting.r-universe.dev/nlist).

``` r
install.packages("nlist", repos = c("https://poissonconsulting.r-universe.dev", "https://cloud.r-project.org"))
```

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/nlist/issues).

[Pull requests](https://github.com/poissonconsulting/nlist/pulls) are
always welcome.

## Code of Conduct

Please note that the nlist project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
