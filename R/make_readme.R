#' @export
make_readme <- function(from = 1, to = 22) {
  cat(paste("#", basename(getwd()), "\n"), file = "README.md")
#  system(paste0("sed ", from, ",", to, "d vignettes/", dir("vignettes"), " >> README.md"))
  system(paste0("sed ", from, ",", to, "d vignettes/", grep("\\.R$", dir("vignettes"), value = TRUE), " >> README.md"))
}
