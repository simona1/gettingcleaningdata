### The code below assumes that the directory with the data,
### "UCI HAR Dataset" was unzipped into the R working directory.

# Access file with activity labels and store its data in 
# a variable called "activities
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Edit activity names to remove subscript and convert to lower case
activities$V2 <- gsub("_", "", tolower(activities$V2))

# Read the files with activity codes from each set (test and train) 
testact <- read.table("./UCI HAR Dataset/test/Y_test.txt")
trainact <- read.table("./UCI HAR Dataset/train/Y_train.txt")

# Decode activities for both test and train sets, i.e. replace  
# the numbers in Y_test.txt and Y_train.txt files with the
# corresponding activity names
activitycodes <- as.list(activities$V1) 
activitynames <- as.list(activities$V2)
for(i in activitycodes) {
  testact$V1 = gsub(i, activitynames[i], testact$V1)
  trainact$V1 = gsub(i, activitynames[i], trainact$V1)
}

# Read data from the subject_test.txt file and subject_train.txt file
# and change column name to "subject".
test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(test) <- c("subject")
names(train) <- c("subject")

# Add a new column, "activity", to both "test" and "train" sets 
# and populate it with the corresponding activity names from testact 
# and trainact  
test$activity <- testact$V1            
train$activity <- trainact$V1 

# Read the files with the measurements from the test and train sets
# Read the file with the feature list
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

# Replace variable names in xtest and xtrain with feature names
names(xtest) <- as.character(features$V2)
names(xtrain) <- as.character(features$V2)

# Create logical vector "select" to get the features that contain the words 
# mean or std in their names. Deliberately written as to get only the 
# measurements for which both mean and std were recorded
select <- grepl("mean\\(\\)|std\\(\\)", features$V2)

# Add the mean and std variables to the test and train sets with cbind().
for(i in 1:nrow(features)) {
  if(select[i]) {
    test <- cbind(test, xtest[i])
    train <- cbind(train, xtrain[i])
  }
}

# Merge the test and train sets into a single set, called mergedSets.
mergedSets = merge(test,train, all=TRUE)

# Edit variable names in the merged set to make them conform to the
# data tidying rules
names <- names(mergedSets)
names <- gsub("^t", "time", names)
names <- gsub("^f", "frequency", names)
names(mergedSets) <- gsub("-|,|\\(|\\)", "", tolower(names))

### Reshape the data frame, name the result "molten"
library(reshape2)
molten <- melt(mergedSets, id=c("subject", "activity"))

### Obtain averages per subject/activity. The result is an array.
averaged <- acast(molten, subject ~ activity ~ variable, mean)

### Convert the array to dataframe and edit column labels
library(plyr)
tidydata <- adply(averaged, 1:2, expand=TRUE)
names(tidydata)[1:2] <- c("subject", "activity")

# Save tidydata in a tab-delimited text file named tidydata.txt
write.table(tidydata, "./tidydata.txt", sep="\t")


