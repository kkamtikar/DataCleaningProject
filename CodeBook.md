Created Date: 19-Dec-2014

Created by: Kirti Kamtikar

https://github.com/kkamtikar

This file contains
* Data dictionary for run_analysis and tidyData.txt
* Explanation of the steps involved in the process

*xtrain*
    
    Data frame to store X_train.txt - data pertaining to training (Features as described in features.txt)
   
*xtest* 
   
    Data frame to store X_test.txt - data pertaining to testing (Features as described in features.txt)
   
*clubx*

    Data frame to store combined rows of xtrain and xtest data frames (in that order)

*ytrain*
  
    Data frame to store y_train.txt - training data pertaining to activities
  
       1..6 Activities (As described in activity_labels.txt)
   
         1 .1 WALKING
  
         2 .2 WALKING_UPSTAIRS
  
         3 .3 WALKING_DOWNSTAIRS
  
         4 .4 SITTING
  
         5 .5 STANDING
  
         6 .6 LAYING

*ytest*
  
    Data frame to store y_test.txt - testing data pertaining to activities
  
     1..6 Activities (As described in activity_labels.txt)
  
     1 .1 WALKING
  
     2 .2 WALKING_UPSTAIRS
  
     3 .3 WALKING_DOWNSTAIRS
  
     4 .4 SITTING
  
     5 .5 STANDING
  
     6 .6 LAYING
  
*cluby*
  
    Data frame to store combined rows of ytrain and ytest data frames (in that order)

*subTrain*
  
    Data frame to store subject_train.txt - training data pertaining to subjects
  
      1..30 IDs of participating subjects
  
*subTest*
  
    Data frame to store subject_test.txt - training data pertaining to subjects
  
     1..30 IDs of participating subjects

*clubSub*
  
    Data frame to store combined rows of subTrain and subTest data frames

*mergeDataSet*
   
    Data frame containing activity and Subject IDs combined with the training and testing data
   
*features*
   
    Data frame to store features.txt
   
*featuresNames*
 
    Character vector with the column name values to be assigned to mergeDataSet

*meanSet*
   
    Features with names containing "mean()"
  
*stdSet*

    Features with names containing "std()"
   
*act_sub*
   
    Features for Activity and SubjectID
   
*mean_std_set*
   
    Data frame with columns for Activity and SubjectID, and features corresponding to "mean()", "std()" (in that order)
  
*activityData*

    Data frame to store activity_labels.txt - data pertaining to activities.
	
*activity_labels*
   
    Factor corresponding to the activity labels in activity_labels.txt (As described in activity_labels.txt)
       
       .WALKING
       
       .WALKING_UPSTAIRS
       
       .WALKING_DOWNSTAIRS
       
       .SITTING
       
       .STANDING
       
       .LAYING
	   
*descTimeNames*
    
    Temporary storage for performing column names starting with 't' and replacing with 'time' to indicate time features
	
*descTimeFreqNames*
   
    Temporary storage for performing column names starting with 'f' and replacing with 'freq' to indicate frequency features

*desc_labels*
    
    Character vector with descriptive column names
	* Feature names starting with 't' updated to start with 'time'
	* Feature names starting with 'f' updated to start with 'freq'
	* "()" updated to fun - abbreviation of function

*dataMelt*

    Data frame to store melted data with Subject ID, Activity, variable, and value corresponding to each of these   combinations.
  
