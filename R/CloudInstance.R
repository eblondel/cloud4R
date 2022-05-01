#' CloudInstance
#' @docType class
#' @export
#' @keywords cloud system
#' @return Object of \code{\link{R6Class}} for modelling an CloudInstance
#' @format \code{\link{R6Class}} object.
#'
#' @note Main user class to be used with \pkg{cloud4R}
#'
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
CloudInstance <-  R6Class("CloudInstance",
  private = list(),
  public = list(

    #'@field id system identifier
    id = NULL,

    #'@field instance system instance
    instance = NULL,

    #'@description Initialize a cloud system
    #'@param id cloud system identifier
    #'@param ... arguments to set for the system instance
    initialize = function(id, ...){
      system <- get_cloud_system(id = id)
      if(is.null(system)){
        stop(sprintf("No cloud system supported with id '%s'", id))
      }
      self$id <- id
      instance <- try(system$handler(...))
      if(is(instance, "try-error")){
        stop(sprintf("Error during initialization of cloud instance '%s'", id))
      }
      self$instance <- instance
    },

    #'@description Get Id
    #'@return the system instance identifier
    getId = function(){
      return(self$id)
    },

    #'@description Get system instance
    #'@return the system instance
    getInstance = function(){
      return(self$instance)
    }

  )
)
