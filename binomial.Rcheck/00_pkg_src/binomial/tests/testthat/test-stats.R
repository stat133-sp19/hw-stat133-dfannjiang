context("Check functions that compute statistics about the binomial distribution")

test_that("bin_mean succeeds on valid arguments", {
  expect_length(aux_mean(3, 0.5), 1)
  expect_equal(aux_mean(3, 0.5), 1.5)
  expect_equal(aux_mean(3, 0), 0)
})

test_that("bin_variance succeeds on valid arguments", {
  expect_length(aux_variance(3, 0.5), 1)
  expect_equal(aux_variance(3, 0.5), 0.75)
  expect_equal(aux_variance(3, 1), 0)
})

test_that("bin_mode succeeds on valid arguments", {
  expect_length(aux_mode(3, 0.5), 2)
  expect_equal(aux_mode(3, 0.5), c(1, 2))
  expect_equal(aux_mode(4, 0.5), 2)
})

test_that("bin_skewness succeeds on valid arguments", {
  expect_length(aux_skewness(3, 0.25), 1)
  expect_equal(aux_skewness(3, 0.25), (1 - 2*0.25) / (sqrt(3*0.25*0.75)))
  expect_equal(aux_skewness(3, 1), -Inf)
})

test_that("bin_kurtosis succeeds on valid arguments", {
  expect_length(aux_kurtosis(3, 0.25), 1)
  expect_equal(aux_kurtosis(3, 0.25), (1 - 6*0.25*0.75) / (3*0.25*0.75))
  expect_equal(aux_kurtosis(3, 1), Inf)
})


