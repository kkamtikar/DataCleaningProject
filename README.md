DataCleaningProject
===================
Project for Getting and Cleaning Data Course in data Specialization on Coursera

**Background of the project:**

The data being discussed in the project is collected from accelerometer from the Samsung Galaxy S smartphone. Detailed description is available at - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data required and in the scope of the project can be downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Extract the data to UCI HAR Dataset or data/ UCI HAR dataset.
It is a zip file with "UCI HAR Dataset" folder which contains all the required data sets.
X_test,y_test and subject_test files from test folder and  X_train, y_train and subject_train from train folder are the primary data sets used on this project.

y_train and y_test contain activity IDs and subject_train and suvject_test contain SubjectIDs.
Details about the activities can be found in activity_labels. features and features_info provide information about the features used in the project.


**Files used in the project:**

*CodeBook.md* has details about all the data elements used in the analysis process (run_analysis) and variables in TidyData - the file containing final output data set.
It also provides detailed explanation of steps used in the the analysis process (run_analysis).

As described on the Coursera project description - 
The solution has 5 parts that address the pieces in the assignment. 
The run_analysis.R-

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


**Notes:**
1. Before starting the process, set the *working directory* to where the extracted "UCI HAR Dataset" folder is. It is assumed to be working directory for all the paths in the R file.
For example, "read.table("./train/X_train.txt", header=FALSE, sep="")" reads from UCI HAR Dataset --> train --> X_train.txt.

2. Though a sample TidyData.txt is available for viewing at the same level this README is, actual execution of the program will generate the output file at the current working directory level (which would be UCI HAR Dataset based on the working folder assumption).
