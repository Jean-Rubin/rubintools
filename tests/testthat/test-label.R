test_that("recode_from_dict() works", {
  data_frame <- dplyr::tibble(
    x = c("a", "b"),
    y = c("e", "f")
  )

  dict <- list(
    x = c("a" = "A", "b" = "B", "c" = "C"),
    y = c("e" = "E", "f" = "F")
  )

  expect_identical(
    recode_from_dict(data_frame, dict),
    dplyr::tibble(
      x = c("a" = "A", "b" = "B"),
      y = c("e" = "E", "f" = "F")
    )
  )
})
