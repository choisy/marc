.onLoad <- function(libname, pkgname) {
  libpath <- installed.packages()
  path <- paste0(libpath[libpath[, "Package"] == "marc", "LibPath"], "/marc_data")
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
