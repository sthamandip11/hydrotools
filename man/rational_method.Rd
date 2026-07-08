\name{rational_method}
\alias{rational_method}
\title{Calculate Peak Runoff Using Rational Method}
\description{
Estimates peak runoff rate from a watershed using the Rational Method (Q = CIA/K),
commonly used for small urban watersheds and drainage design.
}
\usage{
rational_method(C, I, A, units = "metric")
}
\arguments{
\item{C}{Runoff coefficient (dimensionless, 0-1). Represents the fraction of rainfall that becomes runoff.
Typical values: 0.1-0.3 for forests and grasslands, 0.3-0.5 for residential areas, 0.7-0.95 for urban and paved surfaces.
Higher values indicates less infiltration and more runoff.}

\item{I}{Rainfall intensity in mm/hr (metric units) or inch/hr (imperial units).
This should be the design storm intensity for the desired return period.}

\item{A}{Drainage area in hectares (metric units) or acres (imperial units).
The total area contributing runoff to the outlet point.}

\item{units}{Character string specifying the unit system: "metric" (default) uses mm/hr for intensity, hectares for area, and returns cubic meters per second;
"imperial" uses inch/hr for intensity, arces for area, and returns cubic feet per second.}
}
\value{
Peak runoff rate as a numeric value. Returns cubic meters per second when units = "metric",
or cubic feet per second when units = "imperial".
}
\examples{
# Urban parking lot: high runoff coefficient, 50mm/hr rainfall, 2 hectares
rational_method(C = 0.9, I = 50, A = 2, units = "metric")

# Residential area with imperial units: 2 inches/hr, 10 acres
rational_method(C = 0.4, I = 2, A = 10, units = "imperial")
}