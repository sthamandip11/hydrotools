\name{flow_duration}
\alias{flow_duration}
\title{Calculate Flow Duration Statistics}
\description{
Computes flow duration curve statistics from a time series of streamflow data.
A flow duration curve shows the percentage of time that streamflow equals or exceeds specific values.
}
\usage{
flow_duration(flow, percentiles = c(1, 5, 10, 25, 50, 75, 90, 95, 99))
}
\arguments{
\item{flow}{Numeric vector of streamflow values. Can be daily, monthly, or any consistent time interval.
Units can be cubic meters per second, cubic feet per second, or any consistent flow measurement.
Missing values (NA) are automatically removed before analysis.}

\item{percentiles}{Numeric vector of percentiles to calculate, ranging from 0 to 100.
Default includes key exceedance percentiiles. Note Q10 represents the flow exceeded 10 percent of the time (high flow),
Q50 is the median flow, and Q90 is the flow exceeded 90 percent of the time (low flow).}
}
\value{
A list containing the following components:

\item{percentile_flows}{Named numeric vector of flow values at the specified percentiles.}

\item{mean_flow}{Mean flow over the entire period.}

\item{median_flow}{Median flow, equivalent to Q50 in flow duration terminology.}

\item{n_observations}{Number of valid observations used in the analysis after removing missing values.}

\item{zero_flow_days}{Count of observations where flow was exactly zero, indicating intermittent or ephemeral stream behavior.}
}
\examples{
# 12 months of streamflow data (cubic meters per second)
flows <- c(15, 12, 8, 6, 4, 3, 2, 1.5, 1, 0.8, 0.6, 0.5)
result <- flow_duration(flows)
result

# Access specific components
result$percentile_flows
result$mean_flow
result$n_observations
result$zero_flow_days
}