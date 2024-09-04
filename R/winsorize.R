#' Winsorization of a vector of values
#'
#' @param x A vector of numerical values.
#' @param q_min Lower bound quantile.
#' @param q_max Upper bound quantile.
#'
#' @return A vector such that every value under or over the given quantile bound
#'   is clamped to the bound.
#' @export
#'
#' @examples
#' winsorize(1:10, q_min = 0.2, q_max = 0.8)
winsorize <- function(x, q_min = 0.025, q_max = 0.975) {
  x_q_bound <- quantile(x, c(q_min, q_max), na.rm = TRUE)

  pmin.int(pmax.int(x, x_q_bound[1]), x_q_bound[2])
}
