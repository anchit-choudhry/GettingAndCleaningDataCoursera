CodeBook - GettingAndCleaningDataCoursera
=========================================

## Steps/Approach

1. Get the column names of the UCI Dataset from the features.txt file
2. Remove the column index 1 from the columnNames data to have only the column name V2(description) data
3. Get required column indexes only on the mean and standard deviation measurements (mean() and std() only)
4. Get the Activity data from the activity_labels.txt file and assign appropriate label to it
5. Get the train Activity data from the y_train.txt file and assign appropriate label to it
6. Get the train measurement data from the X_train.txt file and assign appropriate label to it
7. Eliminate unnecessary columns from the Dataset
8. Get subject Train Ids Dataset from the subject_train.txt and assign appropriate label to it
9. Column binding the train DataSets
10. Get the test Activity data from the y_train.txt file and assign appropriate label to it
11. Get the test measurement data from the X_train.txt file and assign appropriate label to it
12. Eliminate unnecessary columns from the Dataset
13. Get subject Test Ids Dataset from the subject_test.txt and assign appropriate label to it
14. Column binding the test DataSets
15. Combining the train and test Dataset
16. Using ddply function to apply mean to each subset of data frame
17. Include activity description by merging
18. Formatting the header and output the tidy data to a Table


## Variables

columnNames = Table | Features.txt Features Data set
prunedColumns = String Vector | Column names containing Mean and Standard Deviations measurements
activities = Table | activity_labels.txt Activity List Data set
trainActivityIds = Vector | y_train.txt Train Subject Activiy Data set
trainMeasurements = Table | X_train.txt Train Subject Measurements Data set
trainSubjectIds = Vector | subject_train.txt Train Subject Ids Data set
trainDataSet = Table | Combined Columns of trainActivityIds + trainMeasurements + trainSubjectIds
testActivityIds = Vector | y_test.txt Test Subject Activiy Data set
testMeasurements = Table | X_test.txt Test Subject Measurements Data set
testSubjectIds = Vector | subject_test.txt Test Subject Ids Data set
testDataSet = Table |Combined Columns of testActivityIds + testMeasurements + testSubjectIds
mergedData = Table | Total combination of trainDataSet + testDataSet
averagedData = Table | Mean values of features in mergedData grouped by ActivityId,SubjctId
tidyData = Table | Human Readable name of Activity added to averagedData
tableCols = Vector | Human Readable formatted Column names for tidyData
