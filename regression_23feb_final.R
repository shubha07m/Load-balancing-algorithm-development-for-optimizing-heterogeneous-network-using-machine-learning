### Loading the raw data we want to use:
set.seed(123)

setwd("C:/Users/smpw5/Desktop/regression_final_results/regression_moving_results")
lte = read.csv("ltemaster_raw_moving.csv")

lte = na.omit(lte)
size = floor(runif(13048, min=1, max=13048))
lte = lte[size,]

#considering the result for all parameter:

lm.lte = lm(signal ~ .,data = lte)


# ############### To identify if there is heteroscedacity ###################
#
# ###### type-1 : Breusch-Pagan test #######
#
library (lmtest)

bptest(lm.lte)
#
#
# ###### type-2 : NCV test #######
#
library(car)
ncvTest(lm.lte)
# 
# ############### LTE performance ###################


# suppressMessages(library(caret))
# 
# library(MASS)
# 
# train_control = trainControl(method="cv", number=10)
# model = train(signal ~., data=lte, trControl=train_control, method="glm")
# print(model)