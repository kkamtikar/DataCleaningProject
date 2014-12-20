# getwd()
# setwd to the desired location. "UCI HAR Dataset" is assumed to be the working directory for all the paths.

# Refer to the README for details of the steps involved in this analysis and codeBook for the details of the variables.
#-------------------------------------------------------------------------------------------------------------------------
# PART 1
#-------------------------------------------------------------------------------------------------------------------------
xtrain <- read.table("./train/X_train.txt", header=FALSE, sep="")
xtest <- read.table("./test/X_test.txt", header=FALSE, sep="")
clubx <- rbind(xtrain,xtest)

ytrain <- read.table("./train/y_train.txt", header=FALSE, sep="")
ytest <- read.table("./test/y_test.txt", header=FALSE, sep="")
cluby <- rbind(ytrain, ytest)

subTrain <- read.table("./train/subject_train.txt", header=FALSE, sep="")
subTest <- read.table("./test/subject_test.txt", header=FALSE, sep="")
clubSub <- rbind(subTrain, subTest)

# Combine all the columns for all the three data sets 
mergeDataSet <- cbind(cbind(cluby, clubSub), clubx)

#Read features from features.txt file
features <- read.table("./features.txt", header=FALSE, sep="")

# features data frame contains identifier and variable / feature name.
# Activity and SubjectID column names be prepended to the features names from features data frame.
# It will be a factor type and hence needs to be converted to character to create a list of names
featuresNames <- c("Activity", "SubjectID",as.character(features[,2]))

#Assign these featuresNames as column names to the mergeDataSet data frame
colnames(mergeDataSet) <- featuresNames


#-------------------------------------------------------------------------------------------------------------------------
# PART 2
#-------------------------------------------------------------------------------------------------------------------------

# Create a subset of the features for mean
# Based on the information in features_info.txt, 
# mean(): Mean value. There are some features that contain the term "mean" but they do not necessarily depict mean feature.
# For e.g. meanFreq() and angle(). These are listed as separate features. So for the purposes of this analysis, meanSet data set 
# ignores such cases and considers only cases which 
# are related to mean(). 

meanSet <- mergeDataSet[,grep("mean()", colnames(mergeDataSet),fixed=TRUE)]

# Similar to mean, stdSet only subsets features directly related to std()
stdSet <- mergeDataSet[,grep("std()", colnames(mergeDataSet),fixed=TRUE)]

# Columns corresponding to Activity and SubjectID should also be included
act_sub <- mergeDataSet[,grep("Activity|SubjectID", colnames(mergeDataSet))]

# The order of combing the columns together is important. 
#The first two columns correspond to Activity and SubjectID, followed by columns for mean features and then std features.
mean_std_set <- cbind(cbind(act_sub,meanSet),stdSet)


#-------------------------------------------------------------------------------------------------------------------------
# PART 3
#-------------------------------------------------------------------------------------------------------------------------
# Read activity data from activity_labels.txt
activityData <- read.table("./activity_labels.txt", header=FALSE, sep="")

# Fetch only the labels to create activity labels vector
activity_labels <- activityData[,2]   

# Assign the activity labels to the entries corresponding to the Activity column in the mean_std_set
# There are 6 activities defined by 6 levels.
mean_std_set$Activity <- factor(mean_std_set$Activity, levels=c(1,2,3,4,5,6), labels=activity_labels)


#-------------------------------------------------------------------------------------------------------------------------
# PART 4
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
# PART 5
#-------------------------------------------------------------------------------------------------------------------------
# For each SubjectID and Activity, value for each variable will be listed
library(reshape2)
dataMelt <- melt(mean_std_set,id=c("SubjectID","Activity"))

library(dplyr)
# Group by Subject ID, Activity and feature name and perform average on the values and create tidyData set.
tidyData <- summarise(group_by(dataMelt, SubjectID, Activity,variable), average=mean(value))


# Using write.table, write the tidy data set to a text file with row.names set to FALSE
write.table(tidyData,file="./TidyData.txt",row.names=FALSE, sep=" ")