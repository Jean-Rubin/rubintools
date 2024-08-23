#' Change vector values using a data dictionary
#'
#' @param dataframe Data frame.
#' @param dict Data dictionary in the form of a list of named vectors. Each item
#'   of the list corresponds to the dictionary of a variable. Names of the list
#'   should match the name of the variables in the data frame.
#'
#' @return A data frame where the values of variables inside the data dictionary
#'   are modified accordingly.
#' @export
#'
#' @examples
#' dict <- list(
#'   x = c("a" = "A", "b" = "B", "c" = "C"),
#'   y = c("d" = "D", "e" = "E", "f" = "F")
#' )
#' df_ex <- data.frame(
#'   x = c("a", "b"),
#'   y = c("d", "e")
#' )
#'
#' recode_from_dict(df_ex, dict)
recode_from_dict <- function(dataframe, dict) {
  dataframe |>
    dplyr::mutate(dplyr::across(
      dplyr::all_of(names(dict)),
      \(x) .env$dict[[dplyr::cur_column()]][x]
    ))
}


#' Modify plot labels using a data dictionary
#'
#' In general it is better to use human readable labels in plots, but changing
#' the name of the column variables
#'
#' @param plot `ggplot` Object.
#' @param dict Data dictionary in the form of a named `character` vector.
#'
#' @return A relabeled `ggplot` object.
#' @export
#'
#' @examples
#' dict <- c("my_x" = "X name", "my_y" = "Y name", "my_c" = "Attribute")
#' df_ex <- data.frame(
#'  my_x = c(1, 2, 3),
#'  my_y = c(4, 5, 6),
#'  my_c = c("a", "a", "b")
#' )
#' my_plot <- ggplot2::ggplot(
#'  df_ex,
#'  ggplot2::aes(x = my_x, y = my_y, color = my_c)
#' ) +
#' ggplot2::geom_point()
#'
#' labs_dict(my_plot, dict)
labs_dict <- function(plot, dict) {
  plot$labels <- purrr::map(plot$labels, \(aesthetic) {
    value <- dict[aesthetic]
    if (is.na(value)) aesthetic else value
  })

  plot
}
