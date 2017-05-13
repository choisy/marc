#' @export
make_index <- function() {
  system(paste0("sed 5,9d vignettes/",
                dir("vignettes"), " > website/index.Rmd"))
}
