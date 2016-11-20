#' Element-wise sum of matrices
#'
#' \code{matSum} returns the element-wise sum of matrices.
#'
#' The matrices should have the same dimensions.
#'
#' @param ... numeric matrices of the same dimension.
#' @param na.rm logical. Should missing values (including NaN) be removed?
#' @export
#' @author Marc Choisy
#' @examples
#' (a <- matrix(sample(30),6))
#' (b <- matrix(sample(30),6))
#' matSum(a,b)
matSum <- function(...,na.rm=F) {
  matlist <- list(...)
  if(nrow(unique(t(sapply(matlist,dim))))>1)
    stop("The matrices should have the same dimensions")
  fct <- function(x,matlist,...) {
    rowSums(data.frame(lapply(matlist,`[`,x,)),...)
  }
  sapply(1:nrow(matlist[[1]]),fct,matlist,na.rm=na.rm)
}
