#' Write the films list
#'
#' @importFrom R2HTML HTMLInitFile HTML HTMLEndFile
#' @importFrom RCurl ftpUpload
#'
#' @export
#'
#' @author Marc Choisy
#'
make_film_list <- function(from  = "/Volumes/Seagate Backup Plus Drive/films",
                           to    = "~/Dropbox/Public/film_list.html",
                           ftp   = "ftpperso.free.fr",
                           login = "marcchoisy", passwd) {
  films <- dir("/Volumes/Seagate Backup Plus Drive/films")
  extensions <- sub("^.*\\.", "", films)
  sel <- extensions %in% c("srt", "ass", "sub")
  films <- films[!sel]
  films <- sub("\\..*$", "", films)
  films <- films[order(tolower(films))]

  write(films, sub("html$", "txt", to))

  target <- HTMLInitFile(dirname(to), sub("\\.html$", "", basename(to)))
  HTML(data.frame(films), file = target)
  HTMLEndFile()

  if (missing(passwd)) {
    passwd <- unlist(options("ftppass"))
    if (is.null(passwd)) passwd <- readline("Password: ")
  }
  ftpUpload(to, "ftp://marcchoisy:bu*se.78@ftpperso.free.fr/film_list.html")

  cat(length(films), "films.")
  invisible(films)
}
