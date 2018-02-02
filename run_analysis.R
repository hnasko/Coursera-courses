#--------------------Installing necessary libraries------------------------
pkgLoad<-function(packages = "assigment" ) {
  if(length(packages) == 1L && packages == 'assigment') {
    packages <- c('data.table', 'plyr', 'dplyr', 'lazyeval','RCurl', 'reshape2')
  }
  packagecheck<- match(packages, utils::installed.packages()[,1])
  packagestoinstall<- packages[is.na(packagecheck)]
  if(length(packagestoinstall) > 0L) {
    utils::install.packages(packagestoinstall,
                            repos = "https://cloud.r-project.org/"
    )
  } else {
    print('All requested packages have already installed')
  }
  for(package in packages) {
    library(package, character.only = TRUE, quietly = TRUE)
  }
}

pkgLoad()

#---------------------------Importing the data-----------------------------
fileName <- "UCIdata.zip"
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir <- "UCI HAR Dataset"

#downloading the file
if(!file.exists(fileName)){
  download.file(url,fileName, mode = "wb") 
}

#unzip the downloaded file
if(!file.exists(dir)){
  unzip("UCIdata.zip", files = NULL, exdir=".")
}

#--------------Merging the training and the test sets to create one data set.

features<- read.table("UCI HAR Dataset/features.txt",header=FALSE)
activity_label<- read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE)
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
X_train<- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
y_train<- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
X_test<- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
y_test<- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)

colnames(activity_label)<-c("activity_ID","Type")
colnames(subject_train) <- c("subject_ID")
colnames(X_train) <- features[,2]
colnames(y_train) <- c("activity_ID")

colnames(subject_test) <- c("subject_ID")
colnames(X_test) <- features[,2]
colnames(y_test) <- c("activity_ID")

#Merging training set
training_set <- cbind(X_train, subject_train, y_train)

#Merging test set
test_set <- cbind(X_test, subject_test, y_test)

#Merging training and the test sets 
dataset<-rbind(training_set,test_set)


#-----Extracting the measurements on the mean and standard deviation for each measurement--
names<-colnames(dataset)
data <-dataset[,grepl("-mean\\(\\)|-std\\(\\)|subject_ID|activity_ID", names)]

#-----Assigning descriptive activity names to name the activities in the data set----------
data<- join(data, activity_label, by = "activity_ID", match = "first")
data<-data[,-1]

#4.Appropriately labels the data set with descriptive variable names.

#On my point of view, the names of variables have already been labeled appropriately.
#The names are short enough to be readable and understandable.
#And we may find additional information about variables' names in file feature_info.txt 

#5.From the data set in step 4, creates a second, independent tidy data set with the average
#of each variable for each activity and each subject.

tidydata<-aggregate(. ~subject_ID + Type, data, mean)
write.table(tidydata, "tidydata.txt")

