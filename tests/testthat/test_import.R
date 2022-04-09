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
})

test_that("zen4R works", {
	versions <- zen4R::get_versions("10.5281/zenodo.6109137")
	expect_is(versions, "data.frame")
})