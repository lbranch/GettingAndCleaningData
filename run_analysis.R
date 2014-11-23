## run_anlysis.R
### Contributor: Lonnell Branch
### This process loads and merge the training and test data for analysis
###



library(data.table)
 


## Download and Unzip Source Data to be analyzed


srcfile <- paste( getwd(),"/HARDataset.zip", sep="")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", srcfile)

unzip( srcfile, exdir=getwd())

## load training data sets

  train_df <- read.table(paste( getwd(),"/UCI HAR Dataset/train/x_train.txt", sep="")  )
  
  ## Get unique feature names
  features_df <- read.table(paste( getwd(),"/UCI HAR Dataset/features.txt",sep="") )  
  features_names <- make.names(features_df$V2, unique = TRUE, allow_ = TRUE)  
  names(train_df) <- features_names
  
  ## integrate training set
  
  subjects_df <- read.table(paste( getwd(),"/UCI HAR Dataset/train/subject_train.txt", sep="" ))  
  names(subjects_df) <- "subject"
  
  activity_df<- read.table(paste( getwd(),"/UCI HAR Dataset/train/y_train.txt",sep="" ))
  
  names(activity_df) <- "activityid"

## REQUIREMENT 3 Use descriptive activity names to name the activities in the data set
  
  activity_df[activity_df$activityid==1,"ActivityLabel"]   <-"WALKING"
  activity_df[activity_df$activityid==2,"ActivityLabel"]   <-"WALKING_UPSTAIRS"
  activity_df[activity_df$activityid==3,"ActivityLabel"]   <-"WALKING_DOWNSTAIRS"
  activity_df[activity_df$activityid==4,"ActivityLabel"]   <-"SITTING"
  activity_df[activity_df$activityid==5,"ActivityLabel"]   <-"STANDING"
  activity_df[activity_df$activityid==6,"ActivityLabel"]   <-"LAYING"
  activity_df <- activity_df$ActivityLabel
  
  ## Add the activity and subject column to the training data 
  train_df <- cbind(activity_df,train_df)
  train_df <- cbind(subjects_df,train_df)
  

  ## load the Test subjests data sets
  test_df <- read.table(paste( getwd(),"/UCI HAR Dataset/test/x_test.txt",sep="") )
  
  ## assign unique feature names
   names(test_df) <- features_names
  
  ## integrate test set
  
  subjects_df <- read.table(paste( getwd(),"/UCI HAR Dataset/test/subject_test.txt",sep="") )  
  names(subjects_df) <- "subject"
  activity_df<- read.table(paste( getwd(),"/UCI HAR Dataset/test/y_test.txt", sep="") )
  names(activity_df) <- "activityid"
 
## REQUIREMENT 3 Use descriptive activity names to name the activities in the data set
  
  activity_df[activity_df$activityid==1,"ActivityLabel"]   <-"WALKING"
  activity_df[activity_df$activityid==2,"ActivityLabel"]   <-"WALKING_UPSTAIRS"
  activity_df[activity_df$activityid==3,"ActivityLabel"]   <-"WALKING_DOWNSTAIRS"
  activity_df[activity_df$activityid==4,"ActivityLabel"]   <-"SITTING"
  activity_df[activity_df$activityid==5,"ActivityLabel"]   <-"STANDING"
  activity_df[activity_df$activityid==6,"ActivityLabel"]   <-"LAYING"
  activity_df <- activity_df$ActivityLabel
  
  test_df <- cbind(activity_df,test_df)
  test_df <- cbind(subjects_df,test_df)
  
### REQUIRMENT 1 Merge training and test data sets
  
results_df <- rbind(train_df,test_df)  
  
  
 
##REQUIREMENT 2 Extract only the measurements on the mean and standard deviation
 
target_set_df <- results_df[,grep("std|mean|activity_df|subject",names(results_df))]


##REQUIREMENT 4 Appropriately label the data set with descriptive variable names
 
setnames(target_set_df,"subject","Subject")
setnames(target_set_df,"activity_df","ActivityLabel")

##REQUIREMENT 5  Creates a second, independent tidy data set with the average of each variable

 tidyset_df <- aggregate(target_set_df, by=list(target_set_df$Subject,target_set_df$ActivityLabel),FUN=mean, na.rm=TRUE)


##REQUIREMENT 4 Appropriately label the data set with descriptive variable names

  tidyset_df[,1] <- NULL     ## Remove group.1
  tidyset_df[,4] <- NULL     ## Remove ActivityLabel
  setnames(tidyset_df,"Group.2","ActivityLabel")
  tidyset_df[,3] <- NULL 
  n <- data.frame(names(tidyset_df),stringsAsFactors = FALSE)
  names(n) <- "labels"
  n$labels <- gsub("...","-",n$labels, fixed=TRUE)
  n$labels <- gsub(".","-",n$labels, fixed=TRUE)
  n$labels <- gsub("--","",n$labels, fixed=TRUE)
  n$labels <- gsub("BodyBody","Body",n$labels, fixed=TRUE)
  names(tidyset_df) <- n$labels 

## Output tidyset to file
write.table(tidyset_df,file="tidyset.txt",row.name=FALSE)  

### End of Processing
