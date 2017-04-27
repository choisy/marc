#' Upload a file to marcchoisy.free.fr
#'
#' sdfg
#'
#' dfgsdf
#' dfgsdfg
#' @export
put <- function(file, path = "tutorials") {
  RCurl::ftpUpload(file,
                   paste0("ftp://marcchoisy:bu*se.78@ftpperso.free.fr/",
                          path, "/", file))
}
