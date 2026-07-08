test_that("rational method validates C coefficient", {
  expect_error(rational_method(C = -0.6, I = 30, A = 10))
  expect_error(rational_method(C = 1.2, I = 30, A = 10))
})

test_that("rational method validates intensity", {
  expect_error(rational_method(C = 0.6, I = -30, A = 10))
  expect_error(rational_method(C = 0.6, I = 0, A = 10))
})

test_that("rational method validates area", {
  expect_error(rational_method(C = 0.6, I = 30, A = -10))
  expect_error(rational_method(C = 0.6, I = 30, A = 0))
})

test_that("rational method validates units parameter", {
  expect_error(rational_method(C = 0.6, I = 30, A = 10, units = "liters"))
})

test_that("rational method calculates correctly for metric units", {
  result <- rational_method(C = 0.9, I = 50, A = 2, units = "metric")
  expected <- (0.9*50*2) / 360
  expect_equal(result, expected)
})

test_that("rational method calculates correctly for imperial units", {
  result <- rational_method(C = 0.4, I = 2, A = 10, units = "imperial")
  expected <- 0.4*2*10
  expect_equal(result, expected)
})

