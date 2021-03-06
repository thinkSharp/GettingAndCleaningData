## Getting and Cleaning data Course Project

This readme describe the steps taken to create the tidy data and new tidy data that find the average of the measurements of the subjects by the activity.

the data the used in the analysis are already downloaded in the working directory under "UCI HAR Dataset". In order to run this function, ensure that data is already downloaded and unzipped in the mentioned folder.

### Creating Tidy Data
   - inorder to create tidy data, please download the zip data file from the following URL. https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
   - Unzip and save the data in "UCI HAR Dataset" in the working directory
   - execute run-analysis() function in the working directory (assuming the run_analysis is already in the working directory)
   - execution create step5.txt file in the working directory
   
### Functions: there are two functions in the assignments
  - create_DF(TestOrTrain,featuresIds,columnNames,activitynames)
  - run_analysis()
    
  
### create_DF(TestOrTrain,featuresIds,columnNames,activitynames)
  - This function create a Data Frame with all the desire columns
    - Parameters: TestOrTrain  - variable describing the data collection (test or train)
                : featuresIds  - Ids of the features that need to be included in the data frame
                : columnNames  - Column names of all the columns of the data frame
                : activityname - name of all the activities that were meatured by their Ids
                
### run_analysis()
  - creates common data such as activity names, column names and features Ids and called create_Df twice. One for test data and one for train data. the combilne all the rows from both calls
  - Then call aggregate function to get the average of each of the measured data by activity for the subjects
  - Then save the data in step5.txt file
  
  ++++++++++++++++++++++++++++++++++++++++++++
  
For more information regarding the actual transformation and columns please refer to CodeBook.md