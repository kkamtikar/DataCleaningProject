# Created Date: 19-Dec-2014
# Created by: Kirti Kamtikar
# https://github.com/kkamtikar/

# Refer to the README for the project background and files used in the project and deatiled explanation of the steps
# involved in this analysis.
# Refer to the CodeBook.md for details of the variables used in this analysis and final output - TidyData, and quick overview
# of the analysis.

# As described in the README.md, make sure that the zipped file containing data files is downloaded, extracted and contents are copied to data folder (in working directory).
# Data folder contains activity_labels, features, train and test folders with all the specified data files.

# getwd()
# Set the working directory and/ or all the paths for read.table statements appropriately.

#-------------------------------------------------------------------------------------------------------------------------
# PART 1 - Merges the training and the test sets to create one data set.
#-------------------------------------------------------------------------------------------------------------------------

# Read training and test data files from train and test folder respectively (data filenames starting with X_)
xtrain <- read.table("./data/train/X_train.txt", header=FALSE, sep="")
xtest <- read.table("./data/test/X_test.txt", header=FALSE, sep="")
# Combine the rows of the training and test data
clubx <- rbind(xtrain,xtest)

# Read activity data for training and test from train and test folder respectively (data filenames starting with y_)
ytrain <- read.table("./data/train/y_train.txt", header=FALSE, sep="")
ytest <- read.table("./data/test/y_test.txt", header=FALSE, sep="")
# Combine the rows of the training and test activity data
cluby <- rbind(ytrain, ytest)

# Read Subject IDs for training and test data from train and test folder respectively (data filenames starting with subject_)
subTrain <- read.table("./data/train/subject_train.txt", header=FALSE, sep="")
subTest <- read.table("./data/test/subject_test.txt", header=FALSE, sep="")
# Combine the rows of the training and test Subjects data
clubSub <- rbind(subTrain, subTest)

# Combine all the columns for all the three data sets 
mergeDataSet <- cbind(cbind(cluby, clubSub), clubx)
# mergeDataSet contains features data, activity and subject data combined for training and test sets.

# Read features from features.txt file
features <- read.table("./data/features.txt", header=FALSE, sep="")

# features data frame contains identifier and variable / feature name.
# Activity and SubjectID column names be prepended to the features names from features data frame.
# It will be a factor type and hence needs to be converted to character to create a list of names
featuresNames <- c("Activity", "SubjectID",as.character(features[,2]))

# Assign these featuresNames as column names to the mergeDataSet data frame
colnames(mergeDataSet) <- featuresNames


#-------------------------------------------------------------------------------------------------------------------------
# PART 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
#-------------------------------------------------------------------------------------------------------------------------

# Create a subset of the features for mean
# Based on the information in features_info.txt -
# mean(): Mean value. There are some features that contain the term "mean" but they do not necessarily depict mean feature.
# For e.g. meanFreq() and angle(). These are listed as separate features. So for the purposes of this analysis, meanSet data set 
# ignores such cases and considers only cases which are related to mean(). 

meanSet <- mergeDataSet[,grep("mean()", colnames(mergeDataSet),fixed=TRUE)]

# Similar to mean, stdSet only subsets features directly related to std()
stdSet <- mergeDataSet[,grep("std()", colnames(mergeDataSet),fixed=TRUE)]

# Columns corresponding to Activity and SubjectID should also be included
act_sub <- mergeDataSet[,grep("Activity|SubjectID", colnames(mergeDataSet))]

# The order of combing the columns together is important. 
# The first two columns correspond to Activity and SubjectID, followed by columns for mean features and then std features.
mean_std_set <- cbind(cbind(act_sub,meanSet),stdSet)


#-------------------------------------------------------------------------------------------------------------------------
# PART 3 - Uses descriptive activity names to name the activities in the data set
#-------------------------------------------------------------------------------------------------------------------------
# Read activity data from activity_labels.txt
activityData <- read.table("./data/activity_labels.txt", header=FALSE, sep="")

# Fetch only the labels to create activity labels
activity_labels <- activityData[,2]   

# Assign the activity labels to the entries corresponding to the Activity column in the mean_std_set
# There are 6 activities defined by 6 levels.
mean_std_set$Activity <- factor(mean_std_set$Activity, levels=c(1,2,3,4,5,6), labels=activity_labels)


#-------------------------------------------------------------------------------------------------------------------------
# PART 4 - Appropriately labels the data set with descriptive variable names. 
#-------------------------------------------------------------------------------------------------------------------------

# Make the column names more descriptive
# Change the first 't' in the feature name to 'time' using gsub
descTimeNames <- gsub("^t","time",colnames(mean_std_set))
# Change the first 'f' in the feature name to 'freq' using gsub
descTimeFreqNames <- gsub("^f","freq",descTimeNames)

# Replace brackets by "fun" for descriptive and more readable names
desc_labels <- gsub("\\()","fun",descTimeFreqNames)

# Apply these updated descriptive labels to the data set's column names
colnames(mean_std_set) <- desc_labels
# mean_std_set contains all the data with descriptive frequency names


#-------------------------------------------------------------------------------------------------------------------------
# PART 5 - From the data set in step 4, creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject.
#-------------------------------------------------------------------------------------------------------------------------

# For each SubjectID and Activity, value for each variable will be listed
library(reshape2)
dataMelt <- melt(mean_std_set,id=c("SubjectID","Activity"))

library(dplyr)
# Group by Subject ID, Activity and feature name and perform average on the values and create tidyData set.
# The display order is set to Subject ID, Activity followed by variable.
tidyData <- summarise(group_by(dataMelt, SubjectID, Activity,variable), average=mean(value))

# Using write.table, write the tidy data set to a text file with row.names set to FALSE
# The file TidyData.txt will be created in the current working directory.
write.table(tidyData,file="./TidyData.txt",row.names=FALSE, sep=" ")
