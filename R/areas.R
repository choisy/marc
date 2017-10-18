#' Areas of the Polygons of a SpatialPolygon* Object
#'
#' Returns a list of the areas of the Polygon objects of the polygons slot of
#' a SpatialPolygon* object.
#'
#' The returned list is of same length as the input SpatialPolygon* object. Each
#' slot of the list is a numeric vector, the lenght of which is equal to the
#' number of Polygon objects constituing
#'
#' @export
areas <- function(spplgn) {
  lapply(spplgn@polygons, function(x) sapply(x@Polygons, function(x) x@area))
}
