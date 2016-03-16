## Getting and Cleaning Data - Course Project

###This is the course project for the Getting and Cleaning Data Coursera course. 

#### The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.  

	According to Hadley Wickham in Tidy Data:
	1. Each variable forms a column.
	2. Each observation forms a row.
	3. Each type of observational unit forms a table.

	The most common problems with messy datasetses:
	* Column headers are values, not variable names.
	* Multiple variables are stored in one column.
	* Variables are stored in both rows and columns. 
	* Multiple types of observational units are stored in the same table. 
	* A single observational unit is stored in multiple tables.

	Tools:
	* Melting
	* String splitting
	* Casting

	Three components of analysis: 
	* Data manipulation
		1. Filter: subsetting or removing observations based on some condition.
		2. Transform: adding or modifying variables. These modifcations can involve either a single variable or multiple variables).
		3. Aggregate: collapsing multiple values into a single value (e.g., by summing or taking means). 
		4. Sort: changing the order of observations.

	* Visualisation
	* Modelling

 
#### The Github repo contains the following files:
	1. a tidy.txt data set as described below
	2. a CodeBook.md that describes the variables, the data, and any transformations or work that you performed to clean up the data. 
	3. a README.md that explains the analysis files.
	4. a run_analysis.R script

#### The R script called run_analysis.R does the following:

* Set the working directory
* Download the dataset and check if it does not already exist
* Loads the activity and feature
* Loads both the training and test datasets and extracts only the measurements on the mean and standard deviation for each measurement.
* Loads the activity and subject data for each dataset
* Merges the training and the test sets to create one data set
* Appropriately labels the data set with descriptive variable names
* Converts the activity and subject columns into factors
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject
* Write the result in the file tidy.txt.
 