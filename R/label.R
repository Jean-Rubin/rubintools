label_from_dict <- function(dataframe, dict) {
  dataframe |>
    dplyr::mutate(dplyr::across(
      dplyr::all_of(names(dict)),
      \(x) .env$dict[[dplyr::cur_column()]][x]
    ))
}

