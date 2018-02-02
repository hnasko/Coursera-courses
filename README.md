# Getting and Cleaning Data

This R script run_analysis.R make the following major tasks:
1.	Merges the training and the test sets andcreate one data set.
2.	Extracts the measurements on the mean and standard deviation for each measurement.
3.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This script will automatically download necessary data in your working directory. Besides all the necessary libraries will be installed from the very start with a function pkgLoad(). In the end script will generate tidy data set tidydata.txt in your working directory for further analysis. 
