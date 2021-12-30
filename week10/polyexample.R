set.seed(1)
x<-sort(runif(40)*10)^.5
y<-sort(runif(40))^0.1

plot(x,y)

b5<-lm(y~poly(x,5, raw=T))
summary(b5)

b10<-lm(y~poly(x,10, raw=T))
summary(b10)

xx <- seq(min(x),max(x),length=200)##for prediction
lines(xx,predict(b5,data.frame(x=xx)))
lines(xx,predict(b10,data.frame(x=xx)),col=4)

