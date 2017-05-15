#' @export
make_website <- function(websitename) {
  dir.create("website")
  cat(paste0("name: \"", websitename,
             "\"\nhref: index.html\noutput_dir: \"../docs\""),
      file = "website/_site.yml")
}
