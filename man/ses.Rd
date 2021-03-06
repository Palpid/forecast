% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/HoltWintersNew.R
\name{ses}
\alias{ses}
\alias{holt}
\alias{hw}
\title{Exponential smoothing forecasts}
\usage{
ses(y, h = 10, level = c(80, 95), fan = FALSE,
  initial = c("optimal", "simple"), alpha = NULL, lambda = NULL,
  biasadj = FALSE, x = y, ...)

holt(y, h = 10, damped = FALSE, level = c(80, 95), fan = FALSE,
  initial = c("optimal", "simple"), exponential = FALSE,
  alpha = NULL, beta = NULL, phi = NULL, lambda = NULL,
  biasadj = FALSE, x = y, ...)

hw(y, h = 2 * frequency(x), seasonal = c("additive", "multiplicative"),
  damped = FALSE, level = c(80, 95), fan = FALSE,
  initial = c("optimal", "simple"), exponential = FALSE,
  alpha = NULL, beta = NULL, gamma = NULL, phi = NULL,
  lambda = NULL, biasadj = FALSE, x = y, ...)
}
\arguments{
\item{y}{a numeric vector or time series of class \code{ts}}

\item{h}{Number of periods for forecasting.}

\item{level}{Confidence level for prediction intervals.}

\item{fan}{If TRUE, level is set to seq(51,99,by=3). This is suitable for
fan plots.}

\item{initial}{Method used for selecting initial state values. If
\code{optimal}, the initial values are optimized along with the smoothing
parameters using \code{\link{ets}}. If \code{simple}, the initial values are
set to values obtained using simple calculations on the first few
observations. See Hyndman & Athanasopoulos (2014) for details.}

\item{alpha}{Value of smoothing parameter for the level. If \code{NULL}, it
will be estimated.}

\item{lambda}{Box-Cox transformation parameter. If \code{lambda="auto"},
then a transformation is automatically selected using \code{BoxCox.lambda}.
The transformation is ignored if NULL. Otherwise,
data transformed before model is estimated.}

\item{biasadj}{Use adjusted back-transformed mean for Box-Cox
transformations. If transformed data is used to produce forecasts and fitted values,
a regular back transformation will result in median forecasts. If biasadj is TRUE,
an adjustment will be made to produce mean forecasts and fitted values.}

\item{x}{Deprecated. Included for backwards compatibility.}

\item{...}{Other arguments passed to \code{forecast.ets}.}

\item{damped}{If TRUE, use a damped trend.}

\item{exponential}{If TRUE, an exponential trend is fitted. Otherwise, the
trend is (locally) linear.}

\item{beta}{Value of smoothing parameter for the trend. If \code{NULL}, it
will be estimated.}

\item{phi}{Value of damping parameter if \code{damped=TRUE}. If \code{NULL},
it will be estimated.}

\item{seasonal}{Type of seasonality in \code{hw} model. "additive" or
"multiplicative"}

\item{gamma}{Value of smoothing parameter for the seasonal component. If
\code{NULL}, it will be estimated.}
}
\value{
An object of class "\code{forecast}".

The function \code{summary} is used to obtain and print a summary of the
results, while the function \code{plot} produces a plot of the forecasts and
prediction intervals.

The generic accessor functions \code{fitted.values} and \code{residuals}
extract useful features of the value returned by \code{ets} and associated
functions.

An object of class \code{"forecast"} is a list containing at least the
following elements: \item{model}{A list containing information about the
fitted model} \item{method}{The name of the forecasting method as a
character string} \item{mean}{Point forecasts as a time series}
\item{lower}{Lower limits for prediction intervals} \item{upper}{Upper
limits for prediction intervals} \item{level}{The confidence values
associated with the prediction intervals} \item{x}{The original time series
(either \code{object} itself or the time series used to create the model
stored as \code{object}).} \item{residuals}{Residuals from the fitted
model.} \item{fitted}{Fitted values (one-step forecasts)}
}
\description{
Returns forecasts and other information for exponential smoothing forecasts
applied to \code{y}.
}
\details{
ses, holt and hw are simply convenient wrapper functions for
\code{forecast(ets(...))}.
}
\examples{

fcast <- holt(airmiles)
plot(fcast)
deaths.fcast <- hw(USAccDeaths,h=48)
plot(deaths.fcast)

}
\references{
Hyndman, R.J., Koehler, A.B., Ord, J.K., Snyder, R.D. (2008)
\emph{Forecasting with exponential smoothing: the state space approach},
Springer-Verlag: New York. \url{http://www.exponentialsmoothing.net}.

Hyndman and Athanasopoulos (2018) \emph{Forecasting: principles
and practice}, 2nd edition, OTexts: Melbourne, Australia.
\url{https://OTexts.org/fpp2/}
}
\seealso{
\code{\link{ets}}, \code{\link[stats]{HoltWinters}},
\code{\link{rwf}}, \code{\link[stats]{arima}}.
}
\author{
Rob J Hyndman
}
\keyword{ts}
