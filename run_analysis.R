# Get the column names of the UCI Dataset from the features.txt file
columnNames <- read.table("UCI HAR Dataset/features.txt")

# Remove the column index 1 from the columnNames data to have only the column name V2(description) data
columnNames <- columnNames[,2]

# Get required column indexes only on the mean and standard deviation measurements (mean() and std() only)
prunedColumns <- grep("mean()|std()", columnNames, ignore.case=TRUE, value=TRUE)
prunedColumns <- gsub(pattern = ",", replacement = ".", x = prunedColumns, fixed = TRUE)
prunedColumns <- gsub(pattern = "-", replacement = ".", x = prunedColumns, fixed = TRUE)
prunedColumns <- gsub(pattern = "(", replacement = ".", x = prunedColumns, fixed = TRUE)
prunedColumns <- gsub(pattern = ")", replacement = ".", x = prunedColumns, fixed = TRUE)

# Get the Activity data from the activity_labels.txt file and assign appropriate label to it
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("ActivityId","Activity"))

###############################
# Training DataSet Processing
###############################

# Get the train Activity data from the y_train.txt file and assign appropriate label to it
trainActivityIds <- read.table("UCI HAR Dataset/train/y_train.txt", col.names="ActivityId")

# Get the train measurement data from the X_train.txt file and assign appropriate label to it
trainMeasurements <- read.table("UCI HAR Dataset/train/X_train.txt", col.names=columnNames)

# Eliminate unnecessary columns from the Dataset
trainMeasurements <- trainMeasurements[,prunedColumns]

# Get subject Train Ids Dataset from the subject_train.txt and assign appropriate label to it
trainSubjectIds <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="SubjectId")

# Column binding the train DataSets
trainDataSet <- cbind(trainSubjectIds, trainActivityIds, trainMeasurements)

##############################
# Test DataSet Processing
##############################

# Get the test Activity data from the y_train.txt file and assign appropriate label to it
testActivityIds <- read.table("UCI HAR Dataset/test/y_test.txt", col.names="ActivityId")

# Get the test measurement data from the X_train.txt file and assign appropriate label to it
testMeasurements <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=columnNames)

# Eliminate unnecessary columns from the Dataset
testMeasurements <- testMeasurements[,prunedColumns]

# Get subject Test Ids Dataset from the subject_test.txt and assign appropriate label to it
testSubjectIds <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="SubjectId")

# Column binding the test DataSets
testDataSet <- cbind(testSubjectIds, testActivityIds, testMeasurements)

# Combining the train and test Dataset
mergedData <-rbind(trainDataSet, testDataSet)

# Using ddply function to apply mean to each subset of data frame
library(plyr) 
averagedData <- ddply(mergedData, .(ActivityId,SubjectId), colwise(mean))
detach(package:plyr, unload=TRUE)

# Include activity description by merging
tidyData <- merge(activities, averagedData, by.x="ActivityId", by.y="ActivityId", all=TRUE)

# Formattig the header and output the tidy data to a Table
tableCols <- colnames(tidyData)
tableCols <- gsub(pattern = ".", replacement = "", x = tableCols, fixed = TRUE)
colnames(tidyData) <- tableCols
write.table(tidyData[, -1], file ="./tidyData.txt", row.names=FALSE)
