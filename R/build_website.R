#'
#'
#'
#' @export
build_website <- function() {
  setwd("website")
  on.exit(setwd(".."))
  rmarkdown::render_site()
}
