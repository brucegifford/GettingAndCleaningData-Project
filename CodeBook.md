Coursera Course - "Getting And Cleaning Data" - Class Project
==============================

Raw Source data
-------------------
The Raw data for this data set comes from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This zip file contains a readme.txt file that describes the experiments that were done and the data. Here is a summary of the raw data.

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Transforming the data - Raw to Summary
-------------------
Given the raw data, the provided scripts go through this process to generate the tidy data set.

* Read in the raw data from the test and train data sets
* Merge the test and training data into a single data set
* Read the feature names for the raw data
* Transform the feature names as described in Variable name cleanup below
* Attach the transformed names as column names to the merged data
* Read in the activity data and combine it with the feature data
* Read in the subject data and combine it with the feature data
* Transform the numerical version of the activity data into descriptive human friendly text
* Same the data set as merged.csv
* Extract just the columns from the dataset that are for mean and standard deviation. This is determined by looking for -mean() or -std() in the raw data feature names
* Save the extracted data as extracted.csv
* Create a summary data set which contains the average feature value per subject and per activity
* Write this summary data set to the file summary.txt file


Summary data
-------------------
- activity - name of the activity for this record
- subject - number of subject doing the activity for this record
- TimeBodyAccXMean - average of tBodyAcc-mean()-X for given activity and subject
- TimeBodyAccYMean - average of tBodyAcc-mean()-Y for given activity and subject
- TimeBodyAccZMean - average of tBodyAcc-mean()-Z for given activity and subject
- TimeBodyAccXStandardDeviation - average of tBodyAcc-std()-X for given activity and subject
- TimeBodyAccYStandardDeviation - average of tBodyAcc-std()-Y for given activity and subject
- TimeBodyAccZStandardDeviation - average of tBodyAcc-std()-Z for given activity and subject
- TimeGravityAccXMean - average of tGravityAcc-mean()-X for given activity and subject
- TimeGravityAccYMean - average of tGravityAcc-mean()-Y for given activity and subject
- TimeGravityAccZMean - average of tGravityAcc-mean()-Z for given activity and subject
- TimeGravityAccXStandardDeviation - average of tGravityAcc-std()-X for given activity and subject
- TimeGravityAccYStandardDeviation - average of tGravityAcc-std()-Y for given activity and subject
- TimeGravityAccZStandardDeviation - average of tGravityAcc-std()-Z for given activity and subject
- TimeBodyAccJerkXMean - average of tBodyAccJerk-mean()-X for given activity and subject
- TimeBodyAccJerkYMean - average of tBodyAccJerk-mean()-Y for given activity and subject
- TimeBodyAccJerkZMean - average of tBodyAccJerk-mean()-Z for given activity and subject
- TimeBodyAccJerkXStandardDeviation - average of tBodyAccJerk-std()-X for given activity and subject
- TimeBodyAccJerkYStandardDeviation - average of tBodyAccJerk-std()-Y for given activity and subject
- TimeBodyAccJerkZStandardDeviation - average of tBodyAccJerk-std()-Z for given activity and subject
- TimeBodyGyroXMean - average of tBodyGyro-mean()-X for given activity and subject
- TimeBodyGyroYMean - average of tBodyGyro-mean()-Y for given activity and subject
- TimeBodyGyroZMean - average of tBodyGyro-mean()-Z for given activity and subject
- TimeBodyGyroXStandardDeviation - average of tBodyGyro-std()-X for given activity and subject
- TimeBodyGyroYStandardDeviation - average of tBodyGyro-std()-Y for given activity and subject
- TimeBodyGyroZStandardDeviation - average of tBodyGyro-std()-Z for given activity and subject
- TimeBodyGyroJerkXMean - average of tBodyGyroJerk-mean()-X for given activity and subject
- TimeBodyGyroJerkYMean - average of tBodyGyroJerk-mean()-Y for given activity and subject
- TimeBodyGyroJerkZMean - average of tBodyGyroJerk-mean()-Z for given activity and subject
- TimeBodyGyroJerkXStandardDeviation - average of tBodyGyroJerk-std()-X for given activity and subject
- TimeBodyGyroJerkYStandardDeviation - average of tBodyGyroJerk-std()-Y for given activity and subject
- TimeBodyGyroJerkZStandardDeviation - average of tBodyGyroJerk-std()-Z for given activity and subject
- TimeBodyAccMagMean - average of tBodyAccMag-mean() for given activity and subject
- TimeBodyAccMagStandardDeviation - average of tBodyAccMag-std() for given activity and subject
- TimeGravityAccMagMean - average of tGravityAccMag-mean() for given activity and subject
- TimeGravityAccMagStandardDeviation - average of tGravityAccMag-std() for given activity and subject
- TimeBodyAccJerkMagMean - average of tBodyAccJerkMag-mean() for given activity and subject
- TimeBodyAccJerkMagStandardDeviation - average of tBodyAccJerkMag-std() for given activity and subject
- TimeBodyGyroMagMean - average of tBodyGyroMag-mean() for given activity and subject
- TimeBodyGyroMagStandardDeviation - average of tBodyGyroMag-std() for given activity and subject
- TimeBodyGyroJerkMagMean - average of tBodyGyroJerkMag-mean() for given activity and subject
- TimeBodyGyroJerkMagStandardDeviation - average of tBodyGyroJerkMag-std() for given activity and subject
- FrequencyDomainBodyAccXMean - average of fBodyAcc-mean()-X for given activity and subject
- FrequencyDomainBodyAccYMean - average of fBodyAcc-mean()-Y for given activity and subject
- FrequencyDomainBodyAccZMean - average of fBodyAcc-mean()-Z for given activity and subject
- FrequencyDomainBodyAccXStandardDeviation - average of fBodyAcc-std()-X for given activity and subject
- FrequencyDomainBodyAccYStandardDeviation - average of fBodyAcc-std()-Y for given activity and subject
- FrequencyDomainBodyAccZStandardDeviation - average of fBodyAcc-std()-Z for given activity and subject
- FrequencyDomainBodyAccJerkXMean - average of fBodyAccJerk-mean()-X for given activity and subject
- FrequencyDomainBodyAccJerkYMean - average of fBodyAccJerk-mean()-Y for given activity and subject
- FrequencyDomainBodyAccJerkZMean - average of fBodyAccJerk-mean()-Z for given activity and subject
- FrequencyDomainBodyAccJerkXStandardDeviation - average of fBodyAccJerk-std()-X for given activity and subject
- FrequencyDomainBodyAccJerkYStandardDeviation - average of fBodyAccJerk-std()-Y for given activity and subject
- FrequencyDomainBodyAccJerkZStandardDeviation - average of fBodyAccJerk-std()-Z for given activity and subject
- FrequencyDomainBodyGyroXMean - average of fBodyGyro-mean()-X for given activity and subject
- FrequencyDomainBodyGyroYMean - average of fBodyGyro-mean()-Y for given activity and subject
- FrequencyDomainBodyGyroZMean - average of fBodyGyro-mean()-Z for given activity and subject
- FrequencyDomainBodyGyroXStandardDeviation - average of fBodyGyro-std()-X for given activity and subject
- FrequencyDomainBodyGyroYStandardDeviation - average of fBodyGyro-std()-Y for given activity and subject
- FrequencyDomainBodyGyroZStandardDeviation - average of fBodyGyro-std()-Z for given activity and subject
- FrequencyDomainBodyAccMagMean - average of fBodyAccMag-mean() for given activity and subject
- FrequencyDomainBodyAccMagStandardDeviation - average of fBodyAccMag-std() for given activity and subject
- FrequencyDomainBodyBodyAccJerkMagMean - average of fBodyBodyAccJerkMag-mean() for given activity and subject
- FrequencyDomainBodyBodyAccJerkMagStandardDeviation - average of fBodyBodyAccJerkMag-std() for given activity and subject
- FrequencyDomainBodyBodyGyroMagMean - average of fBodyBodyGyroMag-mean() for given activity and subject
- FrequencyDomainBodyBodyGyroMagStandardDeviation - average of fBodyBodyGyroMag-std() for given activity and subject
- FrequencyDomainBodyBodyGyroJerkMagMean - average of fBodyBodyGyroJerkMag-mean() for given activity and subject
- FrequencyDomainBodyBodyGyroJerkMagStandardDeviation - average of fBodyBodyGyroJerkMag-std() for given activity and subject


Variable name Cleanup
-------------------
The feature (column/variable) names that were provided in the features.txt file with the data do not meet the course critera for descriptive and human readable names. I personally would like slightly different names then what I ended up with but they are all procedurally generatd so they are repeatable by the script. I felt that was a good thing. In order to make them more descriptive, I used these steps.

* Removed dashes '-' from the names
* Removed parentheses '()' from the names
* Changed the 't' prefix on the names to 'Time' so that it was clear what it meant
* Changed the 'f' prefix on the names to 'FrequencyDomain' so it was clear what it meant
* Changed 'mean' in the name to upper case 'Mean' so it was properly camel cased in the name
* Changed 'std' in the name to 'StandardDeviation' so it was descriptive and properly camel cased in the name
* Moved the trailing 'X', 'Y' and 'Z' in the names to come before 'Mean' and 'StandardDeviation' so that it was connected to the rest of the description
* Removed the underscores '_' from the activity names
