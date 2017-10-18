#' to_triangle
#'
#' @importFrom magrittr %>% %<>%
#' @export
pop2mega <- function() {
  input <- file.choose()
  output <- gsub("\\..*$", "_output.txt", input)
  mat <- read.table(input)
  noms <- mat[, 1]
  mat <- as.matrix(mat[-1])
  mat[lower.tri(mat, diag = TRUE)] <- NA
  mat %<>%
    as.data.frame %>%
    lapply(na.exclude) %>%
    lapply(paste) %>%
    sapply(paste, collapse = " ") %>%
    `[`(-1) %>%
    c(paste0("#", unlist(noms)), .)
  fileConn <- file(output)
  writeLines(mat, fileConn)
  close(fileConn)
}
