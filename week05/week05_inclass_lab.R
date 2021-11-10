# week 4 lecture notes -  dummy variables
library(ISLR)
lm.fit <- lm(Sales ~., data = Carseats)
summary(lm.fit)

lm.fit2 <- update(lm.fit, ~ . -ShelveLoc)
summary(lm.fit2)

anova(lm.fit2, lm.fit)

# week 5 lecture notes - ridge and lasso
library(ISLR)
Hitters <- na.omit(Hitters)
x <- model.matrix(Salary ~., Hitters)[,-1]
y <- Hitters$Salary

set.seed(100)
library(glmnet)
grid <- 10^seq(10, -2, length = 100)
ridge.mod <- glmnet(x, y, alpha = 0, lambda = grid)