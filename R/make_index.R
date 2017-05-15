#' @export
make_index <- function(from = 5, to = 9) {
  system(paste0("sed ",from,",",to,"d vignettes/",
                dir("vignettes"), " > website/index.Rmd"))
}
