Question1 <- function() {
  data <- read.csv("quiz1_data.csv")
  isNa <- is.na(data$VAL)
  valData <- data[!isNa,]
  valData <- valData[valData$VAL == 24,]
  nrow(valData)
}

Question3 <-function() {
  library(xlsx)
  colIndex <-7:15
  rowIndex <-18:23
  dat <-read.xlsx("gov_NGAP.xlsx", sheetIndex=1,header=TRUE,colIndex=colIndex, rowIndex=rowIndex)
  sum(dat$Zip*dat$Ext,na.rm=T) 
  
}

Question4 <-function() {
  library(XML)
  fileUrl <- "getdata_data_restaurants.xml"
  doc <-xmlTreeParse(fileUrl,useInternal=TRUE)
  rootNode <-xmlRoot(doc)
  rest <- xpathSApply(doc,"//zipcode",xmlValue)
  rest <- rest[rest == '21231']
  length(rest)
  
}

Question5 <-function() {
  DT <-fread("ss06pid.csv")
  D <-DT[,mean(pwgtp15),by=SEX] 
  DD <- sapply(split(DT$pwgtp15,DT$SEX),mean)
  DDD <- tapply(DT$pwgtp15,DT$SEX,mean)
  
}