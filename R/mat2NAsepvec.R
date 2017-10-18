#' blabla
#'
#' @export
#'
#The following function converts a matrix to NA-separated vector where the NA
#value separate either rows (`margin = 1`) or columns (`margin = 2`):
mat2NAsepvec <- function(mat, margin = 2) {
  if(margin < 2) mat <- t(mat)
  vec <- as.vector(rbind(mat, NA))
  vec[-length(vec)]
}
