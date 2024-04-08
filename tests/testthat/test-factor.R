describe("factor_as_numeric()", {
  it("correctly returns the numeric factor associated to the name", {
    expect_identical(
      factor_as_numeric(factor("2")),
      2
    )
  })

  it("works with vector values", {
    expect_identical(
      factor_as_numeric(factor(c("3", "2"))),
      c(3, 2)
    )
  })
})

