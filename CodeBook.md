# Code Book

This is a code book that describes the variables, the data and transformations that were performed to clean up the data.

## The data source
* Original data can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Description of the data
* X_test: 2 947 observations of the 561 features, for 9 of the 30 volunteers.
* X_train: 7 352 observations of the 561 features, for 21 of the 30 volunteers.
* subject_test : a vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.
* subject_train : A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.
* y_test : A vector of 2 947 integers, denoting the ID of the activity related to each of the observations in X_test.
* y_train : A vector of 7 352 integers, denoting the ID of the activity related to each of the observations in X_train.
* activity_label : Description of activity IDs in y_test and y_train.
* features : Description of each variables in X_test and X_train.
* dataset : Bind of X_train and X_test

## Processing steps
The R script called run_analysis.R maintain the following tasks:
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive activity names.
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
