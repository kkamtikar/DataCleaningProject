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
       1..30 IDs of participating subjects
  
     * Activity
        .WALKING
        .WALKING_UPSTAIRS
        .WALKING_DOWNSTAIRS
        .SITTING
        .STANDING
        .LAYING
  
    * variable
    
        Variables/ feature names with descriptive names (Base feature names as described in features.txt and  features_info.txt)
  
    *  Changes to make names descriptive - 
        Feature names starting with 't' updated to start with 'time'
        Feature names starting with 'f' updated to start with 'freq'
        "()" updated to fun - abbreviation of function
 
    * List of all the features/ variables
        .timeBodyAcc-meanfun-X

        .timeBodyAcc-meanfun-Y

        .timeBodyAcc-meanfun-Z

        .timeGravityAcc-meanfun-X

        .timeGravityAcc-meanfun-Y

        .timeGravityAcc-meanfun-Z

        .timeBodyAccJerk-meanfun-X

        .timeBodyAccJerk-meanfun-Y

        .timeBodyAccJerk-meanfun-Z

        .timeBodyGyro-meanfun-X

        .timeBodyGyro-meanfun-Y

        .timeBodyGyro-meanfun-Z

        .timeBodyGyroJerk-meanfun-X

        .timeBodyGyroJerk-meanfun-Y

        .timeBodyGyroJerk-meanfun-Z

        .timeBodyAccMag-meanfun

        .timeGravityAccMag-meanfun

        .timeBodyAccJerkMag-meanfun

        .timeBodyGyroMag-meanfun

        .timeBodyGyroJerkMag-meanfun

        .freqBodyAcc-meanfun-X

        .freqBodyAcc-meanfun-Y

        .freqBodyAcc-meanfun-Z

        .freqBodyAccJerk-meanfun-X

        .freqBodyAccJerk-meanfun-Y

        .freqBodyAccJerk-meanfun-Z

        .freqBodyGyro-meanfun-X

        .freqBodyGyro-meanfun-Y

        .freqBodyGyro-meanfun-Z

        .freqBodyAccMag-meanfun

        .freqBodyBodyAccJerkMag-meanfun

        .freqBodyBodyGyroMag-meanfun
 
        .freqBodyBodyGyroJerkMag-meanfun
 
        .timeBodyAcc-stdfun-X

        .timeBodyAcc-stdfun-Y

        .timeBodyAcc-stdfun-Z

        .timeGravityAcc-stdfun-X

        .timeGravityAcc-stdfun-Y

        .timeGravityAcc-stdfun-Z

        .timeBodyAccJerk-stdfun-X

        .timeBodyAccJerk-stdfun-Y

        .timeBodyAccJerk-stdfun-Z

        .timeBodyGyro-stdfun-X

        .timeBodyGyro-stdfun-Y

        .timeBodyGyro-stdfun-Z

        .timeBodyGyroJerk-stdfun-X

        .timeBodyGyroJerk-stdfun-Y

        .timeBodyGyroJerk-stdfun-Z

        .timeBodyAccMag-stdfun

        .timeGravityAccMag-stdfun

        .timeBodyAccJerkMag-stdfun

        .timeBodyGyroMag-stdfun

        .timeBodyGyroJerkMag-stdfun

        .freqBodyAcc-stdfun-X

        .freqBodyAcc-stdfun-Y

        .freqBodyAcc-stdfun-Z

        .freqBodyAccJerk-stdfun-X
 
        .freqBodyAccJerk-stdfun-Y

        .freqBodyAccJerk-stdfun-Z

        .freqBodyGyro-stdfun-X

        .freqBodyGyro-stdfun-Y

        .freqBodyGyro-stdfun-Z

        .freqBodyAccMag-stdfun

        .freqBodyBodyAccJerkMag-stdfun

        .freqBodyBodyGyroMag-stdfun

        .freqBodyBodyGyroJerkMag-stdfun

   * average

      mean value for each variable for a given SubjectID and Activity
   

## Quick overview of the asnalysis

Note: For detailed explanation of the steps in the analysis process, refer to the README.md  (https://github.com/kkamtikar/DataCleaningProject/blob/master/README.md) file's "Explanation of steps performed during the analysis" section.
  

1. Read the X_train and X_test data from train and test folder in data folder and create a combined set of data called clubx.

2. Read the y_train and y_test data from train and test folder in data folder and create a combined set of data called cluby.This is activity related data.

3. Read the subject_train and subject_test data from train and test folder in data folder and create a combined set of data called clubSub.This is subjects related data.

4. Create a combined set using all the three data sets - clubx, cluby, and clubSub and store it in mergeDataSet.

5. Read features into features data set and create a list of characters called featuresNames using "Activity", "SubjectID", and the features names from the features set.

6. Set column names for mergeDataset.

7. Create subsets of columns for mean() and std() features. The assumption is that only the feature names that have mean() and std() be considered and that excludes feature names that contain these keywords - for example meanfreq and angle variables are not considered as they do not actually perform the mean() and std().
Each subset yields 33 columns and additionally data for Activity and SubjectIDs be also retained. In total there are 68 columns. The resulting data set is stored as mean_std_set.
The value for each feature is normalized between -1 and 1.

8. Update the activity data with corresponding activity labels. Each of the activity number (ranging from 1 to 6) is replaced with the activity associated e.g. WALKING, STANDING etc. 
1 - WALKING

2 - WALKING_UPSTAIRS
3
3 - WALKING_DOWNSTAIRS

4 - SITTING

5 - STANDING

6 - LAYING

9.Feature names are changed to more descriptive and readable names.
Feature names starting with 't' are time domain features and the 't' is updated to 'time'
Feature names starting with 'f' are time domain features and the 'f' is updated to 'freq'
The parenthese in the names are replaced with "fun", an abbreviation for function.
the updated column names are assigned to the mean_std_set data frame.

10. Using reshape2 package, mean_std_set data is melted into dataMelt for each SubjectID and Activity.

11. Using dplyr package, summarise the melted data, grouped by subject ID, Activity and feature/ variable and calculate mean value and display as average.
Store the tidy data in TidyData and write to TidyData.txt.
The final data is tidy data that follows the principles of tidy data. 
