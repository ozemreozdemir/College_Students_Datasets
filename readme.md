College Students Classification
===============================
Add code to ClassifyStudents.R that creates a Logistic Regression model. 
1. Add code to ClassifyStudents.R that creates a Naïve Bayes model. You will have to look up the Naive Bayes package "e1071" to determine the inputs.  Get help! 

2. Partition Functions a) Run the script (source): ClassifyStudents.R using PartitionWrong() and copy the resulting confusion matrix of the logistic regression as a comment into ClassifyStudents.R.  Please  stick to the format as shown in ClassifyStudents.R. 
b) Add a function to CollegeStudentsDatasets.R.  The name of the function is:  PartitionFast. The function works as described in the lecture slides and has the same signature as PartitionWrong.  Specifically, the function takes in only a dataframe and a fraction.  The function returns a list of two dataframes.  The names of the two dataframes are trainingData and testingData. trainingData and testingData are mutually exclusive cases from the input data frame. trainingData, testingData , and the data frame all have the same schema. testingData contains the fraction of cases as specified by the fraction input. trainingData contains the rest. 
c) Add a function to CollegeStudentsDatasets.R.  The name of the function is:  PartitionExact. The function works as described in the lecture slides and has the same signature as PartitionWrong.  

3. Classification in R 
a) In ClassifyStudents.R add code to predict outcomes based on the Logistic Regression model.  
b) In ClassifyStudents.R add code to predict outcomes based on the Naive Bayes model.  You will have to read the documentation to determine the “type” parameter.  It is very important that you answer for yourself:  How many rows are there in the outcome?  How many columns?  How many columns are in the output for the logistic regression?  Get Help! 
c) Add code to create a confusion matrix  for the logistic regression.  
d) Add code to create a confusion matrix  for the Naïve Bayes.  
e) In ClassifyStudents.R run the script (source) using Partition Wrong: ClassifyStudents.R  and copy the resulting confusion matrix of the logistic regression and naïve Bayes as a comment into ClassifyStudents.R.  What are the accuracies? 
f) In ClassifyStudents.R replace the line containing PartitionWrong() with PartitionFast().  Run the script (source): ClassifyStudents.R  and copy the resulting confusion matrix of the logistic regression and naïve Bayes as a comment into ClassifyStudents.R. What are the accuracies? 
g) In ClassifyStudents.R replace the line containing PartitionWrong() with PartitionFast().  Run the script (source): ClassifyStudents.R  and copy the resulting confusion matrix of the logistic regression and naïve Bayes as a comment into ClassifyStudents.R. What are the accuracies? 
