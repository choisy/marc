#' Send an R object by email.
#'
#' \code{ovv} returns an overview of a data frame.
#'
#' @param x A vector of characters.
#' @return The translation of x in Basic Latin.
#' @examples
#' 2+2
#' @export
#' @author Marc Choisy
# This is how we need to configure the system:
# (1) create a gmail email account
# (2) http://www.developerfiles.com/how-to-send-emails-from-localhost-mac-os-x-el-capitan/
# Note: you'll need to change the security parameters of your email account
# Note: you may want to forward all the email of your new account towards another one.
# Note: you may want to define the export REPLYTO=mchoisy@gmail.com is your .bashrc file.
sendRDS <- function(object, to, body, subject) {
  object_name <- deparse(substitute(object))
  if(missing(body)) body <- paste0("object ", object_name, " sent from R")
  if(missing(subject)) subject <- paste0("object ", object_name, " sent from R")
  to <- deparse(substitute(to))
  if(!grepl("@", to)) {
    tmp <- get(".addresses_book", envir = .GlobalEnv)[to]
    if(is.na(tmp)) stop(paste0("'", to, "' is not in addresses book"))
    else to <- tmp
  }
  rds_name <- paste0(object_name, ".rds")
  saveRDS(object, rds_name)
#  system(paste0("uuencode ", rds_name, " ", rds_name,
#                " | mail -s 'object ", object_name, " sent from R' ", to))
  system(paste0("(echo '", body, "'; uuencode ", rds_name, " ", rds_name,
                ") | mail -s '", subject, "' ", to))
  invisible(file.remove(rds_name))
}
