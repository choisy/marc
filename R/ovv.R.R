#' Overview of a data frame.
#'
#' \code{ovv} returns an overview of a data frame.
#'
#' @param x A vector of characters.
#' @return The translation of x in Basic Latin.
#' @examples
#' 2+2
#' @export
#' @author Marc Choisy
ovv <- function(df, digits = 4, interspace = 3) {
  require(magrittr) # " %>% ", " %<>% "
  require(dplyr) # bind_rows, mutate_all
  h <- head(df)
  t <- tail(df)
  hn <- rownames(h)
  tn <- rownames(t)
  h %<>% mutate_if(is.numeric, round, digits = digits)
  t %<>% mutate_if(is.numeric, round, digits = digits)
  h %<>% mutate_all(as.character)
  t %<>% mutate_all(as.character)
  m <- setNames(as.data.frame(matrix(".", interspace, ncol(df))), names(df))
  out <- bind_rows(h, m, t)
  out <- cbind(c(hn, rep(".", interspace), tn), out)
  names(out)[1] <- ""
  print(out, row.names = FALSE)
  invisible(out)
}
