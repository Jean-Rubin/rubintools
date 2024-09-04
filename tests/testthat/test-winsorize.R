describe("winsorize()", {
  it("does not modify values inside quantile bounds", {
    expect_equal(
      winsorize(1:10, q_min = 0.2, q_max = 0.8)[3:7],
      3:7
    )

    for(i in 1:20) {
      x <- sort(rnorm(10))
      expect_equal(
        winsorize(x, q_min = 0.2, q_max = 0.8)[3:7],
        x[3:7]
      )
    }
  })

  it("will give values greater than the quantile lower bounds", {
    expect_true(
      all(winsorize(1:10, q_min = 0.2) >= 2)
    )

    for(i in 1:20) {
      x <- sort(rnorm(10))
      all(winsorize(x, q_min = 0.2) >= x[2])
    }
  })

  it("will give values lower than the quantile upper bounds", {
    expect_true(
      all(winsorize(1:10, q_max = 0.8) <= 9)
    )

    for(i in 1:20) {
      x <- sort(rnorm(10))
      all(winsorize(x, q_max = 0.8) <= x[9])
    }
  })
})
