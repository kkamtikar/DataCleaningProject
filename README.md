DataCleaningProject
===================
Project for Getting and Cleaning Data Course in data Specialization on Coursera

**Project Backgroundt:**

The data being discussed in the project is collected from accelerometer from the Samsung Galaxy S smartphone. Detailed description is available at - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data required and in the scope of the project can be downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
It is a zip file with "UCI HAR Dataset" folder which contains all the required data sets.

X_test,y_test and subject_test files from test folder and  X_train, y_train and subject_train files from train folder, activity_labels and features are the primary data sets used in this project. 

y_train and y_test contain activity IDs and subject_train and subject_test contain SubjectIDs.
Details about the activities can be found in activity_labels. features and features_info provide information about the features used in the project.


**Files in the project:**
Create data folder in working directory. Copy all the contents (folders and files) from "UCI HAR Dataset" extracted from the zip file.

All these files/folders listed below are present in the working directory.
Readme.md, CodeBook.md, run_analysis.R, data folder, and TidyData.txt

* Input data: data folder files
* Data Analysis: run_analysis.R
* Output: TidyData.txt is created when the analysis is executed.


* *README.md* - This file that provides project background, details about files used, detailed explanation of the analysis (run_analysis.R) and notes.

* *CodeBook.md* has details about all the data elements used in the analysis process (run_analysis) and variables in TidyData - the file containing final output data set. It also provides overview of the steps used in the the analysis process (run_analysis). For detailed explanation refer to the section "Explanation of steps performed during the analysis" below.

* *run_analysis.R* 
As described in the Coursera project description - 
The solution has 5 parts that address the pieces in the assignment. 
The run_analysis.R-

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

* *TidyData.txt* - The final tidy data output containing average values for each variable for a given SubjectID and Activity generated as a result of execution of data analysis.

* *data* - (Create data folder in the working directory.) Extract the contents of "UCI HAR Dataset" (from the zipped file mentioned above) and copy the contents - test and train folders with data files, activity_labels, features, features_info etc. to the data folder.

**Notes:**

1. Before starting the process, set the *working directory* and paths appropriately. Make sure the data is available in the data folder (or any other place that the data is downloaded). Based on the working directory and the location for data files, ensure that all the paths in the R file are set correctly.
In this case the assumption is that the data will be copied over to the data folder (as mentioned earlier),
For example, 
"read.table("./data/train/X_train.txt", header=FALSE, sep="")" reads from data folder in the working directory --> train --> X_train.txt.

2. TidyData.txt is available for viewing in the working directory. On actual execution of the run_analysis.R program (also present in the working directory) TidyData.txt file is generated.


  ## Explanation of steps performed during the analysis

setwd to the desired location. contents of "UCI HAR Dataset" are copied to "data" folder present in working directory.
This is the assumption for all the paths in the run_analysis.R.

--------------------------------------------------------------------------------------
PART 1
--------------------------------------------------------------------------------------
1. xtrain <- read.table("./data/train/X_train.txt", header=FALSE, sep="")
Read X_train.txt data into xtrain using read.table. Set the header to FALSE as X_train.txt does not contain header row. By default, space is considered as the separator. Note: Do NOT set explicit space sep =" ".
xtrain data frame has 7352 rows and 561 columns.

2. xtest <- read.table("./data/test/X_test.txt", header=FALSE, sep="")
Read X_test.txt data into xtest using read.table as described in step 1. 
xtest data frame has 2947 rows and 561 columns.

3. Combine the rows of the two data frames in step 1 and 2. The number of columns for xtrain and xtest is same and rbind operation can be performed on the two sets.
Store the result containing rows from xtrain and xtest (in that order).
clubx <- rbind(xtrain,xtest)

clubx contains 10299 rows and 561 columns. [ First 7352 rows from xtrain followed by 2947 rows from xtest. ]

Similarly read data from y_train.txt and y_test.txt into data frames and combine the rows from 
those data frames into a single data frame called cluby.

4. ytrain <- read.table("./data/train/y_train.txt", header=FALSE, sep="")
Read y_train.txt data into ytrain using read.table. 

5. ytest <- read.table("./data/test/y_test.txt", header=FALSE, sep="")
Read t_test.txt data into ytest using read.table.

6. cluby <- rbind(ytrain, ytest)
cluby contains 10299 rows and 1 column. 

Similarly read data from subject_train.txt and subject_test.txt into data frames and combine the rows from those data frames into a single data frame called clubSub.

7. subTrain <- read.table("./data/train/subject_train.txt", header=FALSE, sep="")
Read data from subject_train.txt into subTrain using read.table. This data frame has 7352 rows and only 1 column for the 30 subjects (with IDs 1 to 30) who participated

8. subTest <- read.table("./data/test/subject_test.txt", header=FALSE, sep="")
Read data from subject_train.txt into subTrain using read.table. This data frame has 2947 rows and only 1 column for the 30 subjects (with IDs 1 to 30) who participated

9. clubSub <- rbind(subTrain, subTest)
clubSub has all the rows for subject IDs from both training and test sets.

