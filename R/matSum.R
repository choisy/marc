#' Element-wise sum of matrices
#'
#' \code{matSum} returns the element-wise sum of matrices.
#'
#' The matrices should have the same dimensions.
#'
#' @param ... numeric matrices of the same dimensions or a list of matrices of
#' same dimensions.
#' @param na.rm logical. Should missing values (including NaN) be removed?
#' @export
#' @author Marc Choisy
#' @examples
#' (a <- matrix(sample(30),6))
#' (b <- matrix(sample(30),6))
#' matSum(a,b)
matSum <- function(...,na.rm=F) {
  matList <- list(...)
  if(is.list(matList[[1]])) {
    if(length(matList) > 1)
      warning("Only the first list of matrices is considered")
    matList <- matList[[1]]
  }
  if(nrow(unique(t(sapply(matList,dim))))>1)
    stop("The matrices should have the same dimensions")
  fct <- function(x,matlist,...) {
    rowSums(data.frame(lapply(matlist,`[`,x,)),...)
  }
  sapply(1:nrow(matList[[1]]),fct,matList,na.rm=na.rm)
}
