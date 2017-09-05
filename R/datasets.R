#' blablabla
#'
#' blablabla
#'
#' @export
# returns a character vector containing the names of the datasets in package
# 'pkg'
datasets <- function(pkg) {
  data(package = pkg)$results[, "Item"]
}
