#' @export
make_index <- function(from = 5, to = 9, path = "website") {
  system(paste0("sed ",from,",",to,"d vignettes/",
                grep("\\.Rmd$", dir("vignettes"), value = TRUE),
                " > ", path, "/index.Rmd"))
}
