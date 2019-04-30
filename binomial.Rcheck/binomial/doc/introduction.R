## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
library(binomial)

## ------------------------------------------------------------------------
x <- bin_variable(5, 0.5)
c(x$trials, x$prob, class(x))

## ------------------------------------------------------------------------
x

## ------------------------------------------------------------------------
bin_distribution(x$trials, x$prob)

## ------------------------------------------------------------------------
plot(bin_distribution(x$trials, x$prob))

## ------------------------------------------------------------------------
bin_cumulative(x$trials, x$prob)

## ------------------------------------------------------------------------
plot(bin_cumulative(x$trials, x$prob))

## ------------------------------------------------------------------------
summary(x)

## ------------------------------------------------------------------------
# calculates 5 choose 3
bin_choose(5, 3)

# calculates 5 choose 3, 5 choose 4
bin_choose(5, 3:4)

## ------------------------------------------------------------------------
# calculates the probability of 3 and 4 successes out of 5 trials
# with 50% chance of success on each trial
bin_probability(3:4, 5, 0.5)

## ------------------------------------------------------------------------
# simple statistics
bin_mean(trials=2, prob=0.5)
bin_variance(trials=2, prob=0.5)
bin_mode(trials=2, prob=0.5)
bin_skewness(trials=2, prob=0.5)
bin_kurtosis(trials=2, prob=0.5)

