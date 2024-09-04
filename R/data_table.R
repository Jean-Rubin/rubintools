# Awareness of data.table in the package
.datatable.aware <- TRUE

# List of function statistics
func_list <- list(
  "q_02.5" = \(x) quantile(x, 0.025, na.rm = TRUE),
  "q_10" = \(x) quantile(x, 0.1, na.rm = TRUE),
  "q_25" = \(x) quantile(x, 0.25, na.rm = TRUE),
  "q_50" = \(x) median(x, na.rm = TRUE),
  "median" = \(x) median(x, na.rm = TRUE),
  "mean" = \(x) mean(x, na.rm = TRUE),
  "q_75" = \(x) quantile(x, 0.75, na.rm = TRUE),
  "q_90" = \(x) quantile(x, 0.9, na.rm = TRUE),
  "q_97.5" = \(x) quantile(x, 0.975, na.rm = TRUE)
)

#' Compute statistics by groups on a data.table, placed in tidy format
#'
#' @param dt A `data.table` object
#' @param cols Column names to compute stats
#' @param func_map A named list of statistical functions to apply, names of the list will
#'   appear in the `statistics` column.
#' @param groups Column names to group statistics
#'
#' @return A `data.table` object containing:
#'   - `{groups}` The groups.
#'   - `statistics` Name of the statistic.
#'   - `variable` Name of the variable.
#'   - `value` Name of the associated value.
#' @export
#'
#' @examples
#' dt_example <- data.table::data.table(
#'   x = c(1, 1, 1, 1, 2, 2, 2, 2),
#'   y = c(1, 2, 3, 4, 5, 6, 7, 8),
#'   g = c("a", "a", "a", "a", "b", "b", "b", "b"),
#'   w = c("c", "c", "d", "d", "c", "c", "d", "d")
#' )
#' dt_tidy_statistics(dt_example, c("x", "y"), c("g", "w"), list("mean" = mean))
dt_tidy_statistics <- function(dt, cols, groups, func_map) {
  dt_stats_by_groups <- dt[
    , lapply(.SD, \(x) lapply(func_map, \(f) f(x))),
    by = groups,
    .SDcols = cols
  ][, statistics := names(func_map), by = groups]

  data.table::melt(
    dt_stats_by_groups,
    id.vars = c(groups, "statistics")
  )[, value := as.numeric(value)]
}
