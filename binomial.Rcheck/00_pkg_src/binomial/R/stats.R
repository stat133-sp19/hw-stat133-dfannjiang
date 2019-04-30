#' @title Mean of binomial distribution
#' @description Compute mean of binomial distribution with the given trials and probability parameters.
#' @param trials (numeric) the number of trials
#' @param prob (numeric) the probability of success on each trial
#' @return Mean of the binomial distribution with the given trials and probability parameters.
#' @export
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#' @title Variance of binomial distribution
#' @description Compute variance of binomial distribution with the given trials and probability parameters.
#' @param trials (numeric) the number of trials
#' @param prob (numeric) the probability of success on each trial
#' @return Variance of the binomial distribution with the given trials and probability parameters.
#' @export
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#' @title Mode of binomial distribution
#' @description Compute mode of binomial distribution with the given trials and probability parameters.
#' @param trials (numeric) the number of trials
#' @param prob (numeric) the probability of success on each trial
#' @return Mode of the binomial distribution with the given trials and probability parameters.
#' @export
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}

#' @title Skewness of binomial
#' @description Compute skewness of binomial distribution with the given trials and probability parameters.
#' @param trials (numeric) the number of trials
#' @param prob (numeric) the probability of success on each trial
#' @return Skewness of the binomial distribution with the given trials and probability parameters.
#' @export
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}

#' @title Kurtosis of binomial
#' @description Compute kurtosis of binomial distribution with the given trials and probability parameters.
#' @param trials (numeric) the number of trials
#' @param prob (numeric) the probability of success on each trial
#' @return Kurtosis of the binomial distribution with the given trials and probability parameters.
#' @export
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}

# private function to compute the mean of the given distribution.
aux_mean <- function(trials, prob) {
  return(trials*prob)
}

# private function to compute the variance of the given distribution.
aux_variance <- function(trials, prob) {
  return(trials*prob*(1-prob))
}

# private function to comptue the mode of the given distribution.
aux_mode <- function(trials, prob) {
  m <- trials*prob + prob
  if (m %% 1 == 0) {
    return(c(m - 1, m))
  }
  return(as.integer(m))
}

# private function to compute the skewness of the given distribution.
aux_skewness <- function(trials, prob) {
  num <- 1 - 2*prob
  denom <- sqrt(trials*prob*(1-prob))
  return(num / denom)
}

# private function to compute kurtosis of the given distribution.
aux_kurtosis <- function(trials, prob) {
  num <- 1 - 6*prob*(1-prob)
  denom <- trials*prob*(1-prob)
  return(num / denom)
}
