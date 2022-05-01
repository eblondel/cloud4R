#' CloudManager
#' @docType class
#' @export
#' @keywords cloud manager
#' @return Object of \code{\link{R6Class}} for modelling an CloudManager
#' @format \code{\link{R6Class}} object.
#'
#' @note Main user class to be used with \pkg{cloud4R}
#'
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
CloudManager <-  R6Class("CloudManager",
  inherit = cloud4RLogger,
  private = list(),
  public = list(

    #'@field system_instances one or more cloud systems
    system_instances = list(),

    #'@description Initialize the cloud manager
    #'@param ... one or more system instances, objects of class \link{CloudSystemInstance}
    #'@param logger logger
    initialize = function(..., logger = NULL){
      super$initialize(logger = logger)
      self$system_instances <- list(...)
    },

    #'@description Get system instances
    #'@return a list of objects of class \link{CloudSystemInstance}
    getSystemInstances = function(){
      return(self$system_instances)
    }

  )
)
