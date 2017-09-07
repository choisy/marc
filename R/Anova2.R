#' blablabla
#'
#' blablabla
#'
#' blablabla
#'
#' @importFrom car Anova
#' @export
#'
# This function is a modification of the car::Anova function, testing the
# significativity of main effects without the interactions terms.
Anova2 <- function(mod, ...) {
  tmp <- Anova(mod, ...)
  rbind(Anova(update(mod, drop_interactions(formula(mod))), ...),
        tmp[grep(":", row.names(tmp), value = TRUE), ])
}
