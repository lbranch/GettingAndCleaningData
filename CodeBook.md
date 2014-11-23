**CODE BOOK**
-------------

**Getting And Cleaning Data Course Project**

**INTRODUCTION**

This project deals with obtaining and cleaning data sets. The goal is to prepare a tidy data that can be used for later analysis. The source data set represents data collected from accelerometers and gyroscopes from the Samsung Galaxy S smartphone. 

**DATA SOURCE**

The source data was obtained from experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, data was captured from 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.   

The subset of the data used for this analysis was obtained from the following address:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
 
**DATA PREPARATION**

The experiment results were processed by a script, run_analysis.R to process the source data.  The following is a summary of the
steps to process the source data.

1. Download the source data.
2. Merge the training and test sets to create a merged data set.
3. Replace activity values in the merged dataset with descriptive activity names.
4. Extract only the measurements that represent the mean and standard deviation for each measurement.
5. Label column names in the merged dataset with descriptive names.
6. Crate a tidy dataset with an average for each measure from the merged dataset for each activity and subject. 
7. Write the tidy dataset to a csv file.

The run_analysis.R process script can be executed from R.  The script should be extecuted as follows
from the command prompt: source('run_analysis.R').  This assumes the script is saved in the current working directory.


**DATA STRUCTURE**

*COLUMN NAMING CONVENTION*

The features selected for the analysis come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 

