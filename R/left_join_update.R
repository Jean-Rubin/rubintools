#' Left join with column update
#'
#' It applies a left join and update columns already existing inside the
#' first table by the values of columns in the second table.
#'
#' @param x First data frame.
#' @param y Second data frame.
#' @param by Vector of columns to join by.
#' @param ... Additionnal parameters.
#'
#' @return A data frame with the left join and column update applied.
left_join_update <- function(x, y, by = NULL, ...) {
  reduced_names <- c(by, names(x)[!names(x) %in% names(y)])
  dplyr::left_join(dplyr::select(x, dplyr::all_of(reduced_names)), y, by = by, ...)
}
