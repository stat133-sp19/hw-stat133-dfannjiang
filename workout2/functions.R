future_value <- function(amount, rate, years) {
  return(amount*(1+rate)^years)
}

annuity <- function(contrib, rate, years) {
  if (rate == 0) {
    return(contrib*years)
  }
  return(contrib*((1 + rate)^years - 1) / rate)
}

growing_annuity <- function(contrib, rate, growth, years) {
  if (rate == growth) {
    return(contrib * (1 + years) / (1 + rate))
  }
  return(contrib*((1 + rate)^years - (1 + growth)^years) / (rate - growth))
}
