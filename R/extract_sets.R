#' blablabla
#'
#' blablabla
#'
#' @keywords internal
#'
#The following function decomposes the elements of a formula:
extract_sets <- function(formula) {
  form <- strsplit(paste(formula), "~")
  set0 <- paste(form[[2]], "~")
  set1 <- strsplit(form[[3]], "\\+")[[1]]
  sel <- grep(":", set1)
  set2 <- set1[sel]
  set1 <- set1[-sel]
  list(set0, set1, set2) # set0 : y + ~, set1 : single terms, set2 : interaction terms
}
