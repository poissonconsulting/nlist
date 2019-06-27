
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

nlist is an R package to create and check numeric list objects. A
numeric list object is a list of uniquely named numeric (double or
integer) vectors, matrices and arrays. A numeric lists is the data input
for analytic engines such as JAGS, STAN and TMB.

## Installation

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/nlist)

    if(!"remotes" %in% installed.packages()[,1]) 
      install.packages("remotes")
    remotes::install_github("poissonconsulting/nlist")

To install the latest development version from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

    if(!"drat" %in% installed.packages()[,1]) 
      install.packages("drat")
    drat::addRepo("poissonconsulting")
    install.packages("nlist")

## Contribution

Please note that the ‘nlist’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
