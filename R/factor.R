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
factor_as_numeric <- function(x) {
  as.numeric(as.character(x))
}
