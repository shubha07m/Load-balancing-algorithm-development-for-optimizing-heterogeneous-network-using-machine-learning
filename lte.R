
## Loading the raw data we want to use:


lte = read.csv("ltetemp.csv")
attach(lte)


#considering the result for all parameter:
#lm.lte = lm(signal~cellid+enbrnc+lcid+xarfcn+band+fc+lat+lon+acc+speed+bearing+alt+rsrq+rssnr+ss+ta+Temperature+DewPoint+Humidity+WindSpeed+WindGust+Pressure)


#summary process: type 1 validation

##divide in fixed set of train data and test data, check the accuracy of prediction on fixed set of test data

lm.lte = lm(signal~xarfcn+fc+alt+rsrq+rssnr+ss+Humidity+WindSpeed+WindGust)
summary(lm.lte)
par(mfrow=c(2,2))
plot(lm.lte)



##K - fold cross validation: type 2 validation approach, more accurate than type 1:
##divide in train data and test data, check the prediction accuracyon all data set by random train data and test data a number of time


boot.fnew = function(data,index) {
  lm.lte = lm(signal~xarfcn+fc+acc+speed+bearing+alt+rsrq+rssnr+ss+ta+Humidity+WindSpeed+WindGust,data = data, subset = index)
  return (coef(lm.lte))
}
library(boot)
boot(lte, boot.fnew, nrow(lte)/5)

## Ref: t1, t2, t3....... t14 are the parameters used speed, Humidity etc. And , listed their standard error and bias by the side.