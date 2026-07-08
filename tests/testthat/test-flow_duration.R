test_that("flow duration validates input", {
  expect_error(flow_duration("not numeric"))   # Non-numeric
  expect_error(flow_duration(c()))   # Empty vector
  expect_error(flow_duration(c(-10, 10, 20)))    # Negative flow
})

test_that("flow duration validates percentiles", {
  flows <- 1:10
  expect_error(flow_duration(flows, percentiles = "not numeric"))
  expect_error(flow_duration(flows, percentiles = c(-10, 50)))
  expect_error(flow_duration(flows, percentiles = c(50, 110)))
})

test_that("flow duration handles NA values", {
  flows <- c(10, NA, 30, NA, 50)
  result <- flow_duration(flows)           # flow_duration() function return a list
  expect_equal(result$n_observations, 3)   # n_observations = length(flow_clean)
})

test_that("flow duration calculates basic statistics correctly", {
  flows <- c(10, 20, 30, 40, 50)
  result <- flow_duration(flows, percentiles = c(50))
  expect_equal(result$mean_flow, 30)
  expect_equal(result$median_flow, 30)
  expect_equal(result$n_observations, 5)
})

test_that("flow duration counts zero flow days", {
  flows <- c(10, 0, 0, 0, 50)
  result <- flow_duration(flows)
  expect_equal(result$zero_flow_days, 3)    # zero_flow_days = sum(flow_clean == 0)
})






