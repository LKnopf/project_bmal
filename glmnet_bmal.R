library(glmnet)


##########################################################################
#test predictability of rhythmic binding via binding rhythmicity p-values#
##########################################################################

data(QuickStartExample)
x_test = x
y_test = y
y = as.matrix(results_norm[,3])
x = tc_use[, 2:7]
x[, 7:8] = results_norm[,5:6]
x = as.matrix(x[,1:8]) # adjust to include amp and/or phase





cv1=cv.glmnet(x,y,alpha=1)
plot(cv1)
coef(cv1, s = "lambda.min")
cv1$lambda.min

cv_test = cv.glmnet(x_test,y_test,alpha=1)

pred_size = 900
sqrt(sum(((predict(cv1, newx = x[1:pred_size,], s = "lambda.min")-y[1:pred_size,])/as.numeric(var(y[1:pred_size])))**2)/pred_size)
sqrt(sum(((predict(cv_test, newx = x_test[1:10,], s = "lambda.min")-y_test[1:10,])/as.numeric(var(y_test[1:10])))**2)/10)


#####################################################################
#test predictability of rhythmic binding via binary rhytmicity value#
#####################################################################

y = as.matrix(results_norm[,3])
y_bin = y

for (i in 1:length(y)){
  if (y[i] <= 0.2) {
    y_bin[i] = 1
  }
  else {y_bin[i] = -1}

}

cv_bin=cv.glmnet(x,y_bin,alpha=1,family = "binomial")
par(mfrow=c(1,1))
plot(cv_bin)
coef(cv_bin, s = "lambda.min")
cv_bin$lambda.min

cv_test = cv.glmnet(x_test,y_test,alpha=1)

pred_size = 900
#sqrt(sum(((predict(cv_bin, newx = x[1:pred_size,], s = "lambda.min")-y_bin[1:pred_size,])/as.numeric(var(y_bin[1:pred_size])))**2)/pred_size)
y_pred = predict(cv_bin, newx = x[1:pred_size,], s = "lambda.min", type="response") #create predicted y

comp_y.y_pred= table(y_pred>=0.5,y_bin) #create table comparing predicted an actual response
print(comp_y.y_pred) #shows hits and misses


###############################################################
#test predictability of rhythmic transcript via binding scores#
###############################################################
y_trans = rep(-1, 900)
count_err = 0

for (bs in 1:length(tc_use[,1])) {
  M = genes_transcript_meta$Gene == tc_use[bs,1]
  N = subset(genes_transcript_meta, M)
  N = N[order(N[,2], decreasing = TRUE),]
  
  if (dim(N)[1] >=1 ){
  for (step in 1:length(N[,1])) {
    if (N[step,2] <= 0.1) {
      y_trans[bs] = 1
    }
  }
  }  else {
    count_err = count_err +1 
    }
}
print(count_err)

cv_bin=cv.glmnet(x,y_trans,alpha=1,family = "binomial")
par(mfrow=c(1,1))
plot(cv_bin)
coef(cv_bin, s = "lambda.min")
cv_bin$lambda.min

cv_test = cv.glmnet(x_test,y_test,alpha=1)

pred_size = 900
#sqrt(sum(((predict(cv_bin, newx = x[1:pred_size,], s = "lambda.min")-y_trans[1:pred_size,])/as.numeric(var(y_trans[1:pred_size])))**2)/pred_size)
y_trans_pred = predict(cv_bin, newx = x[1:pred_size,], s = "lambda.min", type="response") #create predicted y

comp_y_trans.y_trans_pred= table(y_trans_pred>=0.5,y_trans) #create table comparing predicted an actual response
print(comp_y_trans.y_trans_pred) #shows hits and misses



