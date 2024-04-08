#' Add context inside of tests name
#'
#' This is particularly useful when using expectations inside of a loop.
#'
#' @param desc Basic test name or description of the feature.
#' @param ... Variables that should be added as context of the test.
#'
#' @return An enriched description with variables values.
#' @export
#'
#' @examples
#' vars <- list(x = 5, y = 2)
#' z <- 3
#' "addition gives only positive values" |> add_context(vars, my_z = z)
add_context <- function(desc, ...) {
  kwargs_quo <- rlang::enquos(...)
  kwargs <- list(...)
  no_names <- setdiff(seq_along(kwargs), which(names(kwargs) == ""))
  names(kwargs)[no_names] <- purrr::map_chr(kwargs_quo[no_names], rlang::quo_name)
  kwargs[] <- purrr::map(
    kwargs,
    \(x) capture.output(lobstr::tree(x)) |>
      paste0(collapse = "\n")
  )

  paste0(
    desc, ":\n",
    purrr::imap_chr(
      kwargs,
      \(arg, name) paste0("- ", name, " = ", arg)
    ) |> paste0(collapse = "\n")
  )
}
