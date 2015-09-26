## Author: Rolando Mendoza
## Date: 09/24/2015
##
## This code does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the 
##    average of each variable for each activity and each subject.

## code is at the "base" folder along with the data

## load the data.table package to use later
require("data.table")

## read the files
activities <- read.table(file="activity_labels.txt")
features <- read.table(file="features.txt")

subject_test <- read.table(file="test/subject_test.txt")
x_test <- read.table(file="test/X_test.txt")
y_test <- read.table(file="test/y_test.txt")

subject_train <- read.table(file="train/subject_train.txt")
x_train <- read.table(file="train/X_train.txt")
y_train <- read.table(file="train/y_train.txt")

## add more descriptive activity column to y data
y_test[,2] = activities$V2[y_test[,1]]
y_train[,2] = activities$V2[y_train[,1]]

## rename the headings
names(x_test) = features$V2
names(x_train) = features$V2
names(y_test) = c("Activity_ID", "Activity_Name")
names(y_train) = c("Activity_ID", "Activity_Name")
names(subject_test) = "Volunteer"
names(subject_train) = "Volunteer"

## extract the mean and standard deviation from features
meanStd <- grepl("mean|std", features$V2)

## subset x_test and x_train to get the mean and std dev measurements
x_test <- x_test[, meanStd]
x_train <- x_train[, meanStd]

## combine the test data together
testDF <- cbind(as.data.table(subject_test), y_test, x_test)
trainDF <- cbind(as.data.table(subject_train), y_train, x_train)

## merge the test and train data frames into one
mergedDF = rbind(testDF, trainDF)

## remove the activity ID column to create the tidy data
mergedDF$Activity_ID = NULL

## create the file
write.table(mergedDF, row.names = TRUE, file = "tidy_data.txt")