# test_CloudSystem.R
# Author: Emmanuel Blondel <emmanuel.blondel1@gmail.com>
#
# Description: Unit tests for CloudSystem
#=======================
require(cloud4R, quietly = TRUE)
require(testthat)

test_that("cloud systems can be listed",{
  systems <- list_cloud_systems()
  expect_is(systems, "list")
  expect_true(all(sapply(systems, function(system){is(system, "CloudSystem")})))
  systems <- list_cloud_systems(pretty = TRUE)
  expect_is(systems, "tbl_df")
})

test_that("Zenodo cloud system can be fetched",{
  zenodo_system <- get_cloud_system(id = "zenodo")
  expect_is(zenodo_system, "CloudSystem")
  expect_is(zenodo_system$getHandler(), "R6ClassGenerator")
  expect_equal(zenodo_system$getHandler()$classname, "ZenodoManager")
})
