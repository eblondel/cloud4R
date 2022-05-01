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

    #'@field systems one or more cloud systems
    systems = list(),

    #'@description Initialize the cloud manager
    #'@param systems one or more systems
    #'@param logger logger
    initialize = function(systems, logger = NULL){
      super$initialize(logger = logger)
      self$systems <- systems
    }

  )
)
