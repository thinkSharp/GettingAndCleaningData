q1 <- function() {
  data <- read.csv("ss06hid.csv")
  agrecultureLogical <- (data$ACR >=3 & data$AGS >= 6)
  which(agrecultureLogical)
}

q2 <- function() {
  d <- readJPEG("getdata_jeff.jpg", native = TRUE)
  quantile(d,probs = c(0.3,0.8))
}

q3 <- function() {
  library(plyr)
  gdp <- read.csv("getdata_data_GDP.csv", colClasses = "character",skip=4, blank.lines.skip=TRUE,na.strings="..", nrows=190)
  gdp <- gdp[,c(1,2,4,5)]
  country <- read.csv("getdata_data_EDSTATS_Country.csv",colClasses = "character")
  country <- country[,c(3,29,30,31)]
  merged <- merge(gdp,country,by.x="X.3",by.y="Table.Name")
  #arrange(merged,desc("Gross.domestic.product.2012"))
  
  names(merged) <- c("country","code","rank","gdp","IG", "sk" , "tb")
  merged[,3] <- as.numeric(merged[,3])
  merged <-merged[order(merged$rank,decreasing=TRUE),]
  merged
}

q4<-function() {
  merged<-q3()
  merged<- merged[merged$IG %in% c("High income: OECD","High income: nonOECD"),]
  merged[,3] <- as.numeric(gsub(",","", merged[,3]))
  merged <- lapply(split(merged$rank, merged$IG),mean)
  merged
}

q5 <-function() {
  merged<-q3()
  merged$rankG <- cut2(merged$rank,g=5)
  tb <- table(merged$rankG, merged$IG)
  tb
  
}

q3N <- function() {
  library(plyr)
  gdp <- read.csv("getdata_data_GDP.csv", colClasses = "character",skip=4, blank.lines.skip=TRUE,na.strings="..", nrows=190)
  gdp <- gdp[,c(1,2,4,5)]
  country <- read.csv("getdata_data_EDSTATS_Country.csv",colClasses = "character")
  country <- country[,c(1,3,29,30,31)]
  merged <- merge(gdp,country,by.x="X",by.y="CountryCode")
  ##arrange(merged,desc("Gross.domestic.product.2012"))
  
  names(merged) <- c("X","rank","country","gdp","IG", "WB" , "tb","SN")
  merged[,2] <- as.numeric(merged[,2])
  merged <-merged[order(merged$rank,decreasing=TRUE),]
  merged
  #gdp
}
