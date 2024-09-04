describe("dt_tidy_statistics()", {
  it("works on basic example", {
    dt_example <- data.table::data.table(
       x = c(1, 1, 1, 1, 2, 2, 2, 2),
       y = c(1, 3, 2, 4, 5, 7, 6, 8),
       g = c("a", "a", "a", "a", "b", "b", "b", "b"),
       w = c("c", "c", "d", "d", "c", "c", "d", "d")
    )
    dt_tidy <- dt_tidy_statistics(dt_example, c("x", "y"), c("g", "w"), list("mean" = mean))
    expect_snapshot_value(as.data.frame(dt_tidy), style = "deparse")
  })
})
