#' @importFrom graphics barplot lines plot

#' @export
plot.bincum <- function(x, ...) {
  plot(x$success, x$cumulative, xlab="success", ylab="probability")
  lines(x$success, x$cumulative)
}

#' @export
plot.bindis <- function(x, ...) {
  barplot(x$probability, names.arg=x$success, xlab="successes", ylab="probability")
}
