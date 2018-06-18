#' Print bird list from eBird report
#'
#' The eBird report should be generated from the
#' "My eBird" > "Summarize My Observations" and then "Download this report".
#' The report in question should be a tabulation-separated text file named
#' "eBirdReports.xls".
#'
#' @export
#'
#' @author Marc Choisy
#'
birdlist <- function(file = "~/Desktop/eBirdReports.xls") {
  ebird <- read.table(file, skip = 12, sep = "\t")
  ebird <- paste(gsub("\t.*\t", "", ebird[, 1], perl = T), collapse = "\n")
  cat(length(strsplit(ebird, "\n")[[1]]), "bird species:\n")
  cat(ebird)
}
