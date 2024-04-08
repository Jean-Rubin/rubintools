#' Format numeric values according to the number of significant digits
#'
#' The numbers will be rounded and converted to character. This allows to
#' display trailing zeros in the number.
#'
#' @param x A `numeric` vector.
#' @param digits Integer indicating the number of significant digits to be used.
#'
#' @return The formatted `numeric` vector as a `character` vector, where each
#'   number is displayed with the right amount of significant digits.
#' @export
#'
#' @examples
#' fmt_signif(21.35, 3)
#' fmt_signif(1.3, 3)
fmt_signif <- function(x, digits) {
  x |>
    signif(digits) |>
    vapply(
      \(x) sprintf(x, fmt = paste0("%#.", digits, "g")),
      character(1L)
    )
}
