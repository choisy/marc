#' Manages the addresses book
#'
#' This function allows to print the content of the addresses book as well as to
#' retrieve, define or remove one address.
#'
#' @param \code{x} an optional unquoted character string.
#' @return If \code{x} is missing, returns the content of the addresses book. If
#' \code{x} is a pseudo, it returns the corresponding email addresse. If \code{x}
#' is a formula with a pseudo on the left hand side of the tild sign and an
#' email address on the right hand side of it, it assigns this news entry to the
#' address book.
#' @export
#' @author Marc Choisy
#' @seealso The pseudo of an entry of the addreses book can be used in place of
#' its corresponding email address to sending object with the \code{send} function.
#' @examples
#' # When the addresses book is empty:
#' addresses()
#'
#' # Assigning 3 entries to the addresses book:
#' addresses(pseudo1 ~ name1@domain1)
#' addresses(pseudo2 ~ name2@domain2)
#' addresses(pseudo3 ~ name3@domain3)
#'
#' # Printing the content of the addresses book:
#' addresses()
#'
#' # Trying to use a pseudo already present in the addresses book:
#' addresses(pseudo3 ~ name4@domain4, overwrite = TRUE)
#'
#' # Replacing the address of a pseudo with a new address:
#' addresses(pseudo3 ~ name4@domain4)
#'
#' # Retrieving an email address:
#' addresses(pseudo3)
addresses <- function(x, overwrite = FALSE) {
  fct <- function(x, i) gsub(" *", "", sub("()", "", x[i]))
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
