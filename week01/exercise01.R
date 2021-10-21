###################
# Week 1 Homework #
###################

# create data
y <- c(8,5,7,5,6,3,5,4,2,2)
x <- c(1.3, 2.9, 4.4, 5.8, 8.2, 9.9, 12.1, 13.8, 14.2, 17.7)

# (a) because number of days absent is the response variable,
#     something we aim to predict and understand better

# (b) scatter plot
plot(x, y, xlab = "Distance (km)", ylab = "Days absent")

# (c) regression line
lm <- lm(y ~ x)
summary(lm)

# (d) -ve slope means that as distance decreases, # of days absent increases

# (e) prediction of y for x = 10 is 4.402061 days
new.x <- data.frame(x = 10)
prediction.y <- predict(lm, new.x)
prediction.y

# (f) I don't think it will be the same because our model was trained with a small sample size of 10,
#     the behavior of employees who live much further away would differ from the employees in our sample

#     Cannot extrapolate because predictions of Y has to be within the range of X from sample.

# (g) approx normal and variance seems constant
par(mfrow = c(2, 2))
plot(lm)