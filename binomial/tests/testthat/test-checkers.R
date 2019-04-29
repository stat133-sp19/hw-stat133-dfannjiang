context("Check functions that validate arguments")

testthat("check_prob only fails with prob < 0 or prob > 1", {
  expect_error(check_prob(-0.1))
  expect_error(check_prob(1.1))
  expect_true(check_prob(0))
  expect_true(check_prob(1))
  expect_true(check_prob(0.5))
})

testthat("check_trials only fails when trials is negative or not an integer", {
  expect_error(check_trials(-1))
  expect_error(check_trials(1.5))
  expect_true(check_trials(0))
  expect_true(check_trials(2))
})

testthat("check_success only fails when successes are negative or greater than trials", {
  expect_error(check_success(c(-1, 2, 3), 4))
  expect_error(check_success(c(1, 3, 5), 4))
  expect_true(check_success(c(1, 2, 3), 4))
})
