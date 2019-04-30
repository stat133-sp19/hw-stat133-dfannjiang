context("Check functions that validate arguments")

test_that("check_prob only fails with prob < 0 or prob > 1", {
  expect_error(check_prob(-0.1))
  expect_error(check_prob(1.1))
})

test_that("check_prob succeeds with valid arguments", {
  expect_true(check_prob(0))
  expect_true(check_prob(1))
  expect_true(check_prob(0.5))
})

test_that("check_trials fails when trials is not an integer", {
  expect_error(check_trials(3.5))
})

test_that("check_trials fails when trials is negative", {
  expect_error(check_trials(-1))
})

test_that("check_trials succeeds with valid arguments", {
  expect_true(check_trials(0))
  expect_true(check_trials(2))
})

test_that("check_success fails when successes are negative", {
  expect_error(check_success(c(-1, 2, 3), 4))
})

test_that("check_success fails when successes are greater than trials", {
  expect_error(check_success(c(1, 3, 5), 4))
})

test_that("check_success succeeds with one argument for success", {
  expect_true(check_success(4, 5))
})

test_that("check_success succeeds with multiple arguments for success", {
  expect_true(check_success(c(1, 2, 3), 4))
})
