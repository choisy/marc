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
#' @source method suggested in the book "R in action" by Kabacoff (2011).
#' @return returns a named vector of 4 components: dispersion parameter ("phi"),
#' statistic ("stat"), number of degrees of freedom ("df") and corresponding p
#' value from the test ("p").
test_disp <- function(m) {
  m2 <- update(m,family=paste0("quasi",family(m)$family))
  phi <- summary(m2)$dispersion
  stat <- phi * m$df.residual
  df <- m$df.residual
  p <- pchisq(stat,df,lower=stat<1)
  c(phi=phi,stat=stat,df=df,p=p)
}
