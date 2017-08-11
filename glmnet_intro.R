library(glmnet)

data(QuickStartExample)
fit = glmnet(x, y)
plot(fit)

print(fit)


x
y

coef(fit,s=0.1)


nx = matrix(rnorm(10*20),10,20)
predict(fit,newx=nx,s=c(0.1,0.05))

fit = glmnet(x, y, alpha = 0.2, weights = c(rep(1,50),rep(2,50)))
print(fit)


cvfit1 = cv.glmnet(x, y)
plot(cvfit1)
cvfit1$lambda.min
cvfit1$lambda.1se
coef(cvfit1, s = "lambda.min")




predict(cvfit1, newx = x[1:5,], s = "lambda.min", alpha = 0.2)
y[1:5,]


any(fit$lambda == 0.5)
coef.exact = coef(fit, s = 0.5, exact = TRUE)
coef.apprx = coef(fit, s = 0.5, exact = FALSE)
cbind2(coef.exact, coef.apprx)

predict(fit, newx = x[1:5,], type = "response", s = 0.05)
y[1:5,]

cvfit = cv.glmnet(x, y, type.measure = "mse", nfolds = 30)
plot(cvfit)


data(QuickStartExample)
foldid=sample(1:10,size=length(y),replace=TRUE)
cv1=cv.glmnet(x,y,foldid=foldid,alpha=1)
print("alpha = 1, lambda min")
(sum((predict(cv1, newx = x[1:10,], s = "lambda.min")-y[1:10,])**2)/10)/var(y)
print("alpha = 1, lambda 1se")
sum((predict(cv1, newx = x[1:5,], s = "lambda.1se")-y[1:5,])**2)
cv.5=cv.glmnet(x,y,foldid=foldid,alpha=.5)
print("alpha = .5, lambda min")
sum((predict(cv.5, newx = x[1:5,], s = "lambda.min")-y[1:5,])**2)
print("alpha = .5, lambda 1se")
sum((predict(cv.5, newx = x[1:5,], s = "lambda.1se")-y[1:5,])**2)
cv0=cv.glmnet(x,y,foldid=foldid,alpha=0)
print("alpha = 0, lambda min")
sum((predict(cv0, newx = x[1:5,], s = "lambda.min")-y[1:5,])**2)
print("alpha = 0, lambda 1se")
sum((predict(cv0, newx = x[1:5,], s = "lambda.1se")-y[1:5,])**2)

par(mfrow=c(2,2))
plot(cv1);plot(cv.5);plot(cv0)
plot(log(cv1$lambda),cv1$cvm,pch=19,col="red",xlab="log(Lambda)",ylab=cv1$name)
points(log(cv.5$lambda),cv.5$cvm,pch=19,col="grey")
points(log(cv0$lambda),cv0$cvm,pch=19,col="blue")
legend("topleft",legend=c("alpha= 1","alpha= .5","alpha 0"),pch=19,col=c("red","grey","blue"))


par(mfrow=c(1,1))
p.fac = rep(1, 20)
p.fac[c(5, 10, 15)] = 0
pfit = glmnet(x, y, penalty.factor = p.fac,intercept=FALSE)
plot(pfit, label = TRUE)
