Code Book 
========================
1. I unzipped the folder into my R working directory and got the directory
"UCI HAR Dataset" 

2. I read the activity codes and names from ./UCI HAR Dataset/activity_labels.txt"
3. I edited the names to remove underscores and converted to lower case
4. I've read the info about the subject to activity corresponding values from: 
"./UCI HAR Dataset/test/Y_test.txt"
"./UCI HAR Dataset/train/Y_train.txt"
5. I've read the measurement files from:
"./UCI HAR Dataset/test/subject_test.txt"
"./UCI HAR Dataset/train/subject_train.txt"
6. I made a dataset for test and one for train first by selecting the variables of interest only, i.e. the ones that had mean() or std() in their names. 
7. I merged tain and test, melted and reshaped the data 
8. I've edited the feature names to convert to lower case and make the names more descriptive, plus to remove the undesired characters such as dashes and parentheses.
9. The tidy dataset contains 180 rows = 30 subjects * 6 activities
and 68 columns. Column 1 is labeled "subject", column 2 - "activity". The remaining 66 columns are the selected variables (mean and std).
10. Therefore the column names are:

 [1] "subject"                          "activity"                        
 [3] "timebodyaccmeanx"                 "timebodyaccmeany"                
 [5] "timebodyaccmeanz"                 "timebodyaccstdx"                 
 [7] "timebodyaccstdy"                  "timebodyaccstdz"                 
 [9] "timegravityaccmeanx"              "timegravityaccmeany"             
[11] "timegravityaccmeanz"              "timegravityaccstdx"              
[13] "timegravityaccstdy"               "timegravityaccstdz"              
[15] "timebodyaccjerkmeanx"             "timebodyaccjerkmeany"            
[17] "timebodyaccjerkmeanz"             "timebodyaccjerkstdx"             
[19] "timebodyaccjerkstdy"              "timebodyaccjerkstdz"             
[21] "timebodygyromeanx"                "timebodygyromeany"               
[23] "timebodygyromeanz"                "timebodygyrostdx"                
[25] "timebodygyrostdy"                 "timebodygyrostdz"                
[27] "timebodygyrojerkmeanx"            "timebodygyrojerkmeany"           
[29] "timebodygyrojerkmeanz"            "timebodygyrojerkstdx"            
[31] "timebodygyrojerkstdy"             "timebodygyrojerkstdz"            
[33] "timebodyaccmagmean"               "timebodyaccmagstd"               
[35] "timegravityaccmagmean"            "timegravityaccmagstd"            
[37] "timebodyaccjerkmagmean"           "timebodyaccjerkmagstd"           
[39] "timebodygyromagmean"              "timebodygyromagstd"              
[41] "timebodygyrojerkmagmean"          "timebodygyrojerkmagstd"          
[43] "frequencybodyaccmeanx"            "frequencybodyaccmeany"           
[45] "frequencybodyaccmeanz"            "frequencybodyaccstdx"            
[47] "frequencybodyaccstdy"             "frequencybodyaccstdz"            
[49] "frequencybodyaccjerkmeanx"        "frequencybodyaccjerkmeany"       
[51] "frequencybodyaccjerkmeanz"        "frequencybodyaccjerkstdx"        
[53] "frequencybodyaccjerkstdy"         "frequencybodyaccjerkstdz"        
[55] "frequencybodygyromeanx"           "frequencybodygyromeany"          
[57] "frequencybodygyromeanz"           "frequencybodygyrostdx"           
[59] "frequencybodygyrostdy"            "frequencybodygyrostdz"           
[61] "frequencybodyaccmagmean"          "frequencybodyaccmagstd"          
[63] "frequencybodybodyaccjerkmagmean"  "frequencybodybodyaccjerkmagstd"  
[65] "frequencybodybodygyromagmean"     "frequencybodybodygyromagstd"     
[67] "frequencybodybodygyrojerkmagmean" "frequencybodybodygyrojerkmagstd"

