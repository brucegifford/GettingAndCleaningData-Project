mergeFilesLabelAndExtract <- function()
{
  # read the labels file for the feature names
  print("Reading feature labels")
  featureLabelsData <- readFeatureLabels()
  # get the columns to keep that have -mean() and -std() in them
  keepColumns <- featureLabelsData$keepCols
  # add entries for the new activity and sample columns we are adding
  keepColumns <- c(featureLabelsData$keepCols, length(featureLabelsData$labels)+1, length(featureLabelsData$labels)+2)

  print("Reading test data set")
  test1 <- read.table("./test/X_test.txt", header = FALSE, sep = "", quote = "\"",
           dec = ".", fill = TRUE, comment.char = "", col.names = featureLabelsData$labels)
  testAct <- read.table("./test/y_test.txt", header = FALSE, sep = "", quote = "\"",
                      dec = ".", fill = TRUE, comment.char = "")
  test1$activity <- testAct$V1
  testSubj <- read.table("./test/subject_test.txt", header = FALSE, sep = "", quote = "\"",
                        dec = ".", fill = TRUE, comment.char = "")
  test1$subject <- testSubj$V1
  
  print("Reading train data set")
  train1 <- read.table("./train/X_train.txt", header = FALSE, sep = "", quote = "\"",
                      dec = ".", fill = TRUE, comment.char = "", col.names = featureLabelsData$labels)
  trainAct <- read.table("./train/y_train.txt", header = FALSE, sep = "", quote = "\"",
                        dec = ".", fill = TRUE, comment.char = "")
  train1$activity <- trainAct$V1
  trainSubj <- read.table("./train/subject_train.txt", header = FALSE, sep = "", quote = "\"",
                         dec = ".", fill = TRUE, comment.char = "")
  train1$subject <- trainSubj$V1

  print(paste("Length of test1", nrow(test1), "Length of train1", nrow(train1)))

  print("Merging test and train data sets")
  merged <- rbind( test1, train1 )
  print( dim(merged) )
  
  print("Converting activity numbers to labels")
  merged$activity <- convertActivityToText(merged$activity)

  print("Writing merged data set")
  write.table( merged, "merged.csv", sep=",",row.names=FALSE)
  
  print("Creating and writing extracted data set")
  extracted <- merged[,keepColumns]
  print( dim(extracted) )
  write.table( extracted, "extracted.csv", sep=",",row.names=FALSE)

  print("Completed")
}

cleanUpFeatureLabels <- function(labels)
{
  labels <- sub("^t", "Time", labels) # turn the t prefix into Time
  labels <- sub("^f", "FrequencyDomain", labels) # turn the f prefix character into FrequencyDomain
  labels <- sub("-mean\\(\\)-X", "XMean", labels) # turn -mean() in names to Mean
  labels <- sub("-mean\\(\\)-Y", "YMean", labels) # turn -mean() in names to Mean
  labels <- sub("-mean\\(\\)-Z", "ZMean", labels) # turn -mean() in names to Mean
  labels <- sub("-mean\\(\\)", "Mean", labels) # turn -mean() in names to Mean
  labels <- sub("-std\\(\\)-X", "XStandardDeviation", labels) # turn -std() in names to StandardDeviation
  labels <- sub("-std\\(\\)-Y", "YStandardDeviation", labels) # turn -std() in names to StandardDeviation
  labels <- sub("-std\\(\\)-Z", "ZStandardDeviation", labels) # turn -std() in names to StandardDeviation
  labels <- sub("-std\\(\\)", "StandardDeviation", labels) # turn -std() in names to StandardDeviation
  labels <- sub("-", "", labels) # remove dashes in the names
  #  print(labels)
  labels
}

readFeatureLabels <- function()
{
  labelsF <- read.table("./features.txt", header = FALSE, sep = "", )
  meanCols <- grep("-mean\\(\\)",labelsF$V2)
  stdCols <- grep("-std\\(\\)",labelsF$V2)
  keepCols <- sort(c(meanCols,stdCols))
  #print(length(keepCols))
  #print( labelsF$V2[keepCols])
  cleanedLabels <- cleanUpFeatureLabels(labelsF$V2)
  list("labels" = cleanedLabels, "keepCols" = keepCols)
}

readActivityLabels <- function()
{
  actLabT <- read.table("./activity_labels.txt", header = FALSE, sep = "", )
  actLab <- actLabT$V2
  actLab <- sub("_", "", actLab) # remove underscores in the names
  actLab
}

convertActivityToText <- function(activityNums)
{
  actLabs <- readActivityLabels()
  
  for(i in seq_along(actLabs)) {
    activityNums[activityNums %in% i] <- actLabs[i]
  }

  activityNums
}

makeSummaryDataset <- function()
{
  actLabs <- readActivityLabels()
  extracted <- read.csv("extracted.csv", header = TRUE )
#  ddply(iris, .(Species), numcolwise(mean))
  summary <- ddply(extracted, c("subject", "activity"), numcolwise(mean))
  write.table( summary, "summary.txt", sep=",",row.names=FALSE)
}

setup_Project <- function()
{
  install.packages("plyr")
  library(plyr)

  destDir <- "~/Training/Getting and Cleaning Data/Project/UCI HAR Dataset"
  if(!file.exists(destDir))
    dir.create(destDir)
  setwd(destDir)
}

downloadData_Q3Q5 <- function()
{
#  if(!file.exists("./data")){dir.create("./data")}
#  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
#  download.file(fileUrl,destfile="./data/FGDP.csv",method="curl")
#  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
#  download.file(fileUrl,destfile="./data/FEDSTATS_Country.csv",method="curl")
}