#' @export
make_readme <- function() {
  cat(paste("#", basename(getwd()), "\n"), file = "README.md")
  system(paste0("sed 1,22d vignettes/", dir("vignettes"), " >> README.md"))
}
