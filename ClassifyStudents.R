###################################################################
#OZKAN EMRE OZDEMIR
#HOMEWORK ASSIGNMENT #4 02/14/2016
###################################################################
# ClassifyStudents.R

# Clear objects from Memory
rm(list=ls())
# Clear Console:
cat("\014")

source("~/DataScience/class4/CollegeStudentsDatasets.R")

# Set repeatable random seed
set.seed(4)

###################################################

# Partition data between training and testing sets

# Replace the following line with a function that partitions the data correctly
StudentsSplit <- PartitionFast(Students, fractionOfTest=0.4) # ********** Make change here
TestStudents <- StudentsSplit$testingData
TrainStudents <-StudentsSplit$trainingData

###################################################

# Logistic Regression (glm, binomial)

# http://data.princeton.edu/R/glms.html
# http://www.statmethods.net/advstats/glm.html
# http://stat.ethz.ch/R-manual/R-patched/library/stats/html/glm.html
# http://www.stat.umn.edu/geyer/5931/mle/glm.pdf

# Create logistic regression
glmModel <- glm(formula, data=TrainStudents, family="binomial") # added line
# Predict the outcomes for the test data. (predict type="response")
predictedProbabilities.GLM <- predict(glmModel, newdata=TestStudents, type="response")

###################################################

# Naive Bayes

# http://cran.r-project.org/web/packages/e1071/index.html
# http://cran.r-project.org/web/packages/e1071/e1071.pdf
# Get the algorithm

reposURL <- "http://cran.rstudio.com/"
# install package with naive bayes if not alreay installed
if (!require("e1071")) {install.packages("e1071", dep=TRUE, repos=reposURL)} else {" e1071 is already installed "}
# Now that the package is installed, we want to load the package so that we can use its functions
library(e1071)

# Create Naive Bayes model
naiveBayesModel <- naiveBayes(formula,data=TrainStudents)
# Predict the outcomes for the test data. (predict type="raw")
predictedProbabilities.nb <- predict(naiveBayesModel, newdata=TestStudents, type="raw") 
###################################################

# Confusion Matrices

actual <- ifelse(TestStudents$CollegePlans, "Attend", "NotAttend")
threshold = 0.5

#Confusion Matrix for Logistic Regression
# convert the predicted probabilities to predictions using a threshold
predicted.GLM <- ifelse(predictedProbabilities.GLM > threshold, "Attend", "NotAttend") 
print(" ")
print(" -------------------------------- ")
print("Confusion Matrix for Logistic Regression")
# create a table to compare predicted values to actual values
print(table(predicted.GLM, actual, dnn=c("Predicted", "Actual")))

#Confusion Matrix for Naive Bayes
# convert the predicted probabilities to predictions using a threshold
predicted.nb <- ifelse(predictedProbabilities.nb [,2] > threshold, "Attend", "NotAttend") 
print(" ")
print(" -------------------------------- ")
print("Confusion Matrix Naive Bayes")
# create a table to compare predicted values to actual values
print(table(predicted.nb, actual, dnn=c("Predicted", "Actual")))
###################################################

# Bad Partition threshold = 0.5
# 
# --------------------------------
# "Confusion Matrix for Logistic Regression"
#              Actual
# Predicted    Attend  NotAttend
# Attend        934        116
# NotAttend     759       1071
# Accuracy defined as fraction of predictions that are correct
# Accuracy:  (934 + 1071)/(934 + 759 + 116 + 1071) = 70%
# 
# --------------------------------
# "Confusion Matrix Naive Bayes"
#            Actual
# Predicted   Attend NotAttend
# Attend       325        84
# NotAttend   1368      1103
# Accuracy defined as fraction of predictions that are correct
# Accuracy:  (325 + 1103)/(325 + 1368 + 84 + 1103) = 50%

# Fill in the rest:

# Exact Partition threshold = 0.5
#
# --------------------------------
# "Confusion Matrix for Logistic Regression"
#            Actual
# Predicted   Attend NotAttend
# Attend      695    228   
# NotAttend   257    1700   
# Accuracy defined as fraction of predictions that are correct
# Accuracy:   (695 + 1700)/ (695 + 257 + 228 + 1700) = 0.8315972 ~  83.15 %
#
# --------------------------------
# "Confusion Matrix Naive Bayes"
#            Actual
# Predicted   Attend NotAttend
# Attend      570    210   
# NotAttend   382    1718  
# Accuracy defined as fraction of predictions that are correct
# Accuracy:   (570 + 1718)/ (570 + 382  + 210  + 1718 ) =   0.7944444 ~79.45 %

# Fast Partition threshold = 0.5
#
# --------------------------------
# "Confusion Matrix for Logistic Regression"
#            Actual
# Predicted   Attend NotAttend
# Attend      698    228   
# NotAttend   260    1709   
# Accuracy defined as fraction of predictions that are correct
# Accuracy:   (698 + 1709)/(698  + 260  + 228  + 1709) = 0.8314335~ 83.14 %
#
# --------------------------------
# "Confusion Matrix Naive Bayes"
#            Actual
# Predicted   Attend NotAttend
# Attend       572     212   
# NotAttend    386     1725   
# Accuracy defined as fraction of predictions that are correct
# Accuracy:   (572 + 1725)/(572 + 386  + 212  + 1725) = 0.793437 ~ 79.34 %

# Exact Partition;  threshold = 0.7
#
# --------------------------------
# "Confusion Matrix for Logistic Regression"
#            Actual
# Predicted   Attend NotAttend
# Attend      499    83   
# NotAttend   453    1845   
# Accuracy defined as fraction of predictions that are correct
# Accuracy:   (499 + 1845 )/(499  + 453 + 83  + 1845) = 0.8138889 ~ 81.39 %
#
# --------------------------------
# "Confusion Matrix Naive Bayes"
#            Actual
# Predicted   Attend NotAttend
# Attend      427    97   
# NotAttend   525    1831
# Accuracy defined as fraction of predictions that are correct
# Accuracy:   (427 + 1831)/(427  + 525 + 97   + 1831) =  0.7840278 ~ 78.40 %
###################################################
