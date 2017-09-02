mat2NAsepvec <- function(mat, margin = 2) {
  if(margin < 2) mat <- t(mat)
  vec <- as.vector(rbind(mat, NA))
  vec[-length(vec)]
}
