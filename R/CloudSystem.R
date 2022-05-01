#' CloudSystem
#' @docType class
#' @export
#' @keywords cloud system
#' @return Object of \code{\link{R6Class}} for modelling an CloudSystem
#' @format \code{\link{R6Class}} object.
#'
#' @note Main user class to be used with \pkg{cloud4R}
#'
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
CloudSystem <-  R6Class("CloudSystem",
 private = list(),
 public = list(

   #'@field id system identifier
   id = NULL,

   #'@field handler system handler
   handler = NULL,

   #'@description Initialize a cloud system
   #'@param id cloud system identifier
   #'@param handler cloud system function handler
   initialize = function(id, handler){
     self$id <- id
     self$handler <- handler
   },

   #'@description Get Id
   #'@return the system identifier
   getId = function(){
     return(self$id)
   },

   #'@description Get system handler
   #'@return the system handler
   getHandler = function(){
     return(self$handler)
   }

 )
)

#' @name list_cloud_systems
#' @aliases list_cloud_systems
#' @title list_cloud_systems
#' @description \code{list_cloud_systems} lists the available cloud systems currently managed in \pkg{cloud4R}
#' @return the list of supported cloud systems
#' @export
list_cloud_systems <- function(){
  systems <- list(
    CloudSystem$new(id = "sword", handler = atom4R::SwordClient),
    CloudSystem$new(id = "sword-dataverse", handler = atom4R::SwordDataverseClient),
    CloudSystem$new(id = "zenodo", handler = zen4R::ZenodoManager),
    CloudSystem$new(id = "ocs", handler = ocs4R::ocsManager),
    CloudSystem$new(id = "owncloud", handler = ocs4R::ocsManager),
    CloudSystem$new(id = "nextcloud", handler = ocs4R::ocsManager),
    CloudSystem$new(id = "d4science", handler = d4storagehub4R::StoragehubManager)
  )
  return(systems)
}
