#' Display the sorted sizes of objects in current environment
#'
#' @param env Environment to inspect.
#'
#' @param units Units to be used in formatting and printing the size.
#'   Allowed values are `"b"`, `"Kb"`, `"Mb"`, `"Gb"`, `"Tb"`, `"Pb"`,
#'   `"B"`, `"KB"`, `"MB"`, `"GB"`, `"TB"`, `"PB"`,
#'   `"KiB"`, `"MiB"`, `"GiB"`, `"TiB"`, `"PiB"`, `"Eib"`, `"Zib"`, `"Yib"`.
#'   It is also possible to select `units = "auto"`.
#'
#' @export
ls_memory <- function(env = parent.frame(n = 1L), units = "auto") {
  ls(env) |>
    vapply(
      \(x) utils::object.size(get(x, envir = env)),
      numeric(1L)
    ) |>
    sort() |>
    vapply(
      \(x) format(structure(x, class = "object_size"), units = units),
      character(1L)
    )
}

#' Display the total size used by the current environment
#'
#' @inheritParams ls_memory
#'
#' @export
total_memory <- function(env = parent.frame(n = 1L), units = "auto") {
  ls(env) |>
    vapply(
      \(x) utils::object.size(get(x, envir = env)),
      numeric(1L)
    ) |>
    sum() |>
    structure(class = "object_size") |>
    format(units = units)
}
