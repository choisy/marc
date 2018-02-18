#' Write the films list
#'
#' @export
#'
#' @author Marc Choisy
#'
make_film_list <- function() {
  films <- dir("/Volumes/Seagate Backup Plus Drive/films")
  extensions <- sub("^.*\\.", "", films)
  sel <- extensions %in% c("srt", "ass", "sub")
  films <- films[!sel]
  films <- sub("\\..*$", "", films)
  films <- films[order(tolower(films))]
  write(films, "~/Dropbox/film_list.txt")
  invisible(films)
}
