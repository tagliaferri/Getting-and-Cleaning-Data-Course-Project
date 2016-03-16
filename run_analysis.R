# Set working directory
# setwd("C:/Users/Giovanni/Desktop/Coursera/Getting And Cleaning Data/Assigment")


#install.packages("reshape")
library(reshape)

#install.packages("reshape2")
library(reshape2)


filename <- "getdata_dataset.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download and unzip the dataset:
if (!file.exists(filename)){
  ## method="curl" is default in OS Windows
  download.file(fileURL, filename)
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Load activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels_2 <- activity_labels[,2]
activity_labels_2 <- as.character(activity_labels_2)

# Load features labels 
features <- read.table("UCI HAR Dataset/features.txt")
features_2 <- features[,2]
features_2 <- as.character(features_2)

# Search for matches only on mean and standard deviation
features_mean_std <- grep(".*mean.*|.*std.*", features_2)
features_mean_std.names <- features[features_mean_std,2]

# Perform replacement of all matches
features_mean_std.names = gsub('-mean', 'Mean', features_mean_std.names)
features_mean_std.names = gsub('-std', 'Std', features_mean_std.names)
features_mean_std.names <- gsub('[-()]', '', features_mean_std.names)


# Load the dataset train
train <- read.table("UCI HAR Dataset/train/X_train.txt")[features_mean_std]
train_activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
# Combine by columns
train <- cbind(train_subjects , train_activities, train)

# Load the dataset test
test <- read.table("UCI HAR Dataset/test/X_test.txt")[features_mean_std]
test_activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
# Combine by columns
test <- cbind(test_subjects, test_activities, test)

# Merge datasets train and test
merge_data <- rbind(train, test)
# Add labels
colnames(merge_data) <- c("subject", "activity", features_mean_std.names)

# Turn activities into factors
merge_data$activity <- factor(merge_data$activity, levels = activity_labels[,1], labels = activity_labels_2)

# Turn subjects into factors
merge_data$subject <- as.factor(merge_data$subject)


# Turn columns into rows
merge_data_melt <- melt(merge_data, id = c("subject", "activity"))

# library(reshape2)

# Reshape the data into a data frame and calculate the mean
merge_data_mean <- dcast(merge_data_melt, subject + activity ~ variable, mean)

# Write the result in the file tidy.txt
write.table(merge_data_mean, "tidy.txt", row.names = FALSE, quote = FALSE)