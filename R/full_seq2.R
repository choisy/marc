#' blablabla
#'
#' @export
#' @importFrom tidyr full_seq
#' @importFrom dplyr first
#The following function is an adpatation of the `full_seq` function of the `tidyr`
#package, automatically calculating the period:
full_seq2 <- function(x, period, tol = 1e-6) {
  if(missing(period)) period <- first(diff(unique(x)))
  full_seq(x, period, tol)
}
