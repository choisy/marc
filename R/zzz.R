.onLoad <- function(libname, pkgname) {
  path <- paste0(.libPaths(), "/marc_data")
print(path)
  file <- paste0(path, "/addresses_book.rda")
  if(dir.exists(path)) load(file)
  else {
    dir.create(path)
    addresses_book <- NULL
    save(addresses_book, file = file)
  }
  assign(".addresses_book", addresses_book, envir = .GlobalEnv)
  rm(addresses_book)
}
