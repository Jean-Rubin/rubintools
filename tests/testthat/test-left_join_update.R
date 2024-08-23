describe("left_join_update()", {
  it("joins tables without common non-primary columns", {
    data_frame_a <- data.frame(x = 1:2, y = c("a", "b"))
    data_frame_b <- data.frame(x = 1:2, z = c("c", "a"))
    expect_identical(
      left_join_update(data_frame_a, data_frame_b, by = "x"),
      data.frame(x = 1:2, y = c("a", "b"), z = c("c", "a"))
    )
    expect_identical(
      left_join_update(data_frame_a, data_frame_b, by = "x"),
      dplyr::left_join(data_frame_a, data_frame_b, by = "x")
    )
  })

  it("updates common non-primary columns", {
    data_frame_a <- data.frame(x = 1:2, y = c("a", "b"))
    data_frame_b <- data.frame(x = 1:2, y = c("b", "c"))

    expect_identical(
      left_join_update(data_frame_a, data_frame_b, by = "x"),
      data.frame(x = 1:2, y = c("b", "c"))
    )
  })

  it("updates common non-primary columns and adds the other", {
    data_frame_a <- data.frame(x = 1:2, y = c("a", "b"))
    data_frame_c <- data.frame(x = 1:2, y = c("b", "c"), z = c("c", "a"))

    expect_identical(
      left_join_update(data_frame_a, data_frame_c, by = "x"),
      data.frame(x = 1:2, y = c("b", "c"), z = c("c", "a"))
    )
  })
})
