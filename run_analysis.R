run_analysis <- function() {
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## check directory, file existence else return error

	setwd("C:/Users/Sandeep/Documents")
	directory <- c("activitydata")
	directory <- gsub("\\s","", directory)

	setwd (directory)

## load reshape2 library for dcast
	library(reshape2)

## read colnames from features.txt file
	ycols <- read.table("features.txt")

## Get the training and test data sets
## Merge the training and the test sets to create one data set.

## get training data, set column names and concatenate
	setwd("train")
	xtrain <- read.table("X_train.txt")
	ytrain <- read.table("y_train.txt")
	colnames(ytrain) <- c("acid")
	strain <- read.table("subject_train.txt")
	colnames(strain) <- c("suid")
	xtrain <- cbind(xtrain, strain, ytrain)

	trainrows <- nrow(xtrain)

## get test data, set column names and concatenate
	setwd("../test")
	xtest <- read.table("X_test.txt")
	ytest <- read.table("y_test.txt")
	colnames(ytest) <- c("acid")
	stest <- read.table("subject_test.txt")
	colnames(stest) <- c("suid")
	xtest <- cbind(xtest, stest, ytest)
	testrows <- nrow(xtest)

## now merge both data sets to make one single large data frame
	
	xtotal <- rbind(xtrain, xtest)
	totalrows <- nrow(xtotal)

## Use descriptive activity names to name the activities in the data set
## Appropriately label the data set with descriptive variable names

	colnames(xtotal) <- ycols[,2]

## Extract only the measurements on the mean and standard deviation for each measurement
## subset select columns only

	myvars <- c("tBodyAcc-mean()-X","tBodyAcc-mean()-Y","tBodyAcc-mean()-Z","tBodyAcc-std()-X","tBodyAcc-std()-Y","tBodyAcc-std()-Z","tGravityAcc-mean()-X","tGravityAcc-mean()-Y","tGravityAcc-mean()-Z","tGravityAcc-std()-X","tGravityAcc-std()-Y","tGravityAcc-std()-Z","tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y","tBodyAccJerk-mean()-Z","tBodyAccJerk-std()-X","tBodyAccJerk-std()-Y","tBodyAccJerk-std()-Z","tBodyGyro-mean()-X","tBodyGyro-mean()-Y","tBodyGyro-mean()-Z","tBodyGyro-std()-X","tBodyGyro-std()-Y","tBodyGyro-std()-Z","tBodyGyroJerk-mean()-X","tBodyGyroJerk-mean()-Y","tBodyGyroJerk-mean()-Z","tBodyGyroJerk-std()-X","tBodyGyroJerk-std()-Y","tBodyGyroJerk-std()-Z","tBodyAccMag-mean()","tBodyAccMag-std()","tBodyAccJerkMag-mean()","tBodyAccJerkMag-std()","tBodyGyroMag-mean()","tBodyGyroMag-std()","fBodyAcc-mean()-X","fBodyAcc-mean()-Y","fBodyAcc-mean()-Z","fBodyAcc-std()-X","fBodyAcc-std()-Y","fBodyAcc-std()-Z","fBodyAccJerk-mean()-X","fBodyAccJerk-mean()-Y","fBodyAccJerk-mean()-Z","fBodyAccJerk-std()-X","fBodyAccJerk-std()-Y","fBodyAccJerk-std()-Z","fBodyGyro-mean()-X","fBodyGyro-mean()-Y","fBodyGyro-mean()-Z","fBodyGyro-std()-X","fBodyGyro-std()-Y","fBodyGyro-std()-Z","fBodyGyro-meanFreq()-X","fBodyGyro-meanFreq()-Y","fBodyGyro-meanFreq()-Z","fBodyAccMag-mean()","fBodyAccMag-std()","fBodyBodyAccJerkMag-mean()","fBodyBodyAccJerkMag-std()","fBodyBodyAccJerkMag-meanFreq()","fBodyBodyGyroMag-mean()","fBodyBodyGyroMag-std()","fBodyBodyGyroMag-meanFreq()","fBodyBodyGyroJerkMag-meanFreq()", "suid", "acid")

## subset only the required columns
	xtotal <- xtotal[, myvars]

## Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
## 6 acitivities and 30 subjects - fetch them from txt files to make sure
## activitylist <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
## subjectlist <- unique(strain) 30 subjects

	xmelt <- melt(xtotal, id.vars=c("suid", "acid"))
	xtidy <- dcast(data = xmelt, suid+acid ~ myvars, mean)
	colnames(xtidy) <- c("subject", "activity", "Values", "Values")

## write a file with tidy data set
	filename <- c("tidyfile")
	write.table(xtidy, file = filename, row.names=FALSE, col.names=TRUE, quote = FALSE)


## Hurray!
## Thanks Jeff and David, and Hadley
## end of script run_analysis
}
