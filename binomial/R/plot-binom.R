#' @export
plot.bincum <- function(dist, ...) {
  plot(dist$success, dist$cumulative, xlab="success", y="probability")
}

#' @export
plot.bindis <- function(dist, ...) {
  barplot(dist$success, dist$probability, xlab="successes", ylab="probability")
}
