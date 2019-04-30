context("Check functions that compute basic information about the binomial distribution")

test_that("bin_cumulative succeeds with valid arguments", {
  expect_is(bin_cumulative(3, 0.5), c("bincum", "data.frame"))
  expect_equal(nrow(bin_cumulative(3, 0.5)), 4)
  expect_equal(ncol(bin_cumulative(3, 0.5)), 3)
})

test_that("bin_distribution succeeds with valid arguments", {
  expect_is(bin_distribution(3, 0.5), c("bindis", "data.frame"))
  expect_equal(nrow(bin_distribution(3, 0.5)), 4)
  expect_equal(ncol(bin_distribution(3, 0.5)), 2)
})

test_that("bin_probability succeeds with valid arguments", {
  expect_equal(bin_probability(1, 1, 0.5), 0.5)
})


test_that("bin_probability fails with invalid arguments", {
  expect_error(bin_probability(0, -1, 0.5))
  expect_error(bin_probability(0, 1.2, 0.5))
  expect_error(bin_probability(0, 2, -1))
  expect_error(bin_probability(0, 2, 1.5))
  expect_error(bin_probability(-1, 2, 1.5))
  expect_error(bin_probability(c(-1, 1, 1), 2, 1.5))
  expect_error(bin_probability(3, 2, 1.5))
  expect_error(bin_probability(c(3, 1, 1), 2, 1.5))
})

test_that("bin_choose succeeds on valid arguments", {
  expect_length(bin_choose(5, 3), 1)
  expect_equal(bin_choose(5, 3), 10)
  expect_equal(bin_choose(5, c(2, 3)), c(10, 10))
})
