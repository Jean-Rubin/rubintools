
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rubintools

<!-- badges: start -->

<!-- badges: end -->

rubintools is a personal collection of helper functions.

## Installation

You can install the development version of rubintools like so:

``` r
# install.packages("devtools")
devtools::install_github("Jean-Rubin/rubintools")
```

## Example

Here are some example of functions you can use

``` r
library(rubintools)
## basic example code
x <- 1:20
y <- list(a = x)
z <- rep(x, 4)

ls_memory()
#>           z           x           y 
#> "368 bytes" "856 bytes"    "1.1 Kb"

total_memory()
#> [1] "1.5 Kb"
```
