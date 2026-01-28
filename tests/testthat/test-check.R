describe("check_correct_class()", {
  example_fn <- function(my_value) {
   check_correct_class(my_value, "character", "character")
   my_value < "abc"
  }

  it("returns an error if the class is incorrect", {
    expect_error(example_fn(1))
  })
  it("returns nothing if the class is correct", {
    expect_no_error(example_fn("1"))
  })
})

describe("check_match_one()", {
  example_fn <- function(x) {
   check_match_one(x, c("a", "b", "c"))
   x
  }

  it("returns an error if there is more than an element provided", {
    expect_error(example_fn(c("a", "b")))
  })
  it("returns an error if the provided element is not in the list of allowed values", {
    expect_error(example_fn("d"))
  })
  it("returns nothing if the provided element is in the list of allowed values", {
    expect_no_error(example_fn("a"))
  })
})

describe("check_subset()", {
  example_fn <- function(x) {
   check_subset(x, c("a", "b", "c"))
   x
  }

  it("returns an error if the argument is not a subset of the provided list", {
    expect_error(example_fn(c("a", "d")))
  })
  it("returns nothing if the argument is a subset of the provided list", {
    expect_no_error(example_fn(c("a", "b")))
  })
})
