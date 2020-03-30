
## Loading the raw data we want to use:
set.seed(123)

setwd("C:/Users/smpw5/Desktop/LDA_final_results")
lte = read.csv("lda_moving_final_all.csv")
lte = na.omit(lte)
size = floor(runif(13048, min=1, max=13048))
lte = lte[size,]


#considering the result for all parameter:

# library(MASS)
# root.lda = lda(sigl ~ ., data = lte)
# lda.pred = predict(root.lda)$class
# table(lte$sigl, lda.pred, dnn = c('Actual class','Predicted class'))


############# co - linearity experiements################

# max(eigen(cor(lte))$values)/
#   min(eigen(cor(lte))$values)
# 
# kappa(cor(lte),exact = TRUE)


myfit = lm(sigl ~ ., data = lte)

alias(myfit)

library(car)
v = vif(myfit)
sort(v)
mean(v)

########## validation set approach ##########

suppressMessages(library(caret))

library(MASS)

set.seed(12345)

lte[,2]=as.factor(lte$sigl)

# lda.fit = train(sigl ~ ., data=lte, method="lda", trControl = trainControl(method = "cv", number=10))
train_control = trainControl(method="cv", number=10)
model = train(sigl ~., data=lte, trControl=train_control, method="lda")
print(model)