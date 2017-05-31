#' @export
make_init <- function(to_readme = 22, to_index = 9) {
  make_readme(to = to_readme)
  make_index(to = to_index)
  build_website()
}
