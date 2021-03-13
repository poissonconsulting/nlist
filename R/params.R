#' Parameter Descriptions
#'
#' @param x An object.
#' @param nthin A positive integer of the thinning rate.
#' @param ... Unused.
#' @param flesh An atomic vector
#' @param skeleton An nlist object.
#' @param scalar A logical scalar specifying whether to include
#' all parameters (NULL), only scalars (TRUE) or all parameters
#' except scalars (FALSE).
#' @param terms A flag specifying whether to return the parameter name
#' for each term element.
#' @param chains An integer vector of chains.
#' @param iters An integer vector of iterations.
#' @param pars A character vector of parameter names.
#' @param fun A function that given a numeric vector returns a numeric scalar.
#' @param nas A flag specifying whether to also fill missing values.
#' @param parameters A character vector (or NULL) of the parameters to subset by.
#' @param iterations An integer vector (or NULL) of the iterations to subset by.
#' @param simplify A flag specifying whether to drop sd and zscore columns.
#' @param silent A flag specifying whether to suppress warning messages.
#' @param by_chain A flag specifying whether to aggregate by chains.
#' @keywords internal
#' @name params
NULL
