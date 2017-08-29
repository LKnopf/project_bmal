library(randomForest)

fit <- randomForest(x, y=as.factor(y), ntree=2000, importance=TRUE)
varImpPlot(fit)

pred = predict(fit, newx=x)
sqrt(sum(((as.numeric(as.numeric(as.vector(pred)))-y)/as.numeric(var(y)))**2)/900)

pred_2 = predict(cv1, newx = x[1:pred_size,], s = "lambda.min")

y - as.numeric(as.vector(pred))
hist(y - as.numeric(as.vector(pred)))
table(y - as.numeric(as.vector(pred)))
