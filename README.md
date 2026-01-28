
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

### Memory usage

``` r
library(rubintools)
x <- 1:20
y <- list(a = x)
z <- rep(x, 4)

memory_ls()
#>           z           x           y 
#> "368 bytes" "856 bytes"    "1.1 Kb"
```

``` r

memory_total()
#> [1] "1.5 Kb"
```

### Data table manipulation

``` r
dt_example <- data.table::data.table(
  x = c(1, 1, 1, 1, 2, 2, 2, 2),
  y = c(1, 2, 3, 4, 5, 6, 7, 8),
  g = c("a", "a", "a", "a", "b", "b", "b", "b"),
  w = c("c", "c", "d", "d", "c", "c", "d", "d")
)
print(dt_example)
#>        x     y      g      w
#>    <num> <num> <char> <char>
#> 1:     1     1      a      c
#> 2:     1     2      a      c
#> 3:     1     3      a      d
#> 4:     1     4      a      d
#> 5:     2     5      b      c
#> 6:     2     6      b      c
#> 7:     2     7      b      d
#> 8:     2     8      b      d
```

``` r

dt_tidy <- dt_tidy_statistics(dt_example, c("x", "y"), c("g", "w"), list("mean" = mean))
print(dt_tidy)
#>         g      w statistics variable value
#>    <char> <char>     <char>   <fctr> <num>
#> 1:      a      c       mean        x   1.0
#> 2:      a      d       mean        x   1.0
#> 3:      b      c       mean        x   2.0
#> 4:      b      d       mean        x   2.0
#> 5:      a      c       mean        y   1.5
#> 6:      a      d       mean        y   3.5
#> 7:      b      c       mean        y   5.5
#> 8:      b      d       mean        y   7.5
```

### Formatting number

``` r
fmt_signif(21.35, 3)
#> [1] "21.4"
```

``` r

fmt_signif(1.3, 3)
#> [1] "1.30"
```

### Factor manipulation

``` r
factor_as_numeric(factor(c("3", "1", "10")))
#> [1]  3  1 10
```

``` r

create_factor(
 "a" = "A",
 "b" = "B"
)
#> a b 
#> A B 
#> Levels: A B
```

### Data dictionnary and labels

``` r
dict <- list(
  x = c("a" = "A", "b" = "B", "c" = "C"),
  y = c("d" = "D", "e" = "E", "f" = "F")
)
df_ex <- data.frame(
  x = c("a", "b"),
  y = c("d", "e")
)
recode_from_dict(df_ex, dict)
#>   x y
#> 1 A D
#> 2 B E
```
