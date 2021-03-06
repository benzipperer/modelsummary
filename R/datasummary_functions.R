
#' datasummary statistic shortcut
#' @export
#' @keywords internal
Mean <- function(x, fmt = NULL, na.rm = TRUE, ...) {
  out <- mean(x, na.rm = na.rm)
  if (!is.null(fmt)) {
    out <- rounding(out, fmt)
  }
  return(out)
}

#' datasummary statistic shortcut
#' @export
#' @keywords internal
Median <- function(x, fmt = NULL, na.rm = TRUE, ...) {
  out <- stats::median(x, na.rm = na.rm)
  if (!is.null(fmt)) {
    out <- rounding(out, fmt)
  }
  return(out)
}

#' datasummary statistic shortcut
#' @export
#' @keywords internal
Min <- function(x, fmt = NULL, na.rm = TRUE, ...) {
  out <- min(x, na.rm = na.rm)
  if (!is.null(fmt)) {
    out <- rounding(out, fmt)
  }
  return(out)
}

#' datasummary statistic shortcut
#' @export
#' @keywords internal
Max <- function(x, fmt = NULL, na.rm = TRUE, ...) {
  out <- max(x, na.rm = na.rm)
  if (!is.null(fmt)) {
    out <- rounding(out, fmt)
  }
  return(out)
}

#' datasummary statistic shortcut
#' @export
#' @keywords internal
SD <- function(x, fmt = NULL, na.rm = TRUE, ...) {
  out <- stats::sd(x, na.rm = na.rm)
  if (!is.null(fmt)) {
    out <- rounding(out, fmt)
  }
  return(out)
}

#' datasummary statistic shortcut
#' @export
#' @keywords internal
Var <- function(x, fmt = NULL, na.rm = TRUE, ...) {
  out <- stats::var(x, na.rm = na.rm)
  if (!is.null(fmt)) {
    out <- rounding(out, fmt)
  }
  return(out)
}

#' datasummary statistic shortcut
#' @export
#' @keywords internal
Ncol <- function(x, ...)
  paste0('(N = ', length(x), ')')

#' datasummary statistic shortcut
#' @export
#' @keywords internal
NPercent <- function(x, y) {
  pct <- round(100 * length(x) / length(y))
  n <- length(x)
  if (n == 0) {
    out <- '.'
  } else {
    out <- paste0(n, ' (', pct, '%)')
  }
  return(out)
}

#' datasummary statistic shortcut
#' @export
#' @keywords internal
NUnique <- function(x, ...) sprintf("%.0f", length(unique(x)))


#' datasummary statistic shortcut
#' @export
#' @keywords internal
P0 <- function(x, fmt = NULL, na.rm = TRUE, ...) {
  out <- stats::quantile(x, prob = 0, na.rm = na.rm)
  if (!is.null(fmt)) {
    out <- rounding(out, fmt)
  }
  return(out)
}

#' datasummary statistic shortcut
#' @export
#' @keywords internal
P25 <- function(x, fmt = NULL, na.rm = TRUE, ...) {
  out <- stats::quantile(x, prob = 0.25, na.rm = na.rm)
  if (!is.null(fmt)) {
    out <- rounding(out, fmt)
  }
  return(out)
}

#' datasummary statistic shortcut
#' @export
#' @keywords internal
P50 <- function(x, fmt = NULL, na.rm = TRUE, ...) {
  out <- stats::quantile(x, prob = 0.50, na.rm = na.rm)
  if (!is.null(fmt)) {
    out <- rounding(out, fmt)
  }
  return(out)
}

#' datasummary statistic shortcut
#' @export
#' @keywords internal
P75 <- function(x, fmt = NULL, na.rm = TRUE, ...) {
  out <- stats::quantile(x, prob = 0.75, na.rm = na.rm)
  if (!is.null(fmt)) {
    out <- rounding(out, fmt)
  }
  return(out)
}

#' datasummary statistic shortcut
#' @export
#' @keywords internal
P100 <- function(x, fmt = NULL, na.rm = TRUE, ...) {
  out <- stats::quantile(x, prob = 1, na.rm = na.rm)
  if (!is.null(fmt)) {
    out <- rounding(out, fmt)
  }
  return(out)
}

#' datasummary statistic shortcut
#' @export
#' @keywords internal
PercentMissing <- function(x) {
  sprintf("%.0f", mean(is.na(x)) * 100)
}

#' datasummary statistic shortcut
#'
#' This function uses Unicode characters to create a histogram. This can
#' sometimes be useful, but is generally discouraged. Unicode characters can
#' only display a limited number of heights for bars, and the accuracy of
#' output is highly dependent on the platform (typeface, output type, windows
#' vs. mac, etc.). We recommend you use the `kableExtra::spec_hist` function
#' instead.
#'
#' @export
#' @keywords internal
Histogram <- function(x, bins = 10) {
  # ticks <- c(" ", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█")
  ticks <- c(" ", "\u2581", "\u2582", "\u2583", "\u2584", "\u2585", "\u2586", "\u2587", "\u2588")
  ticks_values <- seq(0, 1, length.out = length(ticks))
  barheight <- cut(x, breaks = bins, labels = FALSE)
  barheight <- table(barheight)
  barheight <- barheight / max(barheight) * 7 + 1
  barheight <- round(barheight)
  bars <- ticks[barheight]
  out <- paste(bars, collapse = '')
  return(out)
}
