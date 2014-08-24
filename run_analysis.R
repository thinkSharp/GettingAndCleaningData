run_analysis <-function() {

  # it is assumed that the data is already downloaded and unziped in a folder
  #Set the working directory to the folder where UCI HAR Dataset folder is located
  #The script will perform series of septs to come up with Tidy Data
  
  # define all the file names that is require for this analysis
  rootFolder            <- "UCI HAR Dataset/"
  activityLabelFileName <- paste(rootFolder,"/activity_labels.txt",sep="")
  featuresFileName      <- paste(rootFolder,"/features.txt",sep="")
  
  # Load features in DF this DF will in used to come up with step2 and step4
  featuresDF            <- read.table(featuresFileName,colClasses="character")
  names(featuresDF)     <- c("id","name")
  
  # identify all the columns which has mean or std string in it
  extrectedFeaturesDF   <- featuresDF[grep("mean|std",featuresDF$name,ignore.case=TRUE),]
  
  # step 2 requirements
  extrectedFeaturesIds  <- as.numeric(extrectedFeaturesDF$id)
  
  # step 4 requirements
  columnNames           <- c("subject","activity",extrectedFeaturesDF$name)
  
  # step 3 requirements - activity Name 
  activityNameDF        <- read.table(activityLabelFileName)
  
  testDF                <- create_DF("test" ,extrectedFeaturesIds,columnNames,activityNameDF) 
  trainDF               <- create_DF("train",extrectedFeaturesIds,columnNames,activityNameDF)
  
  tidyDF                <- rbind(testDF,trainDF)
  
  # get new tidy data that which is average of all the activities of all the subjects
  newTidyDf <- aggregate(. ~ subject + activity, data=tidyDF, mean)
  
  #order the new Tidy Df by Subject and Activity
  newTidyDf <- newTidyDf[order(newTidyDf$subject,newTidyDf$activity),]
  
  write.table(newTidyDf,"step5.txt",row.names=FALSE)
}

create_DF <-function(TestOrTrain,featuresIds,columnNames,activitynames) {
  # rootFolderof all the files that resides
  # constructed all the files that need to be read in order to create a tidy data
  
  rootFolder            <- "UCI HAR Dataset/"
  subjectFileName       <- paste(rootFolder,TestOrTrain, "/subject_",TestOrTrain,".txt",sep="")
  measurementsFileName  <- paste(rootFolder,TestOrTrain,"/X_",TestOrTrain,".txt",sep="")
  activityFileName      <- paste(rootFolder,TestOrTrain,"/y_",TestOrTrain,".txt",sep="")

  
  subjectDF         <- read.table(subjectFileName)
  
  measurementsDF    <- read.table(measurementsFileName)
  meanAndSTDDF      <- measurementsDF[,featuresIds]
  
  activityDF        <- read.table(activityFileName)
  
  
  # first merge activityDF with activitynames
  mActivity         <- merge(activityDF,activitynames)
  activityNameDF    <- mActivity[,2]

  #binding all the columns and form a tidy data
  tidyDF            <- cbind(subjectDF,activityNameDF,meanAndSTDDF)
  names(tidyDF)     <- columnNames
  
  tidyDF

}

