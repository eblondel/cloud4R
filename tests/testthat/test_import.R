# test_import.R
# Author: Emmanuel Blondel <emmanuel.blondel1@gmail.com>
#
# Description: Unit tests for imports
#=======================
require(cloud4R, quietly = TRUE)
require(testthat)

test_that("atom4R works",{
	classes <- atom4R::getAtomClasses()
	expect_true(length(classes)>0)
	clazz <- atom4R::DCElement$getClassByElement("creator")
	expect_is(clazz, "R6ClassGenerator")
	dcentry <- atom4R::DCEntry$new()
	dcentry$addDCCreator("someone")
	xml <- dcentry$encode()
	expect_is(xml, "XMLInternalNode")
})

test_that("zen4R works",{
	versions <- zen4R::get_versions("10.5281/zenodo.6109137")
	expect_is(versions, "data.frame")
})

test_that("ocs4R works",{
  OCS <- ocs4R::ocsManager
  expect_is(OCS, "R6ClassGenerator")
})
