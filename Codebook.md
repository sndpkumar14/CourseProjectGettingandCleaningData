## Codebook for Getting and Cleaning Data Course project

This codebook describes meta data on input datasets, output datasets and all the steps needed for processing
It has dictionary of all the variables used in tidy data.

The processing uses 2 sets of data:
- test data 
- train data 

It combines them with *activity* and *subject* data.


Test and Train Data Description

Each of test and train data files contain a number of variables. These have been combined with activity and subject data.

**Test Data** has 3 main files:
- X_test.txt
- y_test.txt
- subject_test.txt

Test Data has 2947 observations amd 561 column variables.

**Train Data** has 3 main filed:
- X-train.txt
- y_train.txt
- subject_train.txt

Train Data has 7352 observations and 561 column variables.


**Activity Data** has 6 types of activities:
- 1 WALKING
- 2 WALKING_UPSTAIRS
- 3 WALKING_DOWNSTAIRS
- 4 SITTING
- 5 STANDING
- 6 LAYING

** Subject Data** has id of subjects which provided the observations.


There are 2 outputs - one long dataset and one **tidy** dataset

Long dataset has select number of variables which related to mean and std variables, 66 in total plus 2 variables for subject and activity.

Long Dataset contains following columns
- subject
- activity
- values of mean and std variables

Tidy dataset contains *average* values per set of subject and activity.

The *t* prefix indicates time domain signals, while *f* prefix indicates frequency domain signals.

The columns contain average values of the following variables:
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

Note that tidy data set satisfies the 3 conditions (as learnt from http://vita.had.co.nz/papers/tidy-data.pdf):

- Each variable forms a column.
- Each observation forms a row.
- Each type of observational unit forms a table.

The tidy dataset contains 180 observations and 68 variables in total - 66 variables, 2 for subject and activity id.

End of codebook
