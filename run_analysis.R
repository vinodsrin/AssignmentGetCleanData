library(dplyr)

#fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileurl, "wearabledata.zip")
#if(!file.exists("./samsung")) {dir.create("./samsung")}
#unzip("wearabledata.zip", exdir = "./samsung")

# Read training and test raw data
x_train <- read.table("./samsung/UCI HAR Dataset/train/X_train.txt", header = FALSE)
x_test <- read.table("./samsung/UCI HAR Dataset/test/X_test.txt", header = FALSE)

# Merge training and test data
x_table <- merge(x_train, x_test, all = TRUE)

# Read training and test activity data
y_train <- read.table("./samsung/UCI HAR Dataset/train/y_train.txt", header = FALSE)
y_test <- read.table("./samsung/UCI HAR Dataset/test/y_test.txt", header = FALSE)

# Merge training and test data
y_table <- rbind(y_train, y_test)

# Read training and test subject data
subject_train <- read.table("./samsung/UCI HAR Dataset/train/subject_train.txt", header = FALSE) 
subject_test <- read.table("./samsung/UCI HAR Dataset/test/subject_test.txt", header = FALSE) 

# Merge training and test data
subject_table <- merge(subject_train, subject_test, all = TRUE)

# Read activity labels
activity <- read.table("./samsung/UCI HAR Dataset/activity_labels.txt", header = FALSE)

# Read features
features <- read.table("./samsung/UCI HAR Dataset/features.txt", header = FALSE, sep = " ")

# Clean features names by replacing (), ",", "-", "(" and ")"
features$V2 <- gsub("mean\\(\\)", "mean", features$V2)
features$V2 <- gsub("\\(", "", features$V2)
features$V2 <- gsub("\\)", "", features$V2)
features$V2 <- gsub("\\,", "_", features$V2)
features$V2 <- gsub("\\-", "_", features$V2)

# features are not unique, so create unique features by concating with rownames
features$V2 <- paste0(rownames(features), features$V2)

# set column names to tables
colnames(x_table) <- features[,2]
colnames(y_table) <- "activity"
colnames(subject_table) <- "subject"

# merge data values, activity and subject
final_table <- cbind(subject_table, y_table, x_table)

final_table <- tbl_df(final_table)

# Create tidy table with subject, activity, and mean and std columns
tidy_tab <- select(final_table, subject,activity, ends_with("_mean"), ends_with("_std"))

# Gather column names
col_names <- colnames(tidy_tab)

# Remove concat column names containing numbers to tidy column names
for (i in 0:9) {col_names <- gsub(i, "", col_names)}

# Set column names
colnames(tidy_tab) <- col_names

#Summarise tidy_tab and store in text file
tidy_tab %>%
group_by(subject,activity) %>%
summarise_each(funs(mean)) %>%
write.table( "./new_data.txt", row.names = FALSE)  
