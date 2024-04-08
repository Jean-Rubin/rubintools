#' Convert factor object with a numerical name to its numeric value
#'
#' The naive approach of doing `as.numeric()` on a factor will not consider the
#' names of the levels. The purpose of this function is to use them instead of
#' the underlying numeric structure of the factor.
#'
#' @param x A factor, whose levels correspond to `numeric` values.
#'
#' @return A vector of type `numeric`.
#' @export
#'
#' @examples
#' factor_as_numeric(factor(c("3", "1", "10")))
factor_as_numeric <- function(x) {
  as.numeric(as.character(x))
}

#' Create a factor from key value pairs
#'
#' Note that if your name-value pairs were already stored as a vector `x`, you
#' could simply create it with `factor(x, levels = x)`. This is just some
#' syntactic sugar over this approach.
#'
#' @param ... A list of name-value pairs.
#'
#' @return A factor
#' @export
#'
#' @examples
#' create_factor(
#'   "a" = "A",
#'   "b" = "B"
#' )
create_factor <- function(...) {
  args <- unlist(list(...))

  factor(args, levels = args)
}
