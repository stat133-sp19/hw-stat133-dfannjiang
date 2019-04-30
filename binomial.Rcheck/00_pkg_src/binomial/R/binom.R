#' @title Binomial random variable object
#' @description Creates an object of class \code{"binvar"}
#' @param trials (numeric) the number of trials
#' @param prob (numeric) the probability of success on each trial
#' @return An object of class \code{"binvar"}
#' @export
#' @examples
#' # a binomial random variable with 20 trials and a 45% chance of success on each trial
#' bin_variable(20, 0.45)
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)

  object <- list(
    trials = trials,
    prob = prob)
  class(object) <- "binvar"
  return(object)
}

#' @title Binomial probability distribution with cumulative probabilities
#' @description Compute the full binomial probability distribution (with cumulative probabilities) given by trial and probability parameters.
#' @param trials (numeric) the number of trials
#' @param prob (numeric) the probability of success on each trial
#' @return A dataframe describing the full binomial probability distribution (with cumulative probabilities) given by the trial and probability parameters.
#' @export
#' @examples
#' # binomial probability distribution (with cumulative probabilities)
#' # using 20 trials and 45% chance of success on each trial
#' bin_cumulative(20, 0.45)
bin_cumulative <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)

  out <- bin_distribution(trials, prob)
  out$cumulative <- cumsum(out$probability)
  class(out) <- c("bincum", "data.frame")
  return(out)
}

#' @title Binomial probability distribution
#' @description Computes the full binomial probability distribution given by the trial and probability parameters.
#' @param trials (numeric) the number of trials
#' @param prob (numeric) the probability of success on each trial
#' @return A dataframe describing the the full binomial probability distribution given by the trial and probability parameters.
#' @export
#' @examples
#' # binomial probability distribution with 20 trials and 45% chance of success on each trial
#' bin_distribution(20, 0.45)
bin_distribution <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)

  out <- data.frame(
    success = 0:trials,
    probability = bin_probability(0:trials, trials, prob)
  )
  class(out) <- c("bindis", "data.frame")
  return(out)
}

#' @title Probability of successes in a number of trials
#' @description Computes the probability that number(s) of successes happen in a certain number of trials.
#' @param success (numeric) the number of successes (can be a vector)
#' @param trials (numeric) the number of trials
#' @param prob (numeric) the probability of success on each trial
#' @return The probability that number(s) of successes happen in a certain number of trials.
#' @export
#' @examples
#' # one success - probability of 3 successes in 5 trials
#' # with 50% chance of success on each trial
#' bin_probability(3, 5, 0.5)
#'
#' # multiple successes - probability of 3, 4 successes in 5 trials
#' # with 50% chance of success on each trial
#' bin_probability(3:4, 5, 0.5)
bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)

  return(bin_choose(trials, success) * (prob^success) * ((1 - prob)^(trials - success)))
}

#' @title Combinations of k successes in n trials
#' @description Computes the number of combinations in which k succceses can occur in n trials.
#' @param n (numeric) - the number of trials
#' @param k (numeric) - the number of successes (can be a vector)
#' @return The number of combinations of k successes in n trials.
#' @export
#' @examples
#' # one success - 5 choose 3
#' bin_choose(5, 3)
#'
#' # multiple successes - 5 choose 1, 2, 3
#' bin_choose(5, 1:3)
bin_choose <- function(n, k) {
  check_trials(n)
  check_success(k, n)

  num <- factorial(n)
  denom <- factorial(k)*factorial(n - k)
  return(num / denom)
}

# private function to verify that the number of successes is valid.
check_success <- function(success, trials) {
  check_trials(trials)

  if (sum(success %% 1 != 0) > 0) {
    stop("successes must be integers")
  }
  if (sum(success < 0) > 0) {
    stop("successes must be non-negative")
  }
  if (sum(success > trials) > 0) {
    stop("successes must be less than or equal to number of trials")
  }
  return(TRUE)
}

# private function to check if probability is valid
check_prob <- function(prob) {
  if (length(prob) != 1) {
    stop("probability must be length 1")
  }
  if (!is.numeric(prob)) {
    stop("probability must be numeric")
  }
  if (prob < 0 || prob > 1) {
    stop("probability must be between 0 and 1")
  }
  return(TRUE)
}

# private function to verify that the number of trials is valid.
check_trials <- function(trials) {
  if (length(trials) != 1) {
    stop("trials must be length 1")
  }
  if (trials %% 1 != 0) {
    stop("number of trials must be an integer")
  }
  if (trials < 0) {
    stop("number of trials must be non-negative")
  }
  return(TRUE)
}

#' @export
print.binvar <- function(x, ...) {
  cat('"Binomial variable"\n\n')
  cat("Parameters\n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success:", x$prob, "\n")
}

#' @export
summary.binvar <- function(object, ...) {
  out <- list(
    trials = object$trials,
    prob = object$prob,
    mean = aux_mean(object$trials, object$prob),
    variance = aux_variance(object$trials, object$prob),
    mode = aux_mode(object$trials, object$prob),
    skewness = aux_skewness(object$trials, object$prob),
    kurtosis = aux_kurtosis(object$trials, object$prob)
  )
  class(out) <- "summary.binvar"
  return(out)
}

#' @export
print.summary.binvar <- function(x, ...) {
  cat('"Summary Binomial"\n\n')
  cat("Parameters\n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success :", x$prob, "\n\n")
  cat("Measures\n")
  cat("- mean    :", x$mean, "\n")
  cat("- variance:", x$variance, "\n")
  cat("- mode    :", x$mode, "\n")
  cat("- skewness:", x$skewness, "\n")
  cat("- kurtosis:", x$kurtosis, "\n")
  invisible(x)
}
