#' CloudSystemInstance
#' @docType class
#' @export
#' @keywords cloud system
#' @return Object of \code{\link{R6Class}} for modelling an CloudSystemInstance
#' @format \code{\link{R6Class}} object.
#'
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
CloudSystemInstance <-  R6Class("CloudSystemInstance",
  private = list(),
  public = list(

    #'@field id system identifier
    id = NULL,

    #'@field refid system reference identifier
    refid = NULL,

    #'@field instance system instance
    instance = NULL,

    #'@description Initialize a cloud system instance
    #'@param id instance identifier
    #'@param refid cloud system reference identifier
    #'@param ... arguments to set for the system instance
    initialize = function(id, refid, ...){
      self$id <- id
      system <- get_cloud_system(id = refid)
      if(is.null(system)){
        stop(sprintf("No cloud system supported with refid '%s'", refid))
      }
      self$refid <- refid
      instance <- NULL
      if(is(system$handler, "function")){
        instance <- try(system$handler(...))
      }else if(is(system$handler, "R6ClassGenerator")){
        instance <- try(system$handler$new(...))
      }
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
