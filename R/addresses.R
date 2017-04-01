#' addresses
#'
#' sdfsf
#'
#' fsdfsdf
#' qsfqsdf
#'
#' @export
addresses <- function(x, overwrite = FALSE) {
  fct <- function(x, i) sub("()", "", x[i])
  addresses_book <- get(".addresses_book", envir = .GlobalEnv)
  if(missing(x)) {
    if(is.null(addresses_book)) message("Addresses book in empty")
    else return(addresses_book)
  } else {
    if(grepl("~", deparse(substitute(x)))) { # here we add an address
      alias <- fct(x, 2)
      address <- fct(x, 3)
      if((alias %in% names(addresses_book)) & !overwrite)
        message(paste0("'", alias, "' already exists in addresses book"))
      else {
        addresses_book[alias] <- address
        addresses_book <- addresses_book[order(names(addresses_book))]
        assign(".addresses_book", addresses_book, envir = .GlobalEnv)
        save(addresses_book,
             file = paste0(.libPaths(), "/marc_data/addresses_book.rda"))
      }
    } else {
      x <- deparse(substitute(x))
      if(x %in% names(addresses_book)) return(addresses_book[x])
      else message(paste0("'", x, "' not in address book"))
    }
  }
}
