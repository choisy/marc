#' Calculates incidence from line listing
#'
#' Calculates daily, weekly or monthly incidence from line listing.
#'
#' @param \code{x} a vector of dates of cases
#' @param \code{unit} a character string ("day", "week", "month") specifying the
#' temporal aggregation wished for the incidence calculation.
#' @importFrom magrittr %>%
#' @importFrom magrittr %<>%
#' @importFrom lubridate round_date
#' @importFrom lubridate as_date
#' @export
ll2incidence <- function(x, unit = c("day", "week", "month")) {
#  require(magrittr)   # for the " %>% " pipe operator
#  require(lubridate)  # for "round_date", "as_date"
  x %<>%
    round_date(unit) %>%
    table %>%
    data.frame %>%
    setNames(c("date", "incidence"))
  x$date <- as_date(x$date)
  x <- x[order(x$date), ]
  template <- data.frame(date = seq(min(x$date), max(x$date), unit))
  x <- merge(template, x, all.x = TRUE)
  x[which(is.na(x$incidence)), "incidence"] <- 0
  x
}
