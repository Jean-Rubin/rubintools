#' Check that the argument is from the expected class
#'
#' Otherwise it returns an error.
#'
#' @param x Argument we want to test if it is from the correct class.
#' @param expected_class Name of the expected class.
#' @param example_constructors Example functions allowing to construct the
#'   correct class.
#'
#' @export
#'
#' @examples
#' example_fn <- function(my_value) {
#'   check_correct_class(my_value, "character", "character")
#'   my_value < "abc"
#' }
#' example_fn("1")
#' example_fn(1)
check_correct_class <- function(x, expected_class, example_constructors) {
  if(!inherits(x, expected_class)) {
    cli::cli_abort(c(
      "{.arg {rlang::caller_arg(x)}} must be a {.cls {expected_class}}, but it is a {.cls {class(x)}}",
      "i" = "{.arg {rlang::caller_arg(x)}} can for example be constructed with {.fn {example_constructors}}"
    ), call = rlang::caller_env())
  }
}

#' Check that only one element was given and belongs to a list of values
#'
#' @param x Element to check.
#' @param values List of allowed values.
#'
#' @export
#'
#' @examples
#' example_fn <- function(x) {
#'   check_match_one(x, c("a", "b", "c"))
#'   x
#' }
#' example_fn("a")
#' example_fn("d")
check_match_one <- function(x, values) {
  vctrs::vec_check_size(x, 1, arg = rlang::caller_arg(x), call = rlang::caller_env())
  rlang::arg_match0(x, values, arg_nm = rlang::caller_arg(x), error_call = rlang::caller_env())
}

#' Check that a set of value is a subset of another one
#'
#' @param x Element to check.
#' @param values List of allowed values.
#'
#' @export
#'
#' @examples
#' example_fn <- function(x) {
#'   check_subset(x, c("a", "b", "c"))
#'   x
#' }
#' example_fn(c("a", "b"))
#' example_fn(c("a", "d"))
check_subset <- function(x, values) {
  error_elems <- setdiff(x, values)
  if (length(error_elems) > 0) {
    names(values) <- rep("*", length(values))

    cli::cli_abort(c(
      "Every elements of {.arg {caller_arg(x)}} must be among: ",
      purrr::map_chr(values, \(x) paste0("{.val ", x, "}")),
      "i" = "But {.arg {caller_arg(x)}} has {.val {error_elems}}"
    ), call = rlang::caller_env())
  }
}

#' Warn about the use of default values in `arg_match()`
#'
#' @param x possible values for the missing argument. The default value
#'   corresponds to the first one.
#'
#' @export
#'
#' @examples
#' example_fn <- function(my_value = c("a", "b")) {
#'   if (missing(my_value)) { warn_missing_arg(my_value) }
#'   my_value <- rlang::arg_match(my_value)
#'   my_value
#' }
#' example_fn()
#' example_fn("a")
warn_missing_arg <- function(x) {
  cli::cli_warn(c(
    "{.arg {rlang::caller_arg(x)}} is missing, using default value : {.val {x[1]}}"
  ))
}
