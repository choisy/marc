#' @export
make_index <- function(from = 5, to = 9) {
  system(paste0("sed ",from,",",to,"d vignettes/",
#                dir("vignettes"),
                grep("\\.R$", dir("vignettes"), value = TRUE),
                " > website/index.Rmd"))
}
