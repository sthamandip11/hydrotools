# calculate peak runoff (cubic meters per sec or cubic feet per sec) using rational method (commonly used for small watersheds)
#
# Q = (C*I*A) / K
# where,
# - C = runoff coefficient (dimensionless)   typical values of C (0-1): 0.1-0.3 for forests, 0.3-0.5 for residential, 0.7-0.95 for urban areas
# - I = rainfall intensity (mm/hr or in/hr)
# - A = drainage area (hectares for metric, acres for imperial)
# - units = metric (default) or imperial
rational_method <- function(C, I, A, units = "metric"){
  # input validation
  if (!is.numeric(C) || C < 0 || C > 1){
    stop("C must be numeric between 0 and 1")
  }
  if (!is.numeric(I) || I <= 0){
    stop("I must be a positive number")
  }
  if (!is.numeric(A) || A <= 0){
    stop("A must be a positive number")
  }
  if (!units %in% c("metric", "imperial")){
    stop("units must be either 'metric' or 'imperial'")
  }

  # calculate peak runoff
  if (units == "metric"){
    Q <- (C*I*A) / 360  # cubic meters per second (K = 360 for metric units)
  } else{
    Q <- C*I*A  # cubic feet per second (K nearly equal to 1 for imperial units)
  }

  return(Q)
}



