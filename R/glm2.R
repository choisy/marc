#' blablabla
#'
#' blablabla
#'
#' @export
#' @importFrom magrittr %>%
#' @importFrom dplyr bind_rows
#' @importFrom purrr map2
# The following function is an adaptation of the `glm` function that uses the LRT
# to correct for potential confounding effects due to potential colinearities:
glm2 <- function(formula, family, data) {
  formulas <- formula %>% extract_sets %>% make_formulas
  nb <- sapply(formulas, length) %>% rep(cumsum(.) + 1, .)
  fct <- function(form, nb) {
    as.data.frame(anova(glm(formula(form), family, data), test = "LRT")[nb, ])
  }
  out <- map2(unlist(formulas), nb, fct)
  out %>%
    bind_rows %>%
    `row.names<-`(sapply(out, row.names))
}
