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
  ebird <- file %>%
    read.table(skip = 12, sep = "\t", quote = "\"", stringsAsFactors = FALSE) %>%
    select(1) %>%
    apply(1, strsplit2, " - ") %>%
    t() %>%
    data.frame2() %>%
    `names<-`(paste0(c("common", "scientific"), "_name"))
  nb <- nrow(ebird)
  cat(nb, "bird species:\n")
  ebird %>%
    mutate_at("scientific_name", italic) %>%
    mutate(sep = " (",
           eof = ")\n",
           nsp = row_number() %>%
             sprintf(paste0("%", ceiling(log10(nb)), "d"), .) %>%
             paste0(". ")) %>%
    select(nsp, common_name, sep, scientific_name, eof) %>%
    t() %>%
    as.vector() %>%
    cat(sep = "")
  invisible(ebird)
}
