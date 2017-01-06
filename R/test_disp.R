#' Test of dispersion
#'
#' \code{test_disp} tests the significativity of the dispersion in a Poisson
#' or logistic model.
#'
#' @param m a glm object with family equal to "poisson" of "binomial".
#' @export
#' @author Marc Choisy
#' @examples
#' m <- glm(Species=="versicolor" ~ Sepal.Width,family=binomial(), data=iris)
#' test_disp(m)
#' @source Method suggested in the book "R in action" by Kabacoff (2011).
test_disp <- function(m) {
  m2 <- update(m,family=paste0("quasi",family(m)$family))
  stat <- summary(m2)$dispersion * m$df.residual
  df <- m$df.residual
  p <- pchisq(stat,df,lower=stat<1)
  c(stat=stat,df=df,p=p)
}