(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation 
meanFreq(): Weighted average of the frequency components to obtain a mean frequency 

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

*Data Table Structure*
----------------------

| Column Name               | Data Type | Description                                                                                               |
|---------------------------|-----------|-----------------------------------------------------------------------------------------------------------|
| ActivityLabel             | Character | participant activity  values = (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS) |
| Subject                   | Number    | A number between 1 and 30  representing a volunteer                                                       |
| tBodyAcc-mean-Y           | Number    | Body Acceleration mean Y-axis                                                                             |
| tBodyAcc-mean-Z           | Number    | Body Acceleration mean Z-axis                                                                             |
| tBodyAcc-std-X            | Number    | Body Acceleration std. dev. X-axis                                                                        |
| tBodyAcc-std-Y            | Number    | Body Acceleration std. dev. Y-axis                                                                        |
| tBodyAcc-std-Z            | Number    | Body Acceleration std. dev. Z-axis                                                                        |
| tGravityAcc-mean-X        | Number    | Gravity Acceleration mean. dev. X-axis                                                                    |
| tGravityAcc-mean-Y        | Number    | Gravity Acceleration mean Y-axis                                                                          |
| tGravityAcc-mean-Z        | Number    | Gravity Acceleration mean Z-axis                                                                          |
| tGravityAcc-std-X         | Number    | Gravity Acceleration std. dev. X-axis                                                                     |
| tGravityAcc-std-Y         | Number    | Gravity Acceleration std. dev. Y-axis                                                                     |
| tGravityAcc-std-Z         | Number    | Gravity Acceleration std. dev. Z-axis                                                                     |
| tBodyAccJerk-mean-X       | Number    | Body Acceleration Jerk mean X-axis                                                                        |
| tBodyAccJerk-mean-Y       | Number    | Body Acceleration Jerk mean Y-axis                                                                        |
| tBodyAccJerk-mean-Z       | Number    | Body Acceleration Jerk mean Z-axis                                                                        |
| tBodyAccJerk-std-X        | Number    | Body Acceleration Jerk std. dev. X-axis                                                                   |
| tBodyAccJerk-std-Y        | Number    | Body Acceleration Jerk std. dev. Y-axis                                                                   |
| tBodyAccJerk-std-Z        | Number    | Body Acceleration Jerk std. dev. Z-axis                                                                   |
| tBodyGyro-mean-X          | Number    | Body Gyro mean X-axis                                                                                     |
| tBodyGyro-mean-Y          | Number    | Body Gyro mean Y-axis                                                                                     |
| tBodyGyro-mean-Z          | Number    | Body Gyro mean Z-axis                                                                                     |
| tBodyGyro-std-X           | Number    | Body Gyro std. dev. X-axis                                                                                |
| tBodyGyro-std-Y           | Number    | Body Gyro std. dev. Y-axis                                                                                |
| tBodyGyro-std-Z           | Number    | Body Gyro std. dev. Z-axis                                                                                |
| tBodyGyroJerk-mean-X      | Number    | Body Gyro Jerk mean X-axis                                                                                |
| tBodyGyroJerk-mean-Y      | Number    | Body Gyro Jerk mean Y-axis                                                                                |
| tBodyGyroJerk-mean-Z      | Number    | Body Gyro Jerk mean Z-axis                                                                                |
| tBodyGyroJerk-std-X       | Number    | Body Gyro Jerk std. dev. X-axis                                                                           |
| tBodyGyroJerk-std-Y       | Number    | Body Gyro Jerk std. dev. Y-axis                                                                           |
| tBodyGyroJerk-std-Z       | Number    | Body Gyro Jerk std. dev. Z-axis                                                                           |
| tBodyAccMag-mean          | Number    | Body Acceleration Magnitude  mean                                                                         |
| tBodyAccMag-std           | Number    | Body Acceleration Magnitude  std. dev.                                                                    |
| tGravityAccMag-mean       | Number    | Gravity Acceleration Magnitude  mean                                                                      |
| tGravityAccMag-std        | Number    | Gravity Acceleration Magnitude  std. dev.                                                                 |
| tBodyAccJerkMag-mean      | Number    | Body Acceleration Jerk Magnitude mean                                                                     |
| tBodyAccJerkMag-std       | Number    | Body Acceleration Jerk Magnitude std. dev.                                                                |
| tBodyGyroMag-mean         | Number    | Body Gyro Magnitude mean                                                                                  |
| tBodyGyroMag-std          | Number    | Body Gyro Magnitude std. dev.                                                                             |
| tBodyGyroJerkMag-mean     | Number    | Body Gyro Jerk Magnitude mean                                                                             |
| tBodyGyroJerkMag-std      | Number    | Body Gyro Jerk Magnitude std. dev.                                                                        |
| fBodyAcc-mean-X           | Number    | Frequency Body Acceleration mean X-axis                                                                   |
| fBodyAcc-mean-Y           | Number    | Frequency Body Acceleration mean Y-axis                                                                   |
| fBodyAcc-mean-Z           | Number    | Frequency Body Acceleration mean Z-axis                                                                   |
| fBodyAcc-std-X            | Number    | Frequency Body Acceleration std. dev. X-axis                                                              |
| fBodyAcc-std-Y            | Number    | Frequency Body Acceleration std. dev. Y-axis                                                              |
| fBodyAcc-std-Z            | Number    | Frequency Body Acceleration std. dev. Z-axis                                                              |
| fBodyAcc-meanFreq-X       | Number    | Frequency Body Acceleration mean frequency X-axis                                                         |
| fBodyAcc-meanFreq-Y       | Number    | Frequency Body Acceleration mean frequency Y-axis                                                         |
| fBodyAcc-meanFreq-Z       | Number    | Frequency Body Acceleration mean frequency Z-axis                                                         |
| fBodyAccJerk-mean-X       | Number    | Frequency Body Acceleration Jerk mean X-axis                                                              |
| fBodyAccJerk-mean-Y       | Number    | Frequency Body Acceleration Jerk mean Y-axis                                                              |
| fBodyAccJerk-mean-Z       | Number    | Frequency Body Acceleration Jerk mean Z-axis                                                              |
| fBodyAccJerk-std-X        | Number    | Frequency Body Acceleration Jerk std. dev. X-axis                                                         |
| fBodyAccJerk-std-Y        | Number    | Frequency Body Acceleration Jerk std. dev. Y-axis                                                         |
| fBodyAccJerk-std-Z        | Number    | Frequency Body Acceleration Jerk std. dev. Z-axis                                                         |
| fBodyAccJerk-meanFreq-X   | Number    | Frequency Body Acceleration Jerk mean frequency X-axis                                                    |
| fBodyAccJerk-meanFreq-Y   | Number    | Frequency Body Acceleration Jerk mean frequency Y-axis                                                    |
| fBodyAccJerk-meanFreq-Z   | Number    | Frequency Body Acceleration Jerk mean frequency Z-axis                                                    |
| fBodyGyro-mean-X          | Number    | Frequency Body Gyro mean X-axis                                                                           |
| fBodyGyro-mean-Y          | Number    | Frequency Body Gyro mean Y-axis                                                                           |
| fBodyGyro-mean-Z          | Number    | Frequency Body Gyro mean Z-axis                                                                           |
| fBodyGyro-std-X           | Number    | Frequency Body Gyro std. dev. X-axis                                                                      |
| fBodyGyro-std-Y           | Number    | Frequency Body Gyro std. dev. Y-axis                                                                      |
| fBodyGyro-std-Z           | Number    | Frequency Body Gyro std. dev. Z-axis                                                                      |
| fBodyGyro-meanFreq-X      | Number    | Frequency Body Gyro mean frequency X-axis                                                                 |
| fBodyGyro-meanFreq-Y      | Number    | Frequency Body Gyro mean frequency Y-axis                                                                 |
| fBodyGyro-meanFreq-Z      | Number    | Frequency Body Gyro mean frequency Z-axis                                                                 |
| fBodyAccMag-mean          | Number    | Frequency Body Acceleration Magnitude  mean                                                               |
| fBodyAccMag-std           | Number    | Frequency Body Acceleration Magnitude  std. dev.                                                          |
| fBodyAccMag-meanFreq      | Number    | Frequency Body Acceleration Magnitude  mean frequency                                                     |
| fBodyAccJerkMag-mean      | Number    | Frequency Body Acceleration Jerk Magnitude  mean                                                          |
| fBodyAccJerkMag-std       | Number    | Frequency Body Acceleration Jerk Magnitude  st. dev.                                                      |
| fBodyAccJerkMag-meanFreq  | Number    | Frequency Body Acceleration Jerk Magnitude  mean frequency                                                |
| fBodyGyroMag-mean         | Number    | Frequency Body Gyro Magnitude mean                                                                        |
| fBodyGyroMag-std          | Number    | Frequency Body Gyro Magnitude std. dev.                                                                   |
| fBodyGyroMag-meanFreq     | Number    | Frequency Body Gyro Magnitude mean frequency                                                              |
| fBodyGyroJerkMag-mean     | Number    | Frequency Body Gyro Jerk Magnitude mean                                                                   |
| fBodyGyroJerkMag-std      | Number    | Frequency Body Gyro Jerk Magnitude std. dev.                                                              |
| fBodyGyroJerkMag-meanFreq | Number    | Frequency Body Gyro Jerk Magnitude mean frequency                                                         |*emphasized text*


**SOURCE AND DATA REPOSITORY**

The data file, supporting scripts and documentation can be found at the following address:
https://github.com/lbranch/GettingAndCleaningData

> Written with [StackEdit](https://stackedit.io/).