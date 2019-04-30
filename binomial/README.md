# Overview 
`binomial` is a minimal R package package that provides functions to calculate and visualize basic information about binomial distributions.

- `bin_variable` creates a `"binvar"` object that stores the number of trials and chance of success, the 2 parameters for a binomial distribution.
- `summary()` method for a `"binvar"` object.
- `bin_cumulative`, `bin_distribution`, `bin_probability` produce dataframes containing information about a specific binomial probability distribution.
- `plot()` methods to visualize a specific binomial probability distribution.
- various other functions to compute basic statistics: `bin_choose()`, `bin_mean()`, `bin_variance()`, `bin_mode()`, `bin_skewness()`, `bin_kurtosis()`

# Motivation
This package has been developed to practice creating a simple R package and create some simple tools to visualize and compute information about binomial distributions.

# Usage
```{r}
library(binomial)


x <- bin_variable(5, 0.5)
c(x$trials, x$prob, class(x))
#> [1] "5"      "0.5"    "binvar"

x
#> "Binomial variable"
#>
#> Parameters
#> - number of trials: 5 
#> - prob of success: 0.5 

summary(x)
#> "Summary Binomial"
#>
#> Parameters
#> - number of trials: 5 
#> - prob of success : 0.5 
#>
#> Measures
#> - mean    : 2.5 
#> - variance: 1.25 
#> - mode    : 3 
#> - skewness: 0 
#> - kurtosis: -0.4 


# bin_distribution returns a dataframe of probabilities
data <- bin_distribution(x$trials, x$prob)
head(data)

# plots a barplot of the probability distribution
plot(data)


# bin_cumulative returns a dataframe of (cumulative) probabilities
data <- bin_cumulative(x$trials, x$prob)

# plots a line plot of the cdf of the binomial distribution
# with the given parameters
plot(data)


# calculates 5 choose 3
bin_choose(5, 3)

# calculates 5 choose 3, 5 choose 4
bin_choose(5, 3:4)


# calculates the probability of 3 and 4 successes out of 5 trials
# with 50% chance of success on each trial
bin_probability(3:4, 5, 0.5)

# simple statistics
bin_mean(trials=2, prob=0.5)
bin_variance(trials=2, prob=0.5)
bin_mode(trials=2, prob=0.5)
bin_skewness(trials=2, prob=0.5)
bin_kurtosis(trials=2, prob=0.5)
```
