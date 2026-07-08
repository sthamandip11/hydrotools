# HydroTools

**HydroTools** is a simple R package for basic hydrological analysis. It provides functions for runoff estimation and flow duration analysis using commonly used hydrological methods.

This package was developed as an independent learning project to practice R package development, hydrological computation, documentation, and unit testing in R.

## Features

HydroTools currently includes three main functions:

| Function | Description |
|---|---|
| `rational_method()` | Estimates peak runoff discharge using the Rational Method |
| `scs_curve_number()` | Calculates direct runoff depth using the SCS Curve Number method |
| `flow_duration()` | Computes flow duration statistics from streamflow data |

## Installation

You can install the package from GitHub using:

```r
install.packages("devtools")
devtools::install_github("sthamandip11/hydrotools")
```

After installation, load the package:

```r
library(hydrotools)
```

## Usage

### 1. Rational Method

The Rational Method estimates peak runoff discharge from rainfall intensity, drainage area, and runoff coefficient.

```r
Q <- rational_method(
  C = 0.9,
  I = 50,
  A = 2,
  units = "metric"
)

Q
```

Where:

- `C` = runoff coefficient
- `I` = rainfall intensity
- `A` = drainage area
- `units` = `"metric"` or `"imperial"`

For metric units, the result is returned in cubic meters per second.

### 2. SCS Curve Number Method

The SCS Curve Number method estimates direct runoff depth from rainfall depth and curve number.

```r
Q <- scs_curve_number(
  P = 100,
  CN = 70,
  Ia_ratio = 0.2,
  units = "metric"
)

Q
```

Where:

- `P` = rainfall depth
- `CN` = curve number
- `Ia_ratio` = initial abstraction ratio
- `units` = `"metric"` or `"imperial"`

For metric units, the runoff depth is returned in millimeters.

### 3. Flow Duration Statistics

The `flow_duration()` function calculates selected flow duration values and basic streamflow statistics.

```r
flows <- c(10, 20, 30, 40, 50)

result <- flow_duration(
  flow = flows,
  percentiles = c(10, 50, 90)
)

result
```

The output includes:

- percentile flow values such as `Q10`, `Q50`, and `Q90`
- mean flow
- median flow
- number of valid observations
- number of zero-flow days

## Testing

Unit tests are written using the `testthat` package.

To run the tests:

```r
devtools::test()
```

To run a full package check:

```r
devtools::check()
```

## Project Structure

```text
hydrotools/
├── R/
│   ├── flow_duration.R
│   ├── rational_method.R
│   └── scs_curve_number.R
├── man/
│   ├── flow_duration.Rd
│   ├── rational_method.Rd
│   └── scs_curve_number.Rd
├── tests/
│   ├── testthat/
│   │   ├── test-flow_duration.R
│   │   ├── test-rational_method.R
│   │   └── test-scs_curve_number.R
│   └── testthat.R
├── DESCRIPTION
├── LICENSE
├── NAMESPACE
└── README.md
```

## Limitations

This package is intended for basic hydrological calculations and learning purposes. It does not perform advanced rainfall-runoff modeling, flood forecasting, watershed simulation, model calibration, or uncertainty analysis.

The methods included are simplified hydrological methods and should be applied carefully with proper understanding of watershed conditions, input data quality, watershed characteristics, and method assumptions.

## Demo Video

A short demonstration video is available here:

https://youtu.be/D9FD6ATOmzs

## License

This project is licensed under the MIT License.

## Author

Mandip Shrestha
