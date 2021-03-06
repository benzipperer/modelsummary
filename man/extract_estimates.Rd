% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract_estimates.R
\name{extract_estimates}
\alias{extract_estimates}
\title{Extract estimates and statistics from a single model}
\usage{
extract_estimates(
  model,
  statistic = "std.error",
  statistic_override = NULL,
  statistic_vertical = TRUE,
  conf_level = 0.95,
  fmt = "\%.3f",
  stars = FALSE,
  estimate = "estimate",
  ...
)
}
\arguments{
\item{model}{object type with an available `tidy` method.}

\item{statistic}{string name of the statistic to include in parentheses
\itemize{
  \item Typical values: "conf.int", "std.error", "statistic", "p.value"
  \item Alternative values: any column name produced by `broom::tidy(model)`
}}

\item{statistic_override}{manually override the uncertainy estimates. This
argument accepts three types of input:
\itemize{
  \item a function or list of functions of length(models) which produce variance-covariance matrices with row and column names equal to the names of your coefficient estimates. For example, `R` supplies the `vcov` function, and the `sandwich` package supplies `vcovHC`, `vcovHAC`, etc.
  \item a list of length(models) variance-covariance matrices with row and column names equal to the names of your coefficient estimates.
  \item a list of length(models) vectors with names equal to the names of your coefficient estimates. Numeric vectors are formatted according to `fmt` and placed in brackets, character vectors printed as given.
}}

\item{statistic_vertical}{TRUE if statistics should be printed below
estimates. FALSE if statistics should be printed beside estimates.}

\item{conf_level}{confidence level to use for confidence intervals}

\item{fmt}{an integer, string, or function which determines how to format numeric values:
\itemize{
  \item integer: the number of digits to keep after the period (`format(round(x, fmt), nsmall=fmt)`)
  \item character: string is passed to the `sprintf` function. '\%.3f' will keep 3 digits after the decimal point with trailing zero. '\%.5f' will keep 5 digits. '\%.3e' will use exponential notation. See `?sprintf` for more options.
  \item function: a function which returns a formatted character string
}}

\item{stars}{to indicate statistical significance
\itemize{
  \item FALSE (default): no significance stars.
  \item TRUE: *=.1, **=.05, ***=.01
  \item Named numeric vector for custom stars such as `c('*' = .1, '+' = .05)`
}}

\item{estimate}{character name of the estimate to display. Must be a column
name in the data.frame produced by `tidy(model)`. In the vast majority of
cases, the default value of this argument should not be changed.}

\item{...}{all other arguments are passed to the `tidy` and `glance` methods
used to extract estimates from the model. For example, this allows users to
set `exponentiate=TRUE` to exponentiate logistic regression coefficients.}
}
\value{
data.frame with side-by-side model summaries
}
\description{
Extract estimates and statistics from a single model
}
\keyword{internal}
