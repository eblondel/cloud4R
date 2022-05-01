# test_CloudManager.R
# Author: Emmanuel Blondel <emmanuel.blondel1@gmail.com>
#
# Description: Unit tests for CloudManager
require(cloud4R, quietly = TRUE)
require(testthat)

test_that("a cloud manager can be instantiated",{
  cloud <- CloudManager$new(logger = "INFO")
  expect_is(cloud, "CloudManager")
})

test_that("a cloud manager can be instantiated, with cloud instances",{
  cloud <- CloudManager$new(
    CloudSystemInstance$new(id = "zenodo-prod", refid = "zenodo"),
    CloudSystemInstance$new(id = "zenodo-sandbox", refid = "zenodo", url = "https://sandbox.zenodo.org/api"),
    logger = "INFO"
  )
  expect_is(cloud, "CloudManager")
})
