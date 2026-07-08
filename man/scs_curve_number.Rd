\name{scs_curve_number}
\alias{scs_curve_number}
\title{Calculate Runoff Depth Using SCS Curve Number Method}
\description{
Estimates direct runoff depth from rainfall using USDA Natural Resources Conservation Service (NRCS) Curve Number method,
formerly known as the Soil Conservation Service (SCS) method.
}
\usage{
scs_curve_number(P, CN, Ia_ratio = 0.2, units = "metric")
}
\arguments{
\item{P}{Rainfall depth in mm (metric) or inches (imperial). The total precipitation from a storm event.}

\item{CN}{Curve Number, a dimensionless (0-100). Higher values indicate lower infiltration and higher runoff potential.
Typical values: 30-55 for forest and good vegetation cover, 60-75 for agricultural land with good management, 75-98 for urban areas and impervious surfaces.}

\item{Ia_ratio}{Initial abstraction ratio (default = 0.2). Represents the ratio of initial losses (interception, depression storage, and infiltration before runoff begin)
to the potential maximum retention.}

\item{units}{Character string specifying the unit system: "metric" (default) uses mm for rainfall and runoff depth, S = 254 * (100/CN -1);
"imperial" uses inches for rainfall and runoff depth, with S = (1000/CN -10).}
}
\value{
Direct runoff depth as a numeric value. Returns mm when units = "metric",
or inches when units = "imperial". Returns 0 if rainfall is less than or equal to the initial abstraction.
}
\examples{
# Agricultural field: 100mm rainfall, CN=70 (row crops, good condition, soil group C)
scs_curve_number(P = 100, CN = 70, units = "metric")

# Agricultural field with imperial units: 4 inches rainfall, CN=70
scs_curve_number(P = 4, CN = 70, units = "imperial")
}