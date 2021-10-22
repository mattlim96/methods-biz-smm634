library(ISLR)
par(mfrow = c(2, 2))

lm1 <- lm(mpg ~ horsepower, Auto)
plot(lm1)

lm2 <- lm(mpg ~ horsepower + I(horsepower^2), data=Auto)
plot(lm2)

