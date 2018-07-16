#' Print bird list from eBird report
#'
#' The eBird report should be generated from the
#' "My eBird" > "Summarize My Observations" and then "Download this report".
#' The report in question should be a tabulation-separated text file named
#' "eBirdReports.xls".
#'
#' @importFrom crayon italic
#' @importFrom magrittr %>%
#' @export
#'
#' @author Marc Choisy
#'
birdlist <- function(file = "~/Desktop/eBirdReports.xls") {
  data.frame2 <- function(...) data.frame(..., stringsAsFactors = FALSE)
  ebird <- read.table(file, skip = 12, sep = "\t", quote = "\"", stringsAsFactors = FALSE)[[1]]
  cat(length(ebird), "bird species:\n")
  ebird %<>% sapply(strsplit2, " - ")
  ebird %>%
    data.frame2() %>%
    lapply(function(x) cat(x[1], "-",  italic(x[2]), "\n"))
  ebird %>%
    t() %>%
    `rownames<-`(NULL) %>%
    data.frame2() %>%
    `names<-`(paste0(c("common", "scientific"), "_name")) %>%
    invisible()
}
