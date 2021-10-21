###################
# Week 2 Homework #
###################

library(faraway)
library(MASS)

# Columns from savings dataframe
# ==============================
# sr: savings rate - personal saving divided by disposable income
# pop15: percent population under age of 15
# pop75: percent population over age of 75
# dpi: per-capita disposable income in dollars
# ddpi: percent growth rate of dpi

data(savings)
summary(savings)

# (a) Fit a linear model where sr is the response variable and all the rest are predictors
lm1 <- lm(sr ~ ., data=savings)

# (b) Test the null hypothesis whether any of the predictors have significance in the model.

# ANS: p-value very small hence reject null
tests <- summary(lm1)
print(paste('p-value for F test = ',pf(tests$fstatistic[1],tests$fstatistic[2],tests$fstatistic[3],lower.tail=FALSE),' hence we reject null hypothesis because at least one βj is non-zero'))

# (c) Test the null hypothesis that the coefficient associated with pop15 is not significant in the full model. What conclusion do you reach?

# ANS: p-value very small hence do not reject null hypothesis, pop15 is significant in explaining sr

# (d) Test the same null hypothesis as in (c) using an F-testing approach.

# ANS: p-value very small hence do not reject null hypothesis, pop15 is significant in explaining sr
lm2 <- lm(sr ~ pop15, data=savings)
ftest = summary(lm2)
ftest

# (e) Can you relate the result of the F-test with that based on the t-test? Justify your answer.

# ANS: 

# (f) Construct a stepwise approach first using the model fitted in (a) and then with a model containing only the intercept. What conclusions can be drawn?

# ANS: 1 variable has been removed - pop75
lm.stepwise <- stepAIC(lm1, ~ ., data = savings)
summary(lm.stepwise)

# (g) Compare the results of the model chosen in (f) with those of model in (a). What changed?

# ANS: pop75 variable was kept despite being insignificant from t-test

# (h) Using the scatterplots below, what do you deduce? Are you happy with the model in (f)? Would you fit another model? If yes, which one would you fit? Are conclusions changing?

# ANS: Will not choose model in (f) because pop15 and pop75 looks correlated and pop75 has high p-value for t-test hence can be dropped.