10. mergeDataSet <- cbind(cbind(cluby, clubSub), clubx)
Create a data set which combines all the columns of cluby and clubSub and combines the results with clubx.
It is important to note the order. The inner cbind combines the cluby and clubSub first in that order.
cluby and clubSub each have single column for activities and subject IDs respectively. clubx has 561 columns.
After this step, the mergeDataSet will contain all the training and testing data sets combined with their activities and subject IDS details, thus making it a 563 column 
data frame [ 2 + 561 ].

11. The data frame needs to be assigned with column names corresponding to the features/ variables listed in features.txt.
features <- read.table("./data/features.txt", header=FALSE, sep="")
Read data from features.txt into features data frame.

12. featuresNames <- c("Activity", "SubjectID",as.character(features[,2]))
features data frame described in step 11 has ID and feature Name details. These feature names in column 2 can be used to assign column name values to the mergeDataset.
However, features[,2] is of type factor and cannot be directly assigned to the list of characters.
So it needs to converted to character using as.character(features[,2]). features.txt has 561 features but we need to add column names for Activity and Subject ID before the feature names to match the ordered data as described in step 10 [ 2 + 561 ].

13. Assign these featuresNames as column names to the mergeDataSet data frame using colnames.
colnames(mergeDataSet) <- featuresNames

--------------------------------------------------------------------------------------
PART 2
--------------------------------------------------------------------------------------
Create a subset of the features for mean
Assumption: Based on the information in features_info.txt, mean(): Mean value. There are some features that contain the term "mean" but they do not necessarily depict mean feature.
For e.g. meanFreq() and angle(). These are listed as separate features. So for the purposes of this analysis, meanSet data set ignores such cases and considers only cases which are related to mean(). 

14. meanSet <- mergeDataSet[,grep("mean()", colnames(mergeDataSet),fixed=TRUE)]
Using grep the exact pattern "mean()" is matched against the feature names/ column names of the mergeDataset using fixed = TRUE.
This ignores string matches such as meanfreq, angle(X,gravityMean) intentionally.
A subset called meanSet is created which contains only columns that match the afore mentioned mean features. It contains 33 columns.

15. Similarly, a subset containing features corresponding to std() is created. It contains 33 columns.
stdSet <- mergeDataSet[,grep("std()", colnames(mergeDataSet),fixed=TRUE)]

16. Similarly, a subset containing Activity and Subject ID is also created.
act_sub <- mergeDataSet[,grep("Activity|SubjectID", colnames(mergeDataSet))]

17. mean_std_set <- cbind(cbind(act_sub,meanSet),stdSet)
As described in step 10, nested cbinds are used to combine columns from all the three data frames. 
mean_std_set data frame with columns for Activity and SubjectID, and features corresponding to "mean()", "std()" (in that order)
 
-------------------------------------------------------------------------------------- 
PART 3
--------------------------------------------------------------------------------------
18. Read activity data from activity_labels.txt into activityData data frame.
activityData <- read.table("./data/activity_labels.txt", header=FALSE, sep="")

19. activityData contains 2 columns and column 2 contains labels which need to be mapped/assigned to the data in the mean_std_set's Activity column. 
As described in step 12, 
activity_labels <- activityData[,2]  

20. Assign the activity labels to the entries corresponding to the Activity column in the mean_std_set.
There are 6 activities defined by 6 levels.
mean_std_set$Activity <- factor(mean_std_set$Activity, levels=c(1,2,3,4,5,6), labels=activity_labels)
After this step, the numbers in the Activity column in mean_std_set are replaced with the activity labels such as 1 for WALKING, 5 for STANDING etc.
 
PART 4
--------------------------------------------------------------------------------------
These steps are performed to make the column names more descriptive and readable.

21. Using gsub replace the first occurrence of t if the feature name begins with t to 'time'. '^t' is used to accomplish this replacement.
descTimeNames <- gsub("^t","time", colnames(mean_std_set))

22. Similarly, feature names starting with 'f' are updated to start with 'freq'. 
Use the updated set - descTimeNames- created in step 21.
descTimeFreqNames <- gsub("^f","freq",descTimeNames)

23. As the "()" parentheses are not intuitive, replace them with fun - abbreviation for function.
Perform gsub on descTimeFreqNames created in step 22.
desc_labels <- gsub("\\()","fun",descTimeFreqNames)

24. Apply these final updated descriptive labels to the data set's column names
colnames(mean_std_set) <- desc_labels

-------------------------------------------------------------------------------------- 
PART 5
--------------------------------------------------------------------------------------
25. reshape2 package is used to melt data in the desired form.
dataMelt <- melt(mean_std_set,id=c("SubjectID","Activity"))
For each SubjectID and Activity, value for each variable will be listed.
dataMelt has 4 columns - SubjectID, Activity, variable and value corresponding to each of these combinations. 

26. The data is transformed from wide to long format. Using summarise from dplyr package, tidyData is created.
With the melted data - dataMelt created in step 25, group_by is used for each of the SubjectID, Activity and variable and mean is calculated on the value for each combination. The mean column is displayed as "average".
tidyData <- summarise(group_by(dataMelt, SubjectID, Activity,variable), average=mean(value))

27. Write the tidyData into to txt file with row.names=FALSE and separator set to space.
write.table(tidyData,file="./TidyData.txt",row.names=FALSE, sep=" ")
Check the created file at the specified location.
Confirm that the data is in tidy format. There is one row for each observation and one column for each variable.
