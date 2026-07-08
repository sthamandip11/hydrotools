# calculate flow duration statistics
#
# flow duration curves show the percentage of time that flow exceeds a given value.
# - Q10: High flow (exceeded 10% of time)
# - Q50: Median flow
# - Q90: Low flow (exceeded 90% of time)
flow_duration <- function(flow, percentiles = c(1, 5, 10, 25, 50, 75, 90, 95, 99)){
  # input validation
  if (!is.numeric(flow)){
    stop("flow must be a numeric vector")
  }
  if (length(flow) == 0){
    stop("flow vector cannot be empty")
  }
  if (any(flow < 0, na.rm = TRUE)){
    stop("flow values cannot be negative")
  }
  if (!is.numeric(percentiles) || any(percentiles < 0) || any(percentiles > 100)){
    stop("percentiles must be numeric values between 0 and 100")
  }

  # remove NA values
  flow_clean <- flow[!is.na(flow)]

  if (length(flow_clean) == 0){
    stop("No valid flow values after removing NAs")
  }

  # calculate percentile flows (using exceedance probabilities)
  # convert percentiles to quantile probabilities
  probs <- 1 - percentiles/100
  percentile_flows <- quantile(flow_clean, probs = probs, names = FALSE)
  names(percentile_flows) <- paste0("Q", percentiles)

  # calculate summary statistics
  result <- list(
    percentile_flows = percentile_flows,
    mean_flow = mean(flow_clean),
    median_flow = median(flow_clean),
    n_observations = length(flow_clean),
    zero_flow_days = sum(flow_clean == 0)
  )

  return(result)
}