*tidyData*
  
    Data frame with summarised data grouped by given SubjectID, Activity, variable/ feature with corresponding mean values.
    The tidyData set includes
     * SubjectID
       ** 1..30 IDs of participating subjects
  
     * Activity
       ** .WALKING
       ** .WALKING_UPSTAIRS
       ** .WALKING_DOWNSTAIRS
       ** .SITTING
       ** .STANDING
       ** .LAYING
  
    * variable
    
        Variables/ feature names with descriptive names (Base feature names as described in features.txt and  features_info.txt)
  
    *  Changes to make names descriptive - 
       ** Feature names starting with 't' updated to start with 'time'
       ** Feature names starting with 'f' updated to start with 'freq'
       ** "()" updated to fun - abbreviation of function
 
    * List of all the features/ variables
       ** .timeBodyAcc-meanfun-X

       ** .timeBodyAcc-meanfun-Y

       ** .timeBodyAcc-meanfun-Z

       ** .timeGravityAcc-meanfun-X

       ** .timeGravityAcc-meanfun-Y

       ** .timeGravityAcc-meanfun-Z

       ** .timeBodyAccJerk-meanfun-X

       ** .timeBodyAccJerk-meanfun-Y

       ** .timeBodyAccJerk-meanfun-Z

       ** .timeBodyGyro-meanfun-X

       ** .timeBodyGyro-meanfun-Y

       ** .timeBodyGyro-meanfun-Z

       ** .timeBodyGyroJerk-meanfun-X

       ** .timeBodyGyroJerk-meanfun-Y

       ** .timeBodyGyroJerk-meanfun-Z

       ** .timeBodyAccMag-meanfun

       ** .timeGravityAccMag-meanfun

       ** .timeBodyAccJerkMag-meanfun

       ** .timeBodyGyroMag-meanfun

       ** .timeBodyGyroJerkMag-meanfun

       ** .freqBodyAcc-meanfun-X

       ** .freqBodyAcc-meanfun-Y

       ** .freqBodyAcc-meanfun-Z

       ** .freqBodyAccJerk-meanfun-X

       ** .freqBodyAccJerk-meanfun-Y

       ** .freqBodyAccJerk-meanfun-Z

       ** .freqBodyGyro-meanfun-X

       ** .freqBodyGyro-meanfun-Y

       ** .freqBodyGyro-meanfun-Z

       ** .freqBodyAccMag-meanfun

       ** .freqBodyBodyAccJerkMag-meanfun

       ** .freqBodyBodyGyroMag-meanfun
 
       ** .freqBodyBodyGyroJerkMag-meanfun
 
       ** .timeBodyAcc-stdfun-X

       ** .timeBodyAcc-stdfun-Y

       ** .timeBodyAcc-stdfun-Z

       ** .timeGravityAcc-stdfun-X

       ** .timeGravityAcc-stdfun-Y

       ** .timeGravityAcc-stdfun-Z

       ** .timeBodyAccJerk-stdfun-X

       ** .timeBodyAccJerk-stdfun-Y

       ** .timeBodyAccJerk-stdfun-Z

       ** .timeBodyGyro-stdfun-X

       ** .timeBodyGyro-stdfun-Y

       ** .timeBodyGyro-stdfun-Z

       ** .timeBodyGyroJerk-stdfun-X

       ** .timeBodyGyroJerk-stdfun-Y

       ** .timeBodyGyroJerk-stdfun-Z

       ** .timeBodyAccMag-stdfun

       ** .timeGravityAccMag-stdfun

       ** .timeBodyAccJerkMag-stdfun

       ** .timeBodyGyroMag-stdfun

       ** .timeBodyGyroJerkMag-stdfun

       ** .freqBodyAcc-stdfun-X

       ** .freqBodyAcc-stdfun-Y

       ** .freqBodyAcc-stdfun-Z

       ** .freqBodyAccJerk-stdfun-X
 
       ** .freqBodyAccJerk-stdfun-Y

       ** .freqBodyAccJerk-stdfun-Z

       ** .freqBodyGyro-stdfun-X

       ** .freqBodyGyro-stdfun-Y

       ** .freqBodyGyro-stdfun-Z

       ** .freqBodyAccMag-stdfun

       ** .freqBodyBodyAccJerkMag-stdfun

       ** .freqBodyBodyGyroMag-stdfun

       ** .freqBodyBodyGyroJerkMag-stdfun

   * average

      mean value for each variable for a given SubjectID and Activity
   
   ==================================================================
   Notes: Explanation of steps performed during the analysis.
   ==================================================================
  

--------------------------------------------------------------------------------------
PART 1
--------------------------------------------------------------------------------------
1. xtrain <- read.table("./train/X_train.txt", header=FALSE, sep="")
Read X_train.txt data into xtrain using read.table. Set the header to FALSE as X_train.txt does not contain header row. By default space is considered as the separator. Note: Do NOT set explicit space sep =" ".
xtrain data frame has 7352 rows and 561 columns.

2. xtest <- read.table("./test/X_test.txt", header=FALSE, sep="")
Read X_test.txt data into xtest using read.table as described in step 1. 
xtest data frame has 2947 rows and 561 columns.

3. Combine the rows of the two data frames in step 1 and 2. The number of columns for xtrain and xtest is same and rbind operation can be performed on the two sets.
Store the result containing rows from xtrain and xtest (in that order).
clubx <- rbind(xtrain,xtest)

clubx contains 10299 rows and 561 columns. [ First 7352 rows from xtrain followed by 2947 rows from xtest. ]

Similarly read data from y_train.txt and y_test.txt into data frames and combine the rows from 
those data frames into a single data frame called cluby.

4. ytrain <- read.table("./train/y_train.txt", header=FALSE, sep="")
Read y_train.txt data into ytrain using read.table. 

5. ytest <- read.table("./test/y_test.txt", header=FALSE, sep="")
Read t_test.txt data into ytest using read.table.

6. cluby <- rbind(ytrain, ytest)
cluby contains 10299 rows and 1 column. 

