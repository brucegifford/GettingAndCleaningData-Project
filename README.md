Coursera Course - "Getting And Cleaning Data" - Class Project
==============================
This is the repository for the class project for the Coursera "Getting and Cleaning Data" class. 


Files
-------------------
In the repo, you will find these files:

__readme.md__ - this file which describes the files in the repo and the scripts in the run_analysis.R file for how to generate the data

__CodeBook.md__ - describes the data in the the final file

__run_analysis.R__ - this file contains the scripts that are run to complete the project and create the tidy dataset.

__merged.csv__ - this is a csv file that contains the data merged from the test and train data sets. It contains columns for all of the features as well a column for the activity and subject

__extracted.csv__ - this file is a subset of merged.csv. It only contains the columns that are mean and standard deviation columns from the original data and the activity and subject columns.

__summary.txt__ - this is the final tidy data file for the project. Instead of containing multiple samples for each feature, the feature entry is the average of the records per activity and per subject.


The Script functions - run_analysis.R
-------------------

__Get the data__
To build the tidy dataset, you must first download and unzip the source data. The link to the data file is: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

__Source the script file__ Once the data is in place, you will want to source the script file to load the functions that are run to process the data. On my system, it is done by executing this command:
```
source('~/Training/Getting and Cleaning Data/Project/run_analysis.R')
```

__setup_Project()__ - once the data is in place, run the setup_Project() command once. It only needs to be run once. It will load and install the plyr package if needed and it sets the working directory to where I installed the data. You will need to update the directory path used in this function to match where the data lives on your system.
```
setup_Project()
```

__mergeFilesLabelAndExtract()__ Run the mergeFilesLabelAndExtract() function. 
```
mergeFilesLabelAndExtract()
```
This function does the work of reading in and merging the test and training data and setting up the variable names nicely. It writes the merged.csv file which contains the entire data set (all columns from the original data) with cleaned up names and with descriptive text values for the activity column. It then extracts just the columns with mean and standard deviation values as well as the activity and subject columns. This extracted data is written to extracted.csv
This function calls readFeatureLabels() and convertActivityToText() to do some of the work. 

__readFeatureLabels()__ - this function reads the features.txt file to create a character vector of feature column names. It calls cleanUpFeatureLabels() to tidy up the names.

__cleanUpFeatureLabels()__ - this function cleans up the names of the feature columns. See the "Cleanup" section below on what is done to clean up the names.

__convertActivityToText()__- this function takes the vector of the activity column from the merged data frame and converts the integer entries into descriptive text. The text that used is read from the activity_labels.txt file and the underscores are removed to make it tidy.

__makeSummaryDataset()__ - once you have called mergeFilesLabelAndExtract() to create the extracted.csv file, you should call this function.
```
makeSummaryDataset()
```
It will read in the extracted.csv file and create a summary data set which contains the average feature value per subject and per activity. This summary data set is written to the summary.txt file. Note that it is a .csv file but is written as a .txt so that it can be uploaded to coursera.


The Cleanup
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
