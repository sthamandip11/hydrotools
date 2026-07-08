# calculate runoff depth (mm or inches) using scs curve number method
#
# Q = (P - Ia)^2 / (P - Ia + S)
# S = 254 * (100/CN - 1)    or    S = (1000/CN - 10)
# Ia = Ia_ratio * S
# where,
# - P = rainfall depth (mm or inches)
# - CN = curve number (dimensionless)    typical values of CN (0-100): 30-55 for forests, 60-75 for agricultural, 75-98 for urban areas
# - S = potential maximum retention
# - Ia_ratio = initial abstraction ratio (default = 0.2)
# - Ia = initial abstraction
# - units = metric (default) or imperial
scs_curve_number <- function(P, CN, Ia_ratio = 0.2, units = "metric"){
  # input validation
  if (!is.numeric(P) || P < 0){
    stop("P must be a non-negative number")
  }
  if (!is.numeric(CN) || CN <= 0 || CN > 100){
    stop("CN must be numeric between 0 and 100")
  }
  if (!is.numeric(Ia_ratio)|| Ia_ratio < 0 || Ia_ratio > 1){
    stop("Ia_ratio must be numeric between 0 and 1")
  }
  if (!units %in% c("metric", "imperial")){
    stop("units must be either 'metric' or 'imperial'")
  }

  # calculate potential maximum retention
  if (units == "metric"){
    S <- 254 * (100/CN - 1)   # mm
  } else{
    S <- (1000/CN - 10)   # inches
  }

  # calculate initial abstraction
  Ia <- Ia_ratio * S

  # calculate runoff depth
  if (P <= Ia){
    Q <- 0
  } else{
    Q <- (P - Ia)^2 / (P - Ia + S)
  }

  return(Q)
}

