test_that("scs curve number validates rainfall", {
  expect_error(scs_curve_number(P = -1, CN = 70))
})

test_that("scs curve number validates CN range", {
  expect_error(scs_curve_number(P = 50, CN = -1))
  expect_error(scs_curve_number(P = 50, CN = 0))
  expect_error(scs_curve_number(P = 50, CN = 101))
})

test_that("scs curve number validates Ia_ratio range", {
  expect_error(scs_curve_number(P = 50, CN = 70, Ia_ratio = -1))
  expect_error(scs_curve_number(P = 50, CN = 70, Ia_ratio = 1.1))
})

test_that("scs curve number validates units parameter", {
  expect_error(scs_curve_number(P = 100, CN = 70, Ia_ratio = 0.2, units = "liters"))
})

test_that("scs curve number returns zero for rainfall below Ia", {
  result <- scs_curve_number(P = 1, CN = 70)
  expect_equal(result, 0)
})

test_that("scs curve number calculates correctly for metric units", {
  result <- scs_curve_number(P = 100, CN = 70, Ia_ratio = 0.2, units = "metric")
  expect_equal(result, 32.7, tolerance = 0.1)
})

test_that("scs curve number calculates correctly for imperial units", {
  result <- scs_curve_number(P = 4, CN = 70, Ia_ratio = 0.2, units = "imperial")
  expect_equal(result, 1.3, tolerance = 0.1)
})



