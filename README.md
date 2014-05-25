gettingcleaningdata
===================

Repo for the "Getting and Cleaning Data" course project
**Getting and Cleaning Data Course Project**
========================================================

How to run the "run_analysis.R" script:
--------------------------------------------------------

1. Unzip the dataset to be analyzed into the R working directory. The code assumes that the R working directory contains a directory named "UCI HAR Dataset". 
2. Prior to running the code, make sure that packages "reshape2" and "plyr" are installed; they are invoked in the script (see lines 72 and 79).
3. From the R environment and with the target directory present in the working directory, execute the command: source("run_analysis.R")
4. Running the code generates the file "tidydata.txt" that is saved in the R working directory. This is a tab-delimited text file. 

Additional information about the "run_analysis.R" script:
----------------------------------------------------------
### Variables in the script 
* activities - read and store info from file "activity_labels.txt". 
* testact and trainact - read and store info about activity codes from files in each train and test groups, namely "Y-train.txt" and "Y-test.txt"
respectively. 
* test and train - read and store info about the measurements that were collected for test and train groups.
* features - read and store info about the feature names which are labeled V1 through V561 in the test and train data files. Features are used to decode the measurement names.

### Selection of mean and standard deviation subsets
For the purpose of this project it was assumed that features whose names include the substrings "mean()" or "std()" are the ones to be selected for inclusion in the final tidy dataset. Also, the variables that had the word "mean" or "Mean" in their names but for which there wasn't a corresponding variable with a substring "std" in their name were not selected. 

### Activity and feature names 
For the activity names in the tidy dataset, the following rules were applied: 
* "t" and "f" at the beginning of a feature name were changed to "time" and "frequency";
* Parentheses and dashes were removed;
* The names were convereted to lower case.

### Tidy dataset
* The generated tidydata set is stored in file tidydata.txt in the working directory. 
* The file tidydata.txt has 180 rows = 30 subjects * 6 activities
* The file tidydata.txt has 68 columns. Column 1 is labeled "subject", column 2 - "activity". The remaining 66 columns are the selected variables (mean and std).
