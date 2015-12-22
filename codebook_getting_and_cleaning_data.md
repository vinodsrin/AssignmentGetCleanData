
This code book explains the columns found in the tidy data and how it is generated

Raw data is: based on the downloaded samsung data found in the URL indicated in the assignment

The required files to be used exists in train and test folders (X and Y files).  In addition, we need the activity_label.txt and features.txt

As part of the process the script assigns the column names using values in features.txt.

Since the column names are not unique, the rownames (row number) is concated with column name.  Also the special characters like "()", "(", ")", ",", "-" are removed.

The script provided reads these files and associates the measurement data with activity and subject data.  

The loaded data is then summarized (mean) and the tidy data with below columns are generated

Codebook: 
 [1] "subject"                   "activity"                 
 [3] "tBodyAccMag_mean"          "tGravityAccMag_mean"      
 [5] "tBodyAccJerkMag_mean"      "tBodyGyroMag_mean"        
 [7] "tBodyGyroJerkMag_mean"     "fBodyAccMag_mean"         
 [9] "fBodyBodyAccJerkMag_mean"  "fBodyBodyGyroMag_mean"    
[11] "fBodyBodyGyroJerkMag_mean" "tBodyAccMag_std"          
[13] "tGravityAccMag_std"        "tBodyAccJerkMag_std"      
[15] "tBodyGyroMag_std"          "tBodyGyroJerkMag_std"     
[17] "fBodyAccMag_std"           "fBodyBodyAccJerkMag_std"  
[19] "fBodyBodyGyroMag_std"      "fBodyBodyGyroJerkMag_std" 

