#' Conversion to base Latin.
#'
#' \code{to_base_latin} returns the base Latin equivalent of non-base Latin
#' Unicode characters.
#'
#' As input could be any Unicode character of the Latin-1 Supplement, Latin
#' Extended-A & B, and Latin Extended Additional blocks of the Unicode standard.
#' The output will be the equivalent in the Basic Latin block.
#'
#' @param x A vector of characters.
#' @return The translation of x in Basic Latin.
#' @source \url{https://en.wikipedia.org/wiki/Latin-1_Supplement_(Unicode_block)},
#' \url{https://en.wikipedia.org/wiki/Latin_Extended-A},
#' \url{https://en.wikipedia.org/wiki/Latin_Extended-B} and
#' \url{https://en.wikipedia.org/wiki/Latin_Extended_Additional}.
#' @examples
#' to_basic_latin(c("H<U+00E0> Noi","Hai ph<U+00F2>ng","H<U+00E0> Giang"))
#' @export
to_basic_latin <- function(x) {
  for(i in 1:nrow(basic_latin))
    x <- gsub(basic_latin[i,1],basic_latin[i,2],x)
  x
}
