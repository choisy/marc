#' blablabla
#'
#' blablabla
#'
#' @keywords internal
# The following function uses the output of the previous function and returns
# all the possible formulas. There are two slots. In the first slot only the
# single terms are shifted whereas in the second slot only the interaction terms
# are shifted.
make_formulas <- function(sets) {
  set1 <- sets[[1]]
  set2 <- sets[[2]]
  set3 <- sets[[3]]
  nb2 <- length(set2)
  nb3 <- length(set3)
  formula1 <- character(nb2)
  formula2 <- character(nb3)
  # we need for loops because each step make change for next step
  # the loops cannot be combined in one single one.
  for(i in 1:nb2) {
    set2 <- c(set2[-1], set2[1])
    formula1[i] <- paste(set1, paste(set2, collapse = "+"), "+",
                         paste(set3, collapse = "+"))
  }
  for(i in 1:nb3) {
    set3 <- c(set3[-1], set3[1])
    formula2[i] <- paste(set1, paste(set2, collapse = "+"), "+",
                         paste(set3, collapse = "+"))
  }
  list(formula1, formula2)
}
