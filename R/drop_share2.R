#' @export
drop_share2 <- function(...) {
  out <- rdrop2::drop_share(..., short_url = FALSE)
  out$url <- sub("www\\.dropbox", "dl.dropboxusercontent", out$url)
  out
}
