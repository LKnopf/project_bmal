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


cvfit = cv.glmnet(x, y)
plot(cvfit)
cvfit$lambda.min
cvfit$lambda.1se
coef(cvfit, s = "lambda.min")

predict(cvfit, newx = x[1:5,], s = "lambda.min", alpha = 0.2)
y[1:5,]
