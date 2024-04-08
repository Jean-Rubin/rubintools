describe("fmt_signif()", {
  it("correctly formats numbers", {
    expect_identical(fmt_signif(21.35, 3), "21.4")
  })
  it("correctly add trailing zeros", {
    expect_identical(fmt_signif(1.3, 3), "1.30")
  })

  set.seed(123)
  for (iter in 1:100) {
    vect_num <- 1e4 * runif(10)
    for (digit in 1:5) {
      it("correctly formats vectors of numbers" |> add_context(vect_num, digit), {
        expect_identical(
          fmt_signif(vect_num, digit),
          vapply(vect_num, \(x) fmt_signif(x, digit), character(1L))
        )
      })
    }
  }
})
