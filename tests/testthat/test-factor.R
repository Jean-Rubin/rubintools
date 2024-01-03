test_that("factor_as_numeric() works", {
  expect_identical(
    factor_as_numeric(factor("2")),
    2
  )

  expect_identical(
    factor_as_numeric(factor(c("3", "2"))),
    c(3, 2)
  )
})
