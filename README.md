Getting And Cleaning Data
======================

**Introduction**
The purpose of the project was to demonstrate  the collection, work with, and clean a data set. The goal is to prepare a tidy data set that can be used for later analysis. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. This repo provides scripts and a data set for analysis of several features from the experiment results.

*Repository Inventory:*
Readme.md		:  This file.
CodeBook.md	:  Describes the data and transformations performed to clean up the data. 
run_analysis.R	:  Source code written in R to create the data set used for analysis.
tidyset.txt		:  A data set with the average of  several measures for each activity and each subject.

 **Loading Data**

The tidyset.txt file can be  created by running the run_analysis.R file from R.  The script assumes the source code is in the working directory.  From the command type source('run_analysis2.R').  The data will be downloaded from the original source and transformed to the tidyset.txt and saved in the working directory.