Similarly read data from subject_train.txt and subject_test.txt into data frames and combine the rows from those data frames into a single data frame called clubSub.

7. subTrain <- read.table("./train/subject_train.txt", header=FALSE, sep="")
Read data from subject_train.txt into subTrain using read.table. This data frame has 7352 rows and only 1 column for the 30 subjects (with IDs 1 to 30) who participated

8. subTest <- read.table("./test/subject_test.txt", header=FALSE, sep="")
Read data from subject_train.txt into subTrain using read.table. This data frame has 2947 rows and only 1 column for the 30 subjects (with IDs 1 to 30) who participated

9. clubSub <- rbind(subTrain, subTest)
clubSub has all the rows for subject IDs from both training and test sets.

10. mergeDataSet <- cbind(cbind(cluby, clubSub), clubx)
Create a data set which combines all the columns of cluby and clubSub and combines the results with clubx.
It is important to note the order. the inner cbind combines the cluby and clubSub first in that order.
cluby and clubSub each have single column for activities and subject IDs respectively. clubx has 561 columns.
After this step, the mergeDataSet will contain all the training and testing data sets combined with their activities and subject IDS details, thus making it a 563 column 
data frame [ 2 + 561 ].

11. The data frame needs to be assigned with column names corresponding to the features/ variables listed in features.txt.
features <- read.table("./features.txt", header=FALSE, sep="")
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
Based on the information in features_info.txt, 
mean(): Mean value. There are some features that contain the term "mean" but they do not necessarily depict mean feature.
For e.g. meanFreq() and angle(). These are listed as separate features. So for the purposes of this analysis, meanSet data set ignores such cases
and considers only cases which are related to mean(). 
14. meanSet <- mergeDataSet[,grep("mean()", colnames(mergeDataSet),fixed=TRUE)]
Using grep the exact pattern "mean()" is matched against the feature names/ column names of the mergeDataset using fixed = TRUE.
This ignores string matches such as meanfreq, angle(X,gravityMean) intentionally.
A subset called meanSet is created which contains only columns that match the afore mentioned mean features. It contains 33 columns.

15. Similarly, a subset containing features corresponding to std() is created.
stdSet <- mergeDataSet[,grep("std()", colnames(mergeDataSet),fixed=TRUE)]

*Note*: A common set is not created to have exact matches for each patterns.
commonSet <- mergeDataSet[,grep("std()|std()|Activity|SubjectID", colnames(mergeDataSet))]

16. Similarly, a subset containing Activity and Subject ID is also created.
act_sub <- mergeDataSet[,grep("Activity|SubjectID", colnames(mergeDataSet))]

17. mean_std_set <- cbind(cbind(act_sub,meanSet),stdSet)
As described in step 10, nested cbinds are used to combine columns from all the three data frames. 
mean_std_set data frame with columns for Activity and SubjectID, and features corresponding to "mean()", "std()" (in that order)
 
-------------------------------------------------------------------------------------- 
PART 3
--------------------------------------------------------------------------------------
18. Read activity data from activity_labels.txt into activityData data frame.
activityData <- read.table("./activity_labels.txt", header=FALSE, sep="")

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

21. Using gsub replace the first occurrence of t if the feature name begins with t to 'time'. '^t' is used to accomplish this.
descTimeNames <- gsub("^t","time", colnames(mean_std_set))

22. Similarly, feature names starting with 'f' are updated to start with 'freq'. 
descTimeFreqNames <- gsub("^f","freq",descTimeNames)

23. As the "()" parentheses are not intuitive, replace them with fun - abbreviation for function.
desc_labels <- gsub("\\()","fun",descTimeFreqNames)

24. Apply these updated descriptive labels to the data set's column names
colnames(mean_std_set) <- desc_labels

-------------------------------------------------------------------------------------- 
PART 5
--------------------------------------------------------------------------------------
25. reshape2 package is used to melt data in the desired form.
dataMelt <- melt(mean_std_set,id=c("SubjectID","Activity"))
For each SubjectID and Activity, value for each variable will be listed
dataMelt has 4 columns - SubjectID, Activity, variable and value corresponding to each of these combinations. 
The data is transformed from wide to long format.

26. Using summarise from dplyr package, tidyData is created.
With the melted data - dataMelt created in step 25, group_by is used for each of the SubjectID, Activity and variable and mean is calculated on the value for each combination. The mean column is displayed as "average".
tidyData <- summarise(group_by(dataMelt, SubjectID, Activity,variable), average=mean(value))

27. Write the tidyData into to txt file with row.names=FALSE and separator set to space.
write.table(tidyData,file="./TidyData.txt",row.names=FALSE, sep=" ")
Check the created file at the specified location.
Confirm that the data is in tidy format. There is one row for each observation and one column for each variable.
