library(MASS)

# principal of marginality
set.seed(100)
c = round(runif(30,-100,100))
f=c*9/5+32
z=round(runif(30))
y=8+1.5*c+z-0.03*c*z+rnorm(30)

lm1 = lm(y~c*z)
summary(lm1)

lm2 = lm(y~f*z)
summary(lm2)

summary(lm1nom <- update(lm1, . ~ . - z))
summary(lm2nom <- update(lm2, . ~ . - z))