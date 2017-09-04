#' blablabla
#'
#' lsqkdjfh
#'
#' @importFrom purrr map2
#' @export
# The following function estimates proportions with confidence interval
prop_calc <- function(x, n, ci = .95) {
  fct <- function(x, n) {
    tmp <- binom.test(x, n, conf.level = ci)
    c(tmp$est, tmp$conf)
  }
  map2(x, n, fct) %>% as.data.frame %>%  # because "map2" returns a list
    t %>% as.data.frame %>%              # because "t" returns a matrix
    setNames(c("estimate", "upper", "lower")) %>%
    `row.names<-`(NULL)
}
