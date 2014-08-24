GettingAndCleaningDataCoursera
==============================

Cousera Course - Getting and Cleaning Data Project

**Last updated**: August 24, 2014

## Software/Platform Run Information

**R version**: 3.1.1 (2014-07-10) -- "Sock it to Me" Copyright (C) 2014 The R Foundation for Statistical Computing

**Platform**: Ubuntu 14.04 LTS x86_64-pc-linux-gnu (64-bit)

**R Packages**: plyr for function ddply

## Problem/Question

DataSet: Folder [UCI HAR Dataset]

Create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

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
18. Formattig the header and output the tidy data to a Table

## How to run the R script

From the Terminal in Mac/Linux or Git Bash/Command Prompt in Windows, please run the following command:

```sh
R CMD BATCH run_analysis.R
```

## References

1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
2. [Course Lecture Notes] (requires a Coursera account and course enrollment)
3. R Help Commands using **?** and **help.search**

## Questions/Feedback

Please reach out to me at [Anchit Choudhry]

[UCI HAR Dataset]:https://github.com/anchit-choudhry/GettingAndCleaningDataCoursera/tree/master/UCI%20HAR%20Dataset
[Anchit Choudhry]:mailto:anchit.choudhry@gmail.com
[Course Lecture Notes]:https://class.coursera.org/getdata-006/lecture